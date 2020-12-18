package service;

import java.util.List;

import dao.ShopDAO;
import dto.GetParameterDTO;
import dto.ProductCategoryDTO;
import dto.ProductDTO;
import dto.ProductMediaDTO;

public class ShopServiceImp implements ShopService {

	private ShopDAO shopdao;

	public ShopServiceImp() {
		// TODO Auto-generated constructor stub
	}

	public void setShopdao(ShopDAO shopdao) {
		this.shopdao = shopdao;
	}

	@Override
	public List<ProductDTO> productListProcess(GetParameterDTO dto) {
		return shopdao.productListMethod(dto);
	}

	@Override
	public List<ProductCategoryDTO> categoryListProcess() {
		return shopdao.categoryListMethod();
	}

	@Override
	public List<ProductCategoryDTO> categoryList2Process(String category) {
		return shopdao.categoryList2Method(category);
	}

	@Override
	public List<ProductDTO> productDetailProcess(String itemId) {
		shopdao.readCountUpdateMethod(itemId);
		return shopdao.productDetailMethod(itemId);
	}

	@Override
	public void productInsertProcess(ProductDTO pdto, List<ProductMediaDTO> pmList) {
		shopdao.productInsertMethod(pdto);
		int id = shopdao.getLastId();
		System.out.println("id= " + id);

		for (int i = 0; i < pmList.size(); i++) {
			pmList.get(i).setProductId(id);
			shopdao.productMediaInsertMethod(pmList.get(i));
		}
	}

	@Override
	public int getCategoryId(ProductCategoryDTO pcdto) {
		return shopdao.getCategoryId(pcdto);
	}

	@Override
	public List<ProductMediaDTO> detailImagesProcess(String itemId) {
		return shopdao.detailImagesMethod(itemId);
	}

}