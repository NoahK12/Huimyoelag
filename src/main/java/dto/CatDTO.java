package dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CatDTO {
	private int id, catUserId, catCodeId, age;
	private float weight, legLength, circumference, recCalory; 
	private char mainCat;
	private String name, status, image, gender;
	private Date createdAt, updatedAt, birthday;
	private List<CatDTO> catCodeList;
	private MultipartFile filename; 
	private MultipartFile modifiedFilename; 

	public CatDTO() {
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

	public int getCatCodeId() {
		return catCodeId;
	}

	public void setCatCodeId(int catCodeId) {
		this.catCodeId = catCodeId;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public float getLegLength() {
		return legLength;
	}

	public void setLegLength(float legLength) {
		this.legLength = legLength;
	}

	public float getCircumference() {
		return circumference;
	}

	public void setCircumference(float circumference) {
		this.circumference = circumference;
	}

	public float getRecCalory() {
		return recCalory;
	}

	public void setRecCalory(float recCalory) {
		this.recCalory = recCalory;
	}

	public char getMainCat() {
		return mainCat;
	}

	public void setMainCat(char mainCat) {
		this.mainCat = mainCat;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public List<CatDTO> getCatCodeList() {
		return catCodeList;
	}

	public void setCatCodeList(List<CatDTO> catCodeList) {
		this.catCodeList = catCodeList;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public MultipartFile getModifiedFilename() {
		return modifiedFilename;
	}

	public void setModifiedFilename(MultipartFile modifiedFilename) {
		this.modifiedFilename = modifiedFilename;
	}
	
	
}
