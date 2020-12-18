package dao;

import java.util.List;

import dto.GetParameterDTO;
import dto.ProductCategoryDTO;
import dto.ProductDTO;
import dto.ProductMediaDTO;

public interface ShopDAO {

	// 상품리스트
	public List<ProductDTO> productListMethod(GetParameterDTO dto);

	// 메인카테고리
	public List<ProductCategoryDTO> categoryListMethod();

	// 메인 하위 카테고리
	public List<ProductCategoryDTO> categoryList2Method(String category);

	// 상품 세부정보
	public List<ProductDTO> productDetailMethod(String itemId);
	
	// 세부 이미지
	public List<ProductMediaDTO> detailImagesMethod(String itemId);

	// 조회수 증가
	public void readCountUpdateMethod(String itemId);

	// 상품등록
	public void productInsertMethod(ProductDTO pdto);

	// 상품 이미지 등록
	public void productMediaInsertMethod(ProductMediaDTO pmdto);

	// 카테고리 ID
	public int getCategoryId(ProductCategoryDTO pcdto);

	// 내림차순 정렬 첫번째 ID 추출
	public int getLastId();
	
}
