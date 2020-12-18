package dto;

import java.util.Date;


public class PostCatLikeDTO {
	private int id, catUserId, postCatId, likeCount;
	private Date createdAt;
	private CatUserDTO catUser;
	
	public PostCatLikeDTO() {
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

	public int getPostCatId() {
		return postCatId;
	}

	public void setPostCatId(int postCatId) {
		this.postCatId = postCatId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public CatUserDTO getCatUser() {
		return catUser;
	}

	public void setCatUser(CatUserDTO catUser) {
		this.catUser = catUser;
	}
	
}
