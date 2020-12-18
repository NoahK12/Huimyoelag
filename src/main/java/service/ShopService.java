package service;

import java.util.List;

import dto.GetParameterDTO;
import dto.ProductCategoryDTO;
import dto.ProductDTO;
import dto.ProductMediaDTO;

public interface ShopService {

	public List<ProductDTO> productListProcess(GetParameterDTO dto);

	public List<ProductCategoryDTO> categoryListProcess();

	public List<ProductCategoryDTO> categoryList2Process(String category);

	public List<ProductDTO> productDetailProcess(String itemId);
	
	public List<ProductMediaDTO> detailImagesProcess(String itemId);

	public void productInsertProcess(ProductDTO pdto, List<ProductMediaDTO> pmList);
	
	public int getCategoryId(ProductCategoryDTO pcdto);
	
	
}