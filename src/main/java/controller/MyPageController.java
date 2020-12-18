package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.CatDTO;
import dto.CatUserDTO;
import service.CatCareService;
import service.MyPageService;
import service.ProfileService;

@Controller
@RequestMapping("mypage")
public class MyPageController {
	private ProfileService profileService;
	private CatCareService catCareService;
	private MyPageService service;
	
	public MyPageController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	
	public void setCatCareService(CatCareService catCareService) {
		this.catCareService = catCareService;
	}
	
	public void setService(MyPageService service) {
		this.service = service;
	}
	
	// profile start ->
	/* 회원정보페이지 */
	@RequestMapping("profileview.do")
	public ModelAndView profileViewMethod(ModelAndView mav, CatUserDTO dto, HttpSession session) {
		session.setAttribute("id", 1);
		dto.setId(1);
		mav.addObject("aList", profileService.proflieViewProcess(dto));
		mav.setViewName("profileView");
		return mav;
	}

	/* 정보수정페이지 */
	@RequestMapping(value = "profileupdate.do")
	public ModelAndView profileUpdateMethod(ModelAndView mav, CatUserDTO dto) {
		mav.addObject("aList", profileService.proflieViewProcess(dto));
		mav.setViewName("profileUpdate");
		return mav;
	}

	/* 수정처리요청 */
	@RequestMapping(value = "profilemodify.do", method = RequestMethod.POST)
	@ResponseBody
	public String profileModifyMethod(CatUserDTO dto) {
		System.out.println(dto.getEmail());
		System.out.println(dto.getNickname());
		System.out.println(dto.getPassword());
		String nickname = dto.getNickname();
		String password = dto.getPassword();
		String email = dto.getEmail();
		int num = profileService.checkNicknameProcess(dto);
		String result = "";

		if (num == 0) {

			dto.setEmail(email);
			dto.setPassword(password);
			dto.setNickname(nickname);
			profileService.profileUpdateProcess(dto);
			result = "success";
			System.out.println(result);
		} else {
			System.out.println("false");
			dto.setEmail(email);
			dto.setNickname(nickname);
			result = "false";
		}
		return result;
	}
	// <- profile end
	
	// catcare start ->
	/* 권장칼로리 */
	@RequestMapping("Recommendedcalorie.do")
	public ModelAndView Recommendedcalorieview(ModelAndView mav) {
		HashMap<String, Object> map=new HashMap<String,Object>();
		map.put("6개월미만", 1);
		map.put("건강한성묘", 2);
		map.put("운동량이적은성묘", 3);
		map.put("노령묘", 4);
		mav.setViewName("recommendedCalorie"); 
		return mav; 
	} 
	/* 권장칼로리 값처리요청 */
	@RequestMapping(value="RecommendedcalorieResult.do", method = RequestMethod.POST)
	public ModelAndView RecommendedcalorieResultview(ModelAndView mav, double weight, String option) {
		int result = catCareService.RecommendedProcess(weight, option); 
		mav.setViewName("recommendedCalorieResult");
		mav.addObject("result", result);
		mav.addObject("weight", weight);
		mav.addObject("option", option);
		return mav;
	}  
 
	/* 나이계산기 */ 
	@RequestMapping("catage.do")
	public ModelAndView CatAgeview(ModelAndView mav) {
		mav.setViewName("catAge");
		return mav;
	}

	/* 나이계산기 처리요청 */
	@RequestMapping("catageResult.do")
	public ModelAndView CatAgeResultView(ModelAndView mav, int birthYear) {
		int result = 0;
		int num = catCareService.ageProcess(birthYear);
		if (num == 0) { 
			result = 10;
		} else if (num == 1) {
			result = 15;
		} else if (num == 2) {
			result = 24;
		} else if (num == 3) {
			result = 28;
		} else if (num == 4) {
			result = 32;
		} else if (num == 5) {
			result = 36;
		} else if (num == 6) {
			result = 40;
		} else if (num == 7) {
			result = 44;
		} else if (num == 8) {
			result = 48;
		} else if (num == 9) {
			result = 52;
		} else if (num == 10) {
			result = 56;
		} else if (num == 15) {
			result = 76;
		} else if (num == 20) {
			result =96;
		} else {
			result = num*4;
		}
		mav.addObject("result", result);
		mav.addObject("birthYear", birthYear);
		mav.setViewName("catAgeResult");
		return mav;
	}

