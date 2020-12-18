package dao;

import java.util.List;

import dto.CatDTO;
import dto.CatUserDTO;

public interface MyPageDAO{

	// 처음 마이페이지 들어왔을때 내 고양이 리스트 출력
	public List<CatDTO> firstMycatListMethod(int firstuserId);
	
	//내고양이 삽입
	public void insertMyCatMethod(CatDTO dto);
	
	//내고양이 삽입후 리스트 출력
	public List<CatDTO> selectMyCatMethod(int userId);
	
	//유저 정보 불러옴
	public List<CatUserDTO> userInfoMethod(int userId);
	
	//고양이 정보 한개 가져옴
	public List<CatDTO> lookMyCatOneMethod(CatDTO dto);
	
	//카드 삭제
	public void cardDeleteMethod(CatDTO dto);
	
	//카드 수정
	public void updateCatMethod(CatDTO dto);
}
