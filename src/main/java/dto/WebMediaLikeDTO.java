package dto;

import java.sql.Date;

public class WebMediaLikeDTO {
	private int id, catUserId, webMediaId;
	private Date createdAt;
	
	public WebMediaLikeDTO() {
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

	public int getWebMediaId() {
		return webMediaId;
	}

	public void setWebMediaId(int webMediaId) {
		this.webMediaId = webMediaId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
}
