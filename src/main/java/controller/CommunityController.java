package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.CatDTO;
import dto.PageDTO;
import dto.PlaceDTO;
import dto.PlaceDetailDTO;
import dto.PlaceMediaDTO;
import dto.PlaceReviewDTO;
import dto.PostCatDTO;
import dto.PostCatLikeDTO;
import dto.PostCatMediaDTO;
import dto.PostDTO;
import dto.PostMediaDTO;
import dto.PostReplyDTO;
import dto.WebMediaDTO;
import dto.WebMediaLikeDTO;
import service.CommunityService;
import service.FileUploadService;
import service.PostService;

@Controller
@RequestMapping("community")
public class CommunityController {
	private CommunityService service;
	private FileUploadService fileUploadService;
	
	private PostService postservice;
	private PageDTO pdto;
	int currentPage;

	public CommunityController() {
	}

	public void setService(CommunityService service) {
		this.service = service;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}
	
	public void setPostservice(PostService postservice) {
		this.postservice = postservice;
	}
	
	// 커뮤니티 메인 ->
	@RequestMapping("home.do")
	public ModelAndView goCommunityHome(ModelAndView mav, PostDTO dto, PostCatDTO pdto) {
		List<PostCatDTO>test = new ArrayList<>();
		test = service.photoViewprocess(pdto);
		List<String> urlList = new ArrayList<>();
		for(int i=0;i<test.size();i++) {
			urlList.add(test.get(i).getMediaList().get(0).getUrl());
		}
		/*service.postViewProcess(dto).get(index)*/
		mav.addObject("aList", service.postViewProcess(dto));
		mav.addObject("list", urlList);
		mav.setViewName("communityHome");
		return mav; 
	} 
	// <- 커뮤니티 메인
	
	// 고양이 사진 게시판 ->
	@RequestMapping("postcat/view.do")
	public ModelAndView postCatView( ModelAndView mav) {
		//임시로 로그인 세션 지정
		mav.addObject("list", service.postCatListProcess());
		mav.setViewName("postcat");
		return mav;
	}
	
	//모달 띄우기
	@RequestMapping(value="postcat/modal.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> postCatModal(HttpSession session, int postCatId){
		int userId = 0;
		List<PostCatLikeDTO> likeList = service.postCatLikeListProcess(postCatId);
		boolean likeChk = false;
		
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		
		System.out.println(likeList);
		//내가 좋아하는 글인지 체크
		for (int i = 0; i < likeList.size(); i++) {
			if (userId == likeList.get(i).getCatUserId()) {
				likeChk = true;
			}
		}
		System.out.println("likeChk: " + likeChk);
		HashMap<String, Object> modalMap = new HashMap<>();
		modalMap.put("modalDetail", service.postCatModalProcess(postCatId));
		System.out.println(service.postCatModalProcess(postCatId));
		modalMap.put("likeChk", likeChk);
		
		//뷰 카운트 증가
		service.postCatIncViewCountProcess(postCatId);
		return modalMap;
	}
	
	//reply 작성
	@RequestMapping(value="postcat/postCatReplyWrite.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Integer> postCatReplyWrite(int postCatId, int userId, String content, int replyNum){
		service.postCatReplyWriteProcess(postCatId, userId, content);
		int replyId = service.postCatGetReplyIdProcess(postCatId, userId);
		List<Integer> replyWrtie = new ArrayList<>();
		replyWrtie.add(replyId);
		replyWrtie.add(replyNum);
		return replyWrtie;
	}
	
	//post cat 삭제
	@RequestMapping(value="postcat/postCatDel.do", method=RequestMethod.GET)
	public ModelAndView postCatDel(HttpServletRequest req, ModelAndView mav, int postCatId){
		String root= req.getSession().getServletContext().getRealPath("/");
		String saveDir = root + "upload" + File.separator;
		List<PostCatDTO> dto = service.postCatModalProcess(postCatId);
		List<String> url = new ArrayList<>();
		for(int i=0;i<dto.get(0).getMediaList().size();i++) {
			url.add(dto.get(0).getMediaList().get(i).getUrl());
		}
		if (url != null) {
			for (int i = 0; i < url.size(); i++) {
				File file = new File(saveDir, url.get(i));
				file.delete();
			}
		}
		mav.setViewName("redirect:view.do");
		service.postCatDelProcess(postCatId);
		return mav;
	}
	
