package dto;

import java.sql.Date;
import java.util.List;

public class ProductDTO {
	private int id, catUserId, productCateId, price, stock, saledCount, readCount;
	private float rating;
	private String title, description, brand;
	private Date createdAt, updatedAt;
	private List<ProductMediaDTO> productMediaList;

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCatUserId() {
		return catUserId;
	}

	public void setCatUserId(int catUserId) {
		this.catUserId = catUserId;
	}

	public int getProductCateId() {
		return productCateId;
	}

	public void setProductCateId(int productCateId) {
		this.productCateId = productCateId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSaledCount() {
		return saledCount;
	}

	public void setSaledCount(int saledCount) {
		this.saledCount = saledCount;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<ProductMediaDTO> getProductMediaList() {
		return productMediaList;
	}

	public void setProductMediaList(List<ProductMediaDTO> productMediaList) {
		this.productMediaList = productMediaList;
	}

}
