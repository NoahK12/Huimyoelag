package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.CatDTO;
import dto.CatUserDTO;
import service.mainPageService;

@Controller
@RequestMapping("main")
public class mainPageController {
	private mainPageService service;
	
	public mainPageController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(mainPageService service) {
		this.service = service;
	}
	
	//메인 홈으로 이동
	@RequestMapping("home.do")
	public ModelAndView goMainHome(ModelAndView mav, CatUserDTO dto, CatDTO cdto) {
		mav.addObject("list", service.songProcess(dto));
		mav.addObject("aList", service.songyjProcess(cdto));
		mav.setViewName("mainHome");
		return mav;
	}
	
	
		
}
