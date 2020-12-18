package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.CatUserDTO;
import service.AuthService;

@Controller
@RequestMapping("auth")
public class AuthController {
		
	private AuthService authservice;
	
	public AuthController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setAuthservice(AuthService authservice) {
		this.authservice = authservice;
	}
	
	//회원가입 페이지로 이동
	@RequestMapping("regist.do")
	public String goRegist() {
		return "authregist";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("login.do")
	public String goLogin() {
		return "authlogin";
	}
	
	
	//로그인을 위한 매핑
	@RequestMapping(value="loginIdentify.do", method=RequestMethod.POST) 
	@ResponseBody
	public String loginCheck(String returnUrl, CatUserDTO dto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		//로그인시 아이디가 있는지 검색
		dto.setId(authservice.loginIdentifyProcess(dto));
		
		//삽입
		String match="";
		
		if (dto.getId()!=0) {
			
			//로그인시 아이디값을 가져옴
			dto = authservice.getSessionProcess(dto);
			System.out.println("dto.userId: " + dto.getId());
			session.setAttribute("userId", dto.getId());
			session.setAttribute("userNickName", dto.getNickname());
			session.setAttribute("userImg", dto.getImage());
			session.setAttribute("admin", dto.getAdmin());
			match="success";
		}else {
			match="fail";
		}
		return match;
	}
	
	
	//회원가입을 위한 매핑
	@RequestMapping(value="checkRegist.do", method=RequestMethod.POST)
	@ResponseBody
	public String registProcess(CatUserDTO dto) {
		
		String nickname=dto.getNickname();
		String password =dto.getPassword();
		String email =dto.getEmail();
		System.out.println(nickname);
		System.out.println(email);
		
		
		//이메일과 인증키 검색=> 없으면 0나올거임
		dto.setId(authservice.registIdentifyProcess(dto));
		
		//삽입
		String match="";
		
		//이메일과 인증키가 있을경우
		if(dto.getId()==1) {
			
			//이메일과 인증키가 있지만, 입력한 닉네임이 중복될경우
			dto.setId(authservice.nicknameCheckProcess(dto));
			if(dto.getId()==1) {
				match="fail";
			}else {
				
				//해당 이메일일경우 나머지값 업데이트 형식으로 집어넣음
				dto.setEmail(email);
				dto.setPassword(password);
				dto.setNickname(nickname);
				dto.setEmailSecretKey("1");
				
				authservice.RegistProcess(dto);
				match="success";
				System.out.println("결과:"+match);
			}
		}else {
			//이메일과 인증키가 db데이터와 일치하지 않을 경우 => 인증해주세요라고 뜨게하기
			match="fail";
		}
		
		return match;
	}
	
	
	
	//emailCheck
	@RequestMapping(value="emailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String emailCheckProcess(CatUserDTO dto) {
		
		// String email = dto.getEmail();
		dto.setId(authservice.emailCheckProcess(dto));
		// System.out.println(dto.getId());
		
		//삽입
		String match="";
		
		//아이디가 없을경우 bd에 새로 생성해줌
		if(dto.getId()==0) {
			match="success";
		}else {
			match="fail";
		}
		return match;
	}
	
	
	
	//nicknameCheck
	@RequestMapping(value="nicknameCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String nicknameCheckProcess(CatUserDTO dto) {
		
		String nickname =dto.getNickname();
		dto.setId(authservice.nicknameCheckProcess(dto));
		
		//삽입
		String match="";
		
		if(nickname == "") {
			match="noneFail";
		}else {
			//아이디가 없을경우 bd에 새로 생성해줌
			if(dto.getId()==0) {
				match="success";
			}else {
				match="fail";
			}
		}
				
		return match;
	}
	
	
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logoutProcess(HttpSession session) {
		//세션의 속성값을 제거해줌
		session.removeAttribute("userId");
		session.removeAttribute("userNickName");
		session.removeAttribute("userImg");
		System.out.println("로그아웃");
		return "redirect:/main/home.do";
	}
	
	
	
	
}
