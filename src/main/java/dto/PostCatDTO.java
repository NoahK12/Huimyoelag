package dto;

import java.util.Date;
import java.util.List;

public class PostCatDTO {
	private int id, catUserId, viewCount, cat_id, catSelect;
	private String content;
	private Date createdAt, updatedAt;
	private List<PostCatMediaDTO> mediaList;
	private List<PostCatReplyDTO> replyList;
	private PostCatReplyDTO replyCounting;
	private PostCatLikeDTO likeCounting;
	private CatUserDTO catUser;
	private CatCodeDTO catKind;
	private CatDTO cat;
	
	public PostCatDTO() {
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

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getContent() {
		return content;
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

	public List<PostCatMediaDTO> getMediaList() {
		return mediaList;
	}

	public void setMediaList(List<PostCatMediaDTO> mediaList) {
		this.mediaList = mediaList;
	}


	public PostCatLikeDTO getLikeCounting() {
		return likeCounting;
	}

	public void setLikeCounting(PostCatLikeDTO likeCounting) {
		this.likeCounting = likeCounting;
	}

	public List<PostCatReplyDTO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<PostCatReplyDTO> replyList) {
		this.replyList = replyList;
	}

	public CatUserDTO getCatUser() {
		return catUser;
	}

	public void setCatUser(CatUserDTO catUser) {
		this.catUser = catUser;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public CatCodeDTO getCatKind() {
		return catKind;
	}

	public void setCatKind(CatCodeDTO catKind) {
		this.catKind = catKind;
	}

	public CatDTO getCat() {
		return cat;
	}

	public void setCat(CatDTO cat) {
		this.cat = cat;
	}

	public PostCatReplyDTO getReplyCounting() {
		return replyCounting;
	}

	public void setReplyCounting(PostCatReplyDTO replyCounting) {
		this.replyCounting = replyCounting;
	}

	public int getCatSelect() {
		return catSelect;
	}

	public void setCatSelect(int catSelect) {
		this.catSelect = catSelect;
	}
	
}