	/* 비만도계산기 */
	@RequestMapping("catfat.do")
	public ModelAndView CatFatnessview(ModelAndView mav) {
		mav.setViewName("catFatness");
		return mav; 
	}

	/* 비만도계산기 값처리요청 */
	@RequestMapping(value = "catfatResult.do", method = RequestMethod.POST)
	public ModelAndView catfatInsert(ModelAndView mav, double circumference, double Calflength) {
		String result = "";
		double num = catCareService.catfatProcess(circumference, Calflength);
		if (num >= 40) {
			result = "비만 입니다. 관리가 필요합니다.";
		} else if (num >= 30) {
			result = "과체중입니다. 관리가 필요합니다.";
		} else if (num >= 20) {
			result = "정상체중입니다. 아주 좋아요.";
		} else {
			result = "저체중입니다. 훨씬 더 많이 밥을 줘도 괜찮아요.";
		}
		mav.setViewName("catFatnessResult");
		mav.addObject("result", result);
		mav.addObject("circumference",circumference);
		mav.addObject("Calflength",Calflength);
		return mav;  
	}
	// <- catcare end
	
	// cat profile start ->
	//마이페이지로 이동
	@RequestMapping("/myPage.do")
	public ModelAndView doMyPage(HttpSession session, ModelAndView mav) {
		
		int registNum = (Integer) session.getAttribute("userId");
		System.out.println("마이페이지 회원 번호"+registNum);
		
		//내 고양이 정보 가져옴
		mav.addObject("myCatList", service.firstMycatListProcess(registNum));
		System.out.println("list:" + service.firstMycatListProcess(registNum));
		//내 정보 가져옴
		mav.addObject("userInfoList", service.userInfoProcess(registNum));
		mav.setViewName("mypageHome");
		
		return mav;
	}

