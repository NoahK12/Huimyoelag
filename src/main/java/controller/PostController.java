package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import dto.PostDTO;
import dto.PostMediaDTO;
import dto.PostReplyDTO;
import service.FileUploadService;
import service.PostService;

@Controller
@RequestMapping("post")
public class PostController {

	private PostService service;
	private FileUploadService fileUploadService;
	private PageDTO pdto;
	int currentPage;
	

	public PostController() {
	}

	
	public void setService(PostService service) {
		this.service = service;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}
	
	@RequestMapping("list.do")
	public ModelAndView listMethod(PageDTO pv, ModelAndView mav, PostReplyDTO rdto) {
		
		/*System.out.println("cate :" + category);
		System.out.println("pdto category :" + pv.getCategory());
		
		pv.setCategory(category);*/
		
		int totalRecord = service.countProcess(pv);

		if (totalRecord >= 1) {

			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}

			
			
			
			
			pdto = new PageDTO(currentPage, totalRecord, pv.getSearchKey(), pv.getSearchWord());
			mav.addObject("pv", pdto);
			/*pdto.setCategory(pv.getCategory());*/
			mav.addObject("test", service.testListProcess(pdto));
		}
		
		mav.setViewName("postlist");
		return mav;

	}// end listMethod
	
	@RequestMapping("/view.do")
	public ModelAndView viewMethod(PageDTO pv, int id, PostReplyDTO rdto, ModelAndView mav) { // 매개변수(파라미터)를 괄호안에 선언해주면 된다. 그럼 밑에서 선언해서 쓰지 않아도 된다?
		
		/*System.out.println("view cate :" + pv.getCategory());*/
		
		System.out.println("id: " +id);
		mav.addObject("dto", service.contentProcess(id));
		System.out.println("테스트" + service.contentProcess(id).get(0).getId());
		System.out.println("테스트" + service.contentProcess(id).get(0).getUserDetail().getNickname());
		System.out.println("이미지테스트" + service.contentProcess(id).get(0).getPostMediaList().get(0).getUrl());
		
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.setViewName("postview");
		return mav;
	} // end viewMethod
	
	@RequestMapping(value = "/writeForm.do",method = RequestMethod.GET)
	public ModelAndView writeMethod(PageDTO pv, PostDTO dto, ModelAndView mav, String searchKey, HttpServletRequest req) {
		
		/*System.out.println("pv.getcate: "+ pv.getCategory());*/
		mav.addObject("searchKey", pv.getSearchKey());
		mav.addObject("searchWord", pv.getSearchWord());
		/*mav.addObject("category", pv.getCategory());*/
		
		
		mav.setViewName("postwrite");
		return mav;
	} // end writeMethod
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView writeProMethod(PageDTO pv, HttpServletRequest req, PostDTO dto, HttpServletRequest request, ModelAndView mav, List<MultipartFile> files) { // 클라이언트ip주소는 request 얘를 통해 받는다.		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("id") != null) {
			dto.setCat_user_id(Integer.parseInt(session.getAttribute("userId").toString()));
		}
		List<PostMediaDTO> postMediaList = new ArrayList<PostMediaDTO>();
		// 파일이 있을 때 파일 업로드 후 url을 받아옴
		if (!files.get(0).isEmpty()) {
			List<String> urls = new ArrayList<String>();
			System.out.println("1");
			System.out.println("file size: " + files.size());
			for (int i = 0; i < files.size(); i++) {
				System.out.println("2");
				System.out.println(files.get(i));
				String url = fileUploadService.restore(files.get(i), req);
				System.out.println(url);
				urls.add(url);

				PostMediaDTO postMediaDto = new PostMediaDTO();
				postMediaDto.setUrl(url);
				postMediaDto.setType("image");
				postMediaList.add(postMediaDto);
				System.out.println("postMediaDto: " + postMediaDto);
			}
		}
		// DB에 Upload
		
			service.insertProcess(dto, postMediaList);
		
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.addObject("searchKey", pv.getSearchKey());
		mav.addObject("searchWord", pv.getSearchWord());
		mav.setViewName("redirect:/post/list.do");
		return mav;
	} // end writeProMethod
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public ModelAndView updateMethod(int id, int currentPage, ModelAndView mav) {
		mav.addObject("dto", service.updateSelectProcess(id));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("postupdate");
		
		return mav;
	} // end updateMethod()
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView updateProMethod(PostDTO dto, int currentPage, HttpServletRequest request, ModelAndView mav) { 
				
		System.out.println("나는 멍청이 야야~ 또이또이또이~ i like it like it ");

		service.updateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/post/list.do");
		
		return mav;
		
	} // end updateProMethod
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteMethod(int id, PageDTO pv, HttpServletRequest request, ModelAndView mav) {
		
		
		service.deleteProcess(id);
		PageDTO pdto = new PageDTO(pv.getCurrentPage(), service.countProcess(pv)); // 현재페이지와 전체 레코드 수 넘기기
		if (pdto.getTotalPage()<= pv.getCurrentPage()) {
			mav.addObject("currentPage" , pdto.getTotalPage());
		} else {
			mav.addObject("currentPage", pv.getCurrentPage());
		}
		
		mav.setViewName("redirect:/post/list.do");
		return mav;
		
	}
	
} // end class


















