package dto;

import java.util.Date;

public class PostCatReplyDTO {
	private int id, catUserId, postCatId, likeCount, replyCount;
	private String content, replyName, replyImage;
	private Date createdAt, updatedAt;
	
	public PostCatReplyDTO() {
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String cnontent) {
		this.content = cnontent;
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

	public String getReplyName() {
		return replyName;
	}

	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}

	public String getReplyImage() {
		return replyImage;
	}

	public void setReplyImage(String replyImage) {
		this.replyImage = replyImage;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	
}
