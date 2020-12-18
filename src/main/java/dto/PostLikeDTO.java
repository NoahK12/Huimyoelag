package dto;

import java.sql.Date;

public class PostLikeDTO {
	private int id, catUserId, postId;
	private Date createdAt;
	
	public PostLikeDTO() {
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

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
