package dto;

import java.sql.Date;
import java.util.List;

public class PlaceDTO {
	private int id, catUserId;
	private float latitude, longitude, rating;
	private String title, content, address, phoneNumber, category;
	private Date createdAt, updatedAt;
	private List<PlaceMediaDTO> placeMediaList;
	private boolean meLike;
	
	public PlaceDTO() {
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	
	public List<PlaceMediaDTO> getPlaceMediaList() {
		return placeMediaList;
	}
	
	public void setPlaceMediaList(List<PlaceMediaDTO> placeMediaList) {
		this.placeMediaList = placeMediaList;
	}
	
	public boolean isMeLike() {
		return meLike;
	}
	
	public void setMeLike(boolean meLike) {
		this.meLike = meLike;
	}
	
}
