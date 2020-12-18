package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.CatUserDTO;
import service.MailSendService;

@Controller
public class MailSendController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	private MailSendService mailSendservice;
	
	
	public void setMailSendservice(MailSendService mailSendservice) {
		this.mailSendservice = mailSendservice;
	}
	 
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	
	//이메일 입력하는 폼 생성
	@RequestMapping("auth/sendMail.do")
	public String sendMailGo() {
		return "auth/registSendMail/sendMail";
	}
	
	
	//이메일에 인증키 보내기
	@RequestMapping(value="auth/MailCheck.do",  method=RequestMethod.POST)
	public ModelAndView sendMailResultGo(ModelAndView mv, String email, HttpServletResponse response_email,HttpServletRequest request,CatUserDTO dto) throws IOException {
		
		//매핑된 이메일인증키를 가져옴
		System.out.println("회원이메일"+email);
		
		//난수로 인증번호 생성
		Random ran = new Random();
		int key = ran.nextInt(4589362) +49311;
		String Stringkey=Integer.toString(key);

		System.out.println("난수:"+Stringkey);
		
		
		//이메일 보내는 사람
		String setfrom ="atome9797@gmail.com";
		//이메일 받는 사람
		String tomail = request.getParameter("email");
		//이메일 타이틀
		String title = "회원가입 인증 메일 입니다.";
		//이메일 내용 - 인증키도 같이 보내기
		String content = "안녕하세요. 고양이 집사 사이트입니다.   "
         		+ "인증번호입니다.   [ "
        		 + key +" ]";
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
 					true, "UTF-8");

 			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
 			messageHelper.setTo(tomail); // 받는사람 이메일
 			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
 			messageHelper.setText(content); // 메일 내용

 			mailSender.send(message);
 			System.out.println("완료");
		}catch (Exception e) {
			System.out.println(e);
		}
		
		dto.setEmail(email);
		
		//DB에 데이터 넣어줌 (email과 key값 넣어줌)
		//key는 int로 저장하고 가져올떈 
		dto.setEmailSecretKey(Stringkey);//Stringkey
		dto.setEmail(email);
		dto.setPassword("1");
		//닉네임도 unique임
		Random ran2 = new Random();
		int key2 = ran2.nextInt(4589362) +49311;
		String Stringkey2=Integer.toString(key2);
		dto.setNickname(Stringkey2);
		dto.setImage("noImage.png");
		//DB에 insert
		mailSendservice.keyDataProcess(dto);
		
		//다음텍스트를 html형식으로 받음
        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        mv.setViewName("auth/registSendMail/emailCheck");     //뷰의이름
        mv.addObject("dto",dto); //이메일 넘겨줌
        System.out.println("mv : "+mv);
        return mv;
	        
	}//end
	
	
	
	//인증번호 비교 컨트롤
	@RequestMapping(value="auth/emailChecking.do" , method=RequestMethod.POST)
	@ResponseBody
	public String emailChecking(CatUserDTO dto,String email, String emailSecretKey) throws IOException {
		
		System.out.println("이메일:"+email);
		//파라미터로 받은 값
		System.out.println("인증번호:"+emailSecretKey);
		
		dto.setEmail(email);
		
		//이메일에 담겨있는인증키값을 가져와야함
		String secretKey= mailSendservice.keyDataGetProcess(dto);
		
		String match="";
		if (secretKey.equals(emailSecretKey)) {
	        match="true";
	        System.out.println("true");
		}else {
	         match="false";
	         //일치하지않을땐 저장해둔 이메일정보 삭제해야함
	         mailSendservice.emailDeleteProcess(dto);
	         System.out.println("false");
		}
		
		return match;
		
		
	}//end emailChecking
	
	
	//페이지 벗어날때 이메일값 있으면 삭제해줌
	@RequestMapping(value="auth/outEmailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String outEmailCheck(String email,CatUserDTO dto) {
		
		dto.setEmail(email);
		System.out.println("리로드:"+email);
		
		//이메일값이 01인지 판단
		int num=mailSendservice.emailCheckProcess(dto);
		
		//등록후 검사기 때문에 password가 1이아니면 결과값0나옴
		if(num==1) {
			mailSendservice.emailDeleteProcess(dto);
			System.out.println("삭제할 이메일 있음");
		}else {			
			System.out.println("삭제할 이메일 없음");
		}
		
		return "registOut";
		
	}
	
	
	//비밀번호 찾기
	@RequestMapping("auth/findpw.do")
	public String findPassword() {
		return "auth/findPassSendMail/findPassWord";
	}
	
	
	//비밀번호를 찾을 이메일이 있는지 없는지 판단
	@RequestMapping(value="auth/checkMailPass.do",method=RequestMethod.POST)
	@ResponseBody
	public String checkMailPass(CatUserDTO dto, String email) {
		
		dto.setEmail(email);
		System.out.println(email);
		
		//이메일값이 01인지 판단 => 비밀번호 찾기는 있어야 참임
		int num=mailSendservice.emailCheckProcess(dto);
		
		String match="";
		if(num==1) {
			match="success";
			System.out.println("성공");
		}else {
			System.out.println("실패");
			match="fail";
		}
		
		return match;
	}
	
	
	//인증키 DB에 넣은후 인증키 입력창으로 이동
	@RequestMapping(value="auth/updateKey.do",method=RequestMethod.POST)
	public ModelAndView updateKey(ModelAndView mv, String email, HttpServletResponse response_email,HttpServletRequest request,CatUserDTO dto) throws IOException {
		
		//매핑된 이메일인증키를 가져옴
			System.out.println("회원이메일"+email);
			
			//난수로 인증번호 생성
			Random ran = new Random();
			int key = ran.nextInt(4589362) +49311;
			String Stringkey=Integer.toString(key);

			System.out.println("난수:"+Stringkey);
			
			
			//이메일 보내는 사람
			String setfrom ="atome9797@gmail.com";
			//이메일 받는 사람
			String tomail = request.getParameter("email");
			//이메일 타이틀
			String title = "회원가입 인증 메일 입니다.";
			//이메일 내용 - 인증키도 같이 보내기
			String content = "안녕하세요. 고양이 집사 사이트입니다.   "
	         		+ "인증번호입니다.   [ "
	        		 + key +" ]";
			
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	 					true, "UTF-8");

	 			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	 			messageHelper.setTo(tomail); // 받는사람 이메일
	 			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	 			messageHelper.setText(content); // 메일 내용

	 			mailSender.send(message);
	 			System.out.println("완료");
			}catch (Exception e) {
				System.out.println(e);
			}
			
			//DB에 데이터 넣어줌 (email과 key값 넣어줌)
			//key는 int로 저장하고 가져올떈 
			dto.setEmailSecretKey(Stringkey);//Stringkey
			dto.setEmail(email);

			//DB에 update -> 해당 이메일일때 인증키 변경
			mailSendservice.updateKeyProcess(dto);
			
			//다음텍스트를 html형식으로 받음
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
	        out_email.flush();
	        mv.setViewName("auth/findPassSendMail/passFind");     //뷰의이름
	        mv.addObject("dto",dto); //이메일 넘겨줌
	        System.out.println("mv : "+mv);
	        return mv;
	}
	
	
	
}
