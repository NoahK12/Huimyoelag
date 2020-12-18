package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.GetParameterDTO;
import dto.ProductCategoryDTO;
import dto.ProductDTO;
import dto.ProductMediaDTO;
import service.FileUploadService;
import service.ShopService;

@Controller
@RequestMapping("store")
public class ShopController {
	private ShopService service;
	private FileUploadService fileUploadService;

	public ShopController() {
		// TODO Auto-generated constructor stub
	}

	public void setService(ShopService service) {
		this.service = service;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	@RequestMapping("list.do")
	public ModelAndView shopList(ModelAndView mav, GetParameterDTO dto, HttpServletRequest req) {

		// 로그인 기능을 넣기전에 임시로 id를 0으로 넣어줌
		HttpSession session = req.getSession();
		session.setAttribute("id", 0);

		mav.addObject("categoryNum", dto.getCategory());
		mav.addObject("categorySubName", dto.getSubCategoryName());
		mav.addObject("categoryOrderBy", dto.getOrderBy());
		mav.addObject("categoryListView", service.categoryListProcess());

		if (dto.getCategory() != null) {
			mav.addObject("categoryList2View", service.categoryList2Process(dto.getCategory()));
			if (dto.getSubCategoryName() != null) {
				mav.addObject("productListView", service.productListProcess(dto));
			} else {
				mav.addObject("productListView", service.productListProcess(dto));
			}
		} else {
			mav.addObject("productListView", service.productListProcess(dto));
		}

		mav.setViewName("store");
		return mav;
	}

	@RequestMapping("writeForm.do")
	public ModelAndView itemWriteForm(ModelAndView mav) {
		mav.addObject("categoryListView", service.categoryListProcess());
		mav.setViewName("storeWrite");
		return mav;
	}

	@RequestMapping("write.do")
	public ModelAndView itemWriteProcess(ProductDTO pdto, ProductCategoryDTO pcdto, List<MultipartFile> files, ModelAndView mav, HttpServletRequest req) {
		int categoryId = service.getCategoryId(pcdto);
		pdto.setProductCateId(categoryId);
		
		System.out.println(files);
		
		List<ProductMediaDTO> pmList = new ArrayList<ProductMediaDTO>();
		
		// 파일이 있을 때 파일 업로드 후 url을 받아옴
		if (!files.get(0).isEmpty()) {
			List<String> urls = new ArrayList<String>();
			for (int i = 0; i < files.size(); i++) {
				String url = fileUploadService.restore(files.get(i), req);
				urls.add(url);

				ProductMediaDTO pmdto = new ProductMediaDTO();
				pmdto.setUrl(url);
				pmdto.setType("image");
				pmList.add(pmdto);
			}
		}
		
		service.productInsertProcess(pdto, pmList);
		
		mav.setViewName("redirect:/store/list.do");
		return mav;
	}

	@RequestMapping("detail.do")
	public ModelAndView itemDetail(ModelAndView mav, GetParameterDTO gpdto) {
		mav.addObject("productId", gpdto.getItemId());
		mav.addObject("categoryListView", service.categoryListProcess());
		mav.addObject("productDetail", service.productDetailProcess(gpdto.getItemId()));
		mav.addObject("detailImages", service.detailImagesProcess(gpdto.getItemId()));

		mav.setViewName("storeDetail");
		return mav;
	}

} // end class