	@RequestMapping("post/list.do")
	public ModelAndView listMethod(PageDTO pv, ModelAndView mav, PostReplyDTO rdto) {
		
		/*System.out.println("cate :" + category);
		System.out.println("pdto category :" + pv.getCategory());
		
		pv.setCategory(category);*/
		
		int totalRecord = postservice.countProcess(pv);

		if (totalRecord >= 1) {

			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}

			
			
			
			
			pdto = new PageDTO(currentPage, totalRecord, pv.getSearchKey(), pv.getSearchWord());
			mav.addObject("pv", pdto);
			/*pdto.setCategory(pv.getCategory());*/
			mav.addObject("test", postservice.testListProcess(pdto));
		}
		
		mav.setViewName("postlist");
		return mav;

	}// end listMethod
	
	@RequestMapping("post/view.do")
	public ModelAndView viewMethod(PageDTO pv, int id, PostReplyDTO rdto, ModelAndView mav) { // 매개변수(파라미터)를 괄호안에 선언해주면 된다. 그럼 밑에서 선언해서 쓰지 않아도 된다?
		
		/*System.out.println("view cate :" + pv.getCategory());*/
		
		System.out.println("id: " +id);
		mav.addObject("dto", postservice.contentProcess(id));
		System.out.println("테스트" + postservice.contentProcess(id).get(0).getId());
		System.out.println("테스트" + postservice.contentProcess(id).get(0).getUserDetail().getNickname());
		System.out.println("이미지테스트" + postservice.contentProcess(id).get(0).getPostMediaList().get(0).getUrl());
		
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.setViewName("postview");
		return mav;
	} // end viewMethod
	
	@RequestMapping(value = "post/writeForm.do",method = RequestMethod.GET)
	public ModelAndView writeMethod(PageDTO pv, PostDTO dto, ModelAndView mav, String searchKey, HttpServletRequest req) {
		
		/*System.out.println("pv.getcate: "+ pv.getCategory());*/
		mav.addObject("searchKey", pv.getSearchKey());
		mav.addObject("searchWord", pv.getSearchWord());
		/*mav.addObject("category", pv.getCategory());*/
		
		
		mav.setViewName("postwrite");
		return mav;
	} // end writeMethod
	
	@RequestMapping(value = "post/write.do", method = RequestMethod.POST)
	public ModelAndView writeProMethod(PageDTO pv, HttpServletRequest req, PostDTO dto, HttpServletRequest request, ModelAndView mav, List<MultipartFile> files) { // 클라이언트ip주소는 request 얘를 통해 받는다.		
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") != null) {
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
		postservice.insertProcess(dto, postMediaList);
		
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.addObject("searchKey", pv.getSearchKey());
		mav.addObject("searchWord", pv.getSearchWord());
		mav.setViewName("redirect:/community/post/list.do");
		return mav;
	} // end writeProMethod
	
	@RequestMapping(value = "post/update.do", method = RequestMethod.GET)
	public ModelAndView updateMethod(int id, int currentPage, ModelAndView mav) {
		mav.addObject("dto", postservice.updateSelectProcess(id));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("postupdate");
		
		return mav;
	} // end updateMethod()
	@RequestMapping(value = "post/update.do", method = RequestMethod.POST)
	public ModelAndView updateProMethod(PostDTO dto, int currentPage, HttpServletRequest request, ModelAndView mav) { 
				
		System.out.println("나는 멍청이 야야~ 또이또이또이~ i like it like it ");

		postservice.updateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/community/post/list.do");
		
		return mav;
		
	} // end updateProMethod
	
	@RequestMapping(value = "post/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteMethod(int id, PageDTO pv, HttpServletRequest request, ModelAndView mav) {
		
		
		postservice.deleteProcess(id);
		PageDTO pdto = new PageDTO(pv.getCurrentPage(), postservice.countProcess(pv)); // 현재페이지와 전체 레코드 수 넘기기
		if (pdto.getTotalPage()<= pv.getCurrentPage()) {
			mav.addObject("currentPage" , pdto.getTotalPage());
		} else {
			mav.addObject("currentPage", pv.getCurrentPage());
		}
		
		mav.setViewName("redirect:/community/post/list.do");
		return mav;
		
	}
	
	//reply 삭제
	@RequestMapping(value="postcat/postCatReplyDel.do", method=RequestMethod.POST)
	@ResponseBody
	public void postCatReplyDel(HttpServletRequest req, int replyId){
		service.postCatReplyDelProcess(replyId);
	}
	
	//post cat 수정
	@RequestMapping(value="postcat/postCatModify.do", method=RequestMethod.POST)
	@ResponseBody
	public void postCatModify(HttpServletRequest req, int postCatId, String modifiedContent){
		service.postCatModifyProcess(postCatId, modifiedContent);
	}
	
	//reply 수정
	@RequestMapping(value="postcat/postCatReplyModify.do", method=RequestMethod.POST)
	@ResponseBody
	public void postCatReplyModify(int replyId, String modifiedReplyContent){
		System.out.println("replyId: " + replyId);
		service.postCatReplyModifyProcess(replyId, modifiedReplyContent);
		System.out.println("수정완료");
	}
	
	//좋아요 취소
	@RequestMapping(value="postcat/cancleLike.do", method=RequestMethod.POST)
	@ResponseBody
	public void cancleLike(HttpSession session, int postCatId){
		System.out.println("cancleLikeMethod");
		System.out.println("postCatId: " +postCatId);
		int userId = 0; 
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		System.out.println("userId: " + userId);
		service.postCatCancleLikeProcess(postCatId, userId);
	}
	
	//좋아요 추가
	@RequestMapping(value="postcat/incLike.do", method=RequestMethod.POST)
	@ResponseBody
	public void incLike(HttpSession session, int postCatId){
		System.out.println("postCatId: " +postCatId);
		
		int userId = 0; 
		if (session.getAttribute("user_id") != null) {
			userId = Integer.parseInt(session.getAttribute("user_id").toString());
		}
		System.out.println("userId: " + userId);
		service.postCatIncLikeProcess(postCatId, userId);
	}
	
	// 새로운 게시글 작성 페이지
	@RequestMapping(value="postcat/writeForm.do")
	public ModelAndView postCatWritePage(ModelAndView mav, int userId){
		List<CatDTO>catList = service.postCatCatListProcess(userId);
		System.out.println(catList);
		mav.addObject("catList", catList);
		mav.setViewName("postcatwrite");
		return mav;
	}
	
	// 새로운 게시글 작성 완료
	@RequestMapping(value="postcat/writeComplet.do")
	public String postCatWriteComplet(PostCatDTO postCatDto, List<MultipartFile> files, int catSelect, HttpServletRequest req){
		postCatDto.setCatSelect(catSelect);
		System.out.println("content: " +postCatDto.getContent());
		System.out.println("files chk:" + files);
		HttpSession session = req.getSession();
		// 현재 로그인된 사용자의 id를 넣어줌
		if (session.getAttribute("user_id") != null) {
			postCatDto.setCatUserId(Integer.parseInt(session.getAttribute("user_id").toString()));
		}
		List<PostCatMediaDTO> postCatMediaList = new ArrayList<PostCatMediaDTO>();
		// 파일이 있을 때 파일 업로드 후 url을 받아옴		
		if (!files.get(0).isEmpty()) {
			List<String> urls = new ArrayList<String>();
			for (int i = 0; i < files.size(); i++) {
				System.out.println(files.get(i));
				String url = fileUploadService.restore(files.get(i), req);
				System.out.println("url: " + url);
				urls.add(url);
				
				PostCatMediaDTO postCatMediaDto = new PostCatMediaDTO();
				postCatMediaDto.setUrl(url);
				postCatMediaDto.setType("image");
				postCatMediaList.add(postCatMediaDto);
			}
		}
		// DB insert
		service.postCatWritePorcess(postCatDto, postCatMediaList);
		return "redirect:view.do";
	}
	// 고양이 사진 게시판 <-
	

	// 장소 ->
	@RequestMapping("place/main.do")
	public ModelAndView placeMainProcess(ModelAndView mav) {
		mav.addObject("placeList", service.placeListProcess());
		mav.addObject("placeCategoryList", service.placeCategoryListProcess());
		mav.setViewName("place");

		return mav;
	}

	@RequestMapping("place/detail.do")
	public ModelAndView placeDetailProcess(ModelAndView mav, int placeId, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int userId = 0;

		PlaceDetailDTO placeDetail = service.placeDetailProcess(placeId);
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}

		// 내가 좋아하는 글인지 체크
		for (int i = 0; i < placeDetail.getPlaceLikeList().size(); i++) {
			if (userId == placeDetail.getPlaceLikeList().get(i).getCatUserId()) {
				placeDetail.getPlace().setMeLike(true);

				break;
			}
		}

		mav.addObject("placeDetail", placeDetail);
		mav.setViewName("placedetail");

		return mav;
	}

	@RequestMapping("place/writeForm.do")
	public ModelAndView placeWriteFormProcess(ModelAndView mav) {
		mav.setViewName("placewrite");
		return mav;
	}

	@RequestMapping("place/write.do")
	public String placeWriteProcess(PlaceDTO placeDto, List<MultipartFile> files, HttpServletRequest req) {
		HttpSession session = req.getSession();
		// 현재 로그인된 사용자의 id를 넣어줌
		if (session.getAttribute("userId") != null) {
			placeDto.setCatUserId(Integer.parseInt(session.getAttribute("userId").toString()));
		}
		List<PlaceMediaDTO> placeMediaList = new ArrayList<PlaceMediaDTO>();
		// 파일이 있을 때 파일 업로드 후 url을 받아옴
		if (!files.get(0).isEmpty()) {
			List<String> urls = new ArrayList<String>();
			for (int i = 0; i < files.size(); i++) {
				String url = fileUploadService.restore(files.get(i), req);
				urls.add(url);

				PlaceMediaDTO placeMediaDto = new PlaceMediaDTO();
				placeMediaDto.setUrl(url);
				placeMediaDto.setType("image");
				placeMediaList.add(placeMediaDto);
			}
		}
		// DB에 Upload
		service.placeWritePorcess(placeDto, placeMediaList);
		// 업로드 완료 후 main으로 redirect
		return "redirect:/community/place/main.do";
	}

	@RequestMapping("place/delete.do")
	public String placeDeleteProcess(int placeId, HttpServletRequest req) {
		String root= req.getSession().getServletContext().getRealPath("/");
		String saveDir = root + "upload" + File.separator;

		List<String> url = service.placeGetUrlProcess(placeId);
		if (url != null) {
			for (int i = 0; i < url.size(); i++) {
				File file = new File(saveDir, url.get(i));
				file.delete();
			}
		}
		service.placeDeleteProcess(placeId);

		return "redirect:/community/place/main.do";
	}

	@RequestMapping("place/like.do")
	public String placeLikeProcess(int placeId, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		service.placeLikeProcess(placeId, userId);
		return "redirect:/community/place/detail.do?placeId=" + placeId;
	}

	@RequestMapping("place/unlike.do")
	public String placeUnlikeProcess(int placeId, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		service.placeUnlikeProcess(placeId, userId);
		return "redirect:/community/place/detail.do?placeId=" + placeId;
	}

	@RequestMapping("place/writeReview.do")
	public String placeWriteReviewProcess(int placeId, int rate, String content, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int catUserId = 0;
		if (session.getAttribute("userId") != null) {
			catUserId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		PlaceReviewDTO dto = new PlaceReviewDTO();
		dto.setPlaceId(placeId);
		dto.setRating(rate);
		dto.setContent(content);
		dto.setCatUserId(catUserId);
		service.placeReviewWriteProcess(dto);
		return "redirect:/community/place/detail.do?placeId=" + placeId;
	}

	@RequestMapping("place/deleteReview.do")
	public String placeDeleteReviewProcess(int placeId, int reviewId) {
		service.placeReviewDeleteProcess(placeId, reviewId);
		return "redirect:/community/place/detail.do?placeId=" + placeId;
	}

	@RequestMapping("place/editForm.do")
	public ModelAndView placeEdtiFormProcess(ModelAndView mav, PlaceDTO placeDto) {
		int placeId = placeDto.getId();
		List<String> a = service.placeGetUrlProcess(placeId);
		System.out.println(a);
		mav.addObject("urlList", service.placeGetUrlProcess(placeId));
		mav.addObject("place", placeDto);
		mav.setViewName("placeedit");
		return mav;
	}

	@RequestMapping("place/edit.do")
	public String placeEditProcess(PlaceDTO dto) {
		service.placeEditProcess(dto);
		return "redirect:/community/place/detail.do?placeId=" + dto.getId();
	}

	@RequestMapping("place/reviewLike.do")
	public String placeEditProcess(int placeId, int reviewId) {
		service.placeReviewLike(reviewId);
		return "redirect:/community/place/detail.do?placeId=" + placeId;
	}

	// 장소 <-

	// 고양이 이미지 API ->
	//webViewVideo
	@RequestMapping("web/youtubeVideo/list.do")
	public ModelAndView youtubeList(ModelAndView mav) {
		mav.addObject("videoIdList", service.youtubeVideoIdListProcess());
		mav.setViewName("webviewvideo");
		return mav;
		
	}

	@RequestMapping("web/viewImage/list.do")
	public String goWebViewImage() {
		return "webviewimage";
	}

	// ajaxWebViewImage //json을 UTF-8로 바꿔야함 => 한글인식가능
	@RequestMapping(value = "web/viewImage/ajaxWebViewImage.do", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxWebViewImage() throws IOException {

		// 버퍼로 넘길대상 선언
		String input = "";
		String total = "";

		String path = "https://pixabay.com/api/?key=18660042-4136d08e3d3545f16e29d1cbd&q=cat&image_type=photo&per_page=100";

		// api정보를 url클래스에 넣어줌
		URL url = new URL(path);

		// URL 연결시킴(웹사이트와 연결됨)
		URLConnection urlConn = url.openConnection();

		// URL을 요청하기 위한 클래스(TCP소켓 사용)
		HttpURLConnection httpUrl = (HttpURLConnection) urlConn;
		// 기본적으로 HttpURLConnection의 요청방식은 get임
		httpUrl.setRequestMethod("GET");

		// URL에 담긴(넘어온) 내용을 읽어오기 위해 버퍼 사용
		BufferedReader reader = new BufferedReader(new InputStreamReader(httpUrl.getInputStream()));

		// URL정보를 한줄씩 읽어옴 (웹정보는 list형태로 받아짐 => 토큰 형식으로 뽑아야함)
		while ((input = reader.readLine()) != null) {
			total += input;
		}
		System.out.println(total);

		return total;
	}

	@RequestMapping("web/viewImage/catLikeImg.do")
	@ResponseBody
	public String catLikeImg(String url, WebMediaDTO mediadto, WebMediaLikeDTO likedto, HttpSession session) {

		System.out.println("이미지 url:" + url);
		// url 과 type설정
		mediadto.setUrl(url);
		mediadto.setType("image");

		// url이 DB에 있는지 없는지 체크해주기
		int checkUrl = service.checkUrlProcess(mediadto);
		System.out.println(checkUrl);

		if (checkUrl == 0) {

			// 해당 Url이 Db에 없으면 web_media부터 채워야함
			// session값 가져오기
			int userId = (Integer) session.getAttribute("userId");

			// web_media테이블에 해당 데이터 삽입 (Url과 유형삽입)
			service.webMediaInsertProcess(mediadto);

			// url로 검색해서 이미지 아이디 가져오기
			int imgId = service.selectMediaIdProcess(mediadto);

			// web_media_like테이블에 데이터 삽입
			likedto.setCatUserId(userId);// 유저정보 넣기
			likedto.setWebMediaId(imgId);// 이미지정보 넣기
			service.webMediaLikeInsertProcess(likedto);

			System.out.println("apiDB에도 저장");
		} else {
			// 유저아이디 가져옴
			int userId = (Integer) session.getAttribute("userId");

			System.out.println(userId);
			// 해당 url의 아이디를 가져옴
			int imgId = service.selectMediaIdProcess(mediadto);

			System.out.println(imgId);

			// 웹 미디어 좋아요 테이블에 유저정보와 url의 아이디값을 넣어줌
			// web_media_like테이블에 데이터 삽입
			likedto.setCatUserId(userId);// 유저정보 넣기
			likedto.setWebMediaId(imgId);// 이미지정보 넣기
			service.webMediaLikeInsertProcess(likedto);

			// 해당 Url이 web-media테이블에 잇으므로 id값을 가져와
			// web_media_like에 넣기만 하면됨

			System.out.println("좋아요 테이블에만 저장");
		}
		return "success";
	}// end catLikeImg.do
	// 고양이 이미지 API <-
	
}
