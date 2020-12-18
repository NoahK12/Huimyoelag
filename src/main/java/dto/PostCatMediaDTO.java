package dto;

public class PostCatMediaDTO {
	private int id, postCatId;
	private String url, type;
	
	public PostCatMediaDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPostCatId() {
		return postCatId;
	}

	public void setPostCatId(int postCatId) {
		this.postCatId = postCatId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
