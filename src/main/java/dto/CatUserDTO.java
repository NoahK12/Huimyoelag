package dto;

import java.sql.Date;

public class CatUserDTO {
	private int id ;
	private String password, email, nickname, image, emailSecretKey;
	private char admin;
	private Date createdAt, updatedAt;
	
	
	public CatUserDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public char getAdmin() {
		return admin;
	}

	public void setAdmin(char admin) {
		this.admin = admin;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getImage() {
		return image;
	}

	public String getEmailSecretKey() {
		return emailSecretKey;
	}

	public void setEmailSecretKey(String emailSecretKey) {
		this.emailSecretKey = emailSecretKey;
	}

	

	
	
	
	
	
	
}
