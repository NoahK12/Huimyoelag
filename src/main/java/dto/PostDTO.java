package dto;

import java.sql.Date;
import java.util.List;

public class PostDTO {
	private int id, catUserId, category, viewCount, view_count;
	private String title, content;
	private Date createdAt, updatedAt;
	private CatUserDTO comcNick;
	private List<PostMediaDTO> postMediaList;
	private List<PostReplyDTO> postReplyList;
	private CatUserDTO userDetail;
	private int cat_user_id;
	
	
	public PostDTO() {
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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

	public List<PostMediaDTO> getPostMediaList() {
		return postMediaList;
	}

	public void setPostMediaList(List<PostMediaDTO> postMediaList) {
		this.postMediaList = postMediaList;
	}

	public List<PostReplyDTO> getPostReplyList() {
		return postReplyList;
	}

	public void setPostReplyList(List<PostReplyDTO> postReplyList) {
		this.postReplyList = postReplyList;
	}

	public CatUserDTO getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(CatUserDTO userDetail) {
		this.userDetail = userDetail;
	}

	public void setContent(String content) {
		this.content = content;
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

	public CatUserDTO getComcNick() {
		return comcNick;
	}

	public void setComcNick(CatUserDTO comcNick) {
		this.comcNick = comcNick;
	}

	public int getCat_user_id() {
		return cat_user_id;
	}

	public void setCat_user_id(int cat_user_id) {
		this.cat_user_id = cat_user_id;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	
}
