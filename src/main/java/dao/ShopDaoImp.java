package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.GetParameterDTO;
import dto.ProductCategoryDTO;
import dto.ProductDTO;
import dto.ProductMediaDTO;

public class ShopDaoImp implements ShopDAO {
	private SqlSessionTemplate sqlSession;

	public ShopDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProductDTO> productListMethod(GetParameterDTO dto) {
		return sqlSession.selectList("shop.shopList", dto);
	}

	@Override
	public List<ProductCategoryDTO> categoryListMethod() {
		return sqlSession.selectList("shop.shopCategoryList");
	}

	@Override
	public List<ProductCategoryDTO> categoryList2Method(String category) {
		return sqlSession.selectList("shop.shopCategoryList2", category);
	}

	@Override
	public List<ProductDTO> productDetailMethod(String itemId) {
		return sqlSession.selectList("shop.itemDetail", itemId);
	}

	@Override
	public void productInsertMethod(ProductDTO pdto) {
		sqlSession.insert("shop.productInsert", pdto);
	}

	@Override
	public void productMediaInsertMethod(ProductMediaDTO pmdto) {
		sqlSession.insert("shop.mediaInsert", pmdto);
	}

	@Override
	public int getLastId() {
		return sqlSession.selectOne("shop.lastId");
	}

	@Override
	public int getCategoryId(ProductCategoryDTO pcdto) {
		return sqlSession.selectOne("shop.categoryId", pcdto);
	}

	@Override
	public void readCountUpdateMethod(String itemId) {
		sqlSession.update("shop.readCountInc", itemId);
	}

	@Override
	public List<ProductMediaDTO> detailImagesMethod(String itemId) {
		return sqlSession.selectList("shop.detailImages", itemId);
	}

}