	//내고양이 저장
	@RequestMapping(value="/myCatSubmit.do", method = RequestMethod.POST)
	public ModelAndView insertMyCat(String body_status, CatDTO catdto,HttpSession session,ModelAndView mav,HttpServletRequest request) {
		
		System.out.println(body_status);
		catdto.setStatus(body_status);
		catdto.setMainCat('0');
		
		System.out.println("앞");
		
		MultipartFile file=catdto.getFilename();
		//첨부파일이 있으면
		System.out.println("파일명"+file);
		
		if(!file.isEmpty()) {
			//파일명을 유니크값으로 랜덤형태로 생성해줌
			UUID random= saveCopyFile(file,request);
			//파일명 저장함
			catdto.setImage(random+"_"+file.getOriginalFilename());
		}
		
		
		
		int userId=(Integer)session.getAttribute("userId");
		int id=catdto.getCatCodeId();
		
		System.out.println(id);
		System.out.println(catdto.getImage());
		System.out.println("유저아이디:"+userId);
		
		catdto.setCatUserId(userId);
		//내고양이 추가 및 가져오기
		
		System.out.println(service.userInfoProcess(userId));
		
		mav.addObject("aList",service.insertMyCatProcess(catdto,userId));
		System.out.println("list: " + service.insertMyCatProcess(catdto,userId));
		mav.addObject("userInfoList", service.userInfoProcess(userId));
		System.out.println("userInfo: "  + service.userInfoProcess(userId));
		mav.setViewName("redirect:/mypage/myPage.do");
		
		return mav;
	}

	
	private UUID saveCopyFile(MultipartFile file, HttpServletRequest request) {
		
		//파일의 본래 이름을 저장시킴 
		String fileName= file.getOriginalFilename();
		
		UUID random= UUID.randomUUID();
		
		//위에 선언된 공용 클래스 삽입
		String saveDirectory =filePath(request);
		
		
		System.out.println(saveDirectory);
		File fe= new File(saveDirectory);
		
		//1)fe.폴더 없으면 생성 => fe는 조건시 발동됨
		if(!fe.exists()) {
			fe.mkdir();
		}
		
		//파일명의 중복제거를 위해 사용  (랜덤주소 와 본래 파일명을 함친 파일명을 생성함)
		File ff= new File(saveDirectory,random+"_"+fileName);//파일명의중복을제거하기위해
		try {
									//file에서 읽어와 스트림에 copy해줌=> 파일명 생성됨
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return random;
	}

	//공용으로 사용될것을 따로 빼놓음
	public String filePath(HttpServletRequest request) {
		
		String root= request.getSession().getServletContext().getRealPath("/");
		String saveDirectory= root+"upload"+ File.separator;//구분자줌
		return saveDirectory;
	}
	
	
	//고양이 상세 검색
	@RequestMapping("/lookModal.do")
	@ResponseBody
	public List<CatDTO> lookCat(int catid, CatDTO catddto, HttpSession session) {
		
		catddto.setId(catid);
		System.out.println("고양이 한개:"+catddto.getId());
		
		catddto.setCatUserId((Integer) session.getAttribute("userId"));
		System.out.println("유저아이디:"+catddto.getCatUserId());
		
		//선택적 고양이 정보 가져오기
		System.out.println(service.lookMyCatOneProcess(catddto));
		
		return service.lookMyCatOneProcess(catddto);
	}
	
	
	//내 고양이 삭제
	@RequestMapping(value="/cardDelete.do" ,method=RequestMethod.POST)
	@ResponseBody
	public List<CatDTO> cardDelete(CatDTO deletedto, HttpSession session){
		
		deletedto.setCatUserId((Integer) session.getAttribute("userId"));
		System.out.println("유저아이디:"+deletedto.getCatUserId());
		
		System.out.println("카드 아이디:"+deletedto.getId());
		
		//고양이 카드 삭제 및 출력
		System.out.println(service.cardDeleteProcess(deletedto,deletedto.getCatUserId()));
		
		
		return service.cardDeleteProcess(deletedto,deletedto.getCatUserId());
	}
	
	
	//내 고양이 수정전 보이게하기
	@RequestMapping(value="/cardUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public List<CatDTO> cardUpdate(CatDTO updatedto, HttpSession session){
		
		updatedto.setCatUserId((Integer) session.getAttribute("userId"));
		System.out.println("유저 아이디 : "+ updatedto.getCatUserId());
		System.out.println("카드 아이디:" + updatedto.getId());
		
		//선택적 고양이 정보 가져오기
		System.out.println(service.lookMyCatOneProcess(updatedto));
		
		return  service.lookMyCatOneProcess(updatedto);
	}
	
	
	//내 고양이 수정 버튼 누를시 발동
	@RequestMapping(value="updateSubmit.do", method=RequestMethod.POST)
	public ModelAndView cardupdate(CatDTO cardupdatedto, HttpSession session,ModelAndView updatemav,HttpServletRequest request){
		
		cardupdatedto.setCatUserId((Integer) session.getAttribute("userId"));
		
		System.out.println(cardupdatedto.getId());
		System.out.println(cardupdatedto.getCatUserId());
		
		MultipartFile file=cardupdatedto.getModifiedFilename();
		//첨부파일이 있으면
		System.out.println("파일명"+file);
		System.out.println("----------1-------------");
		System.out.println(cardupdatedto.getStatus());
		if(!file.isEmpty()) {
			//파일명을 유니크값으로 랜덤형태로 생성해줌
			UUID random= saveCopyFile(file,request);
			//파일명 저장함
			cardupdatedto.setImage(random+"_"+file.getOriginalFilename());
			System.out.println("----------2-------------");
		}
		//수정 후 리스트 보여줌
		System.out.println(service.updateProcess(cardupdatedto,cardupdatedto.getCatUserId()));
		System.out.println("----------3-------------");
		
		updatemav.addObject("aList",service.insertMyCatProcess(cardupdatedto,cardupdatedto.getId()));
		System.out.println("----------4-------------");
		updatemav.addObject("userInfoList", service.userInfoProcess(cardupdatedto.getId()));
		System.out.println("----------5-------------");
		updatemav.setViewName("mypageHome");
		
		return updatemav;
	}
	// cat profile end ->
}
