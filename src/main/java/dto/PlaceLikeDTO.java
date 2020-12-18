package dto;

import java.sql.Date;

public class PlaceLikeDTO {
	private int id, catUserId, placeId;
	private Date createdAt;
	private CatUserDTO catUser;
	
	public PlaceLikeDTO() {
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

	public int getPlaceId() {
		return placeId;
	}

	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	public CatUserDTO getCatUser() {
		return catUser;
	}
	
	public void setCatUser(CatUserDTO catUser) {
		this.catUser = catUser;
	}
	
}
