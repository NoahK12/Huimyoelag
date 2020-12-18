package service;

import java.util.List;

import dto.CatDTO;
import dto.CatUserDTO;

public interface MyPageService{

	//처음 페이지들어왔을때 유저 고양이 정보
	public List<CatDTO> firstMycatListProcess(int userId);
	
	//내고양이 삽입
	public List<CatDTO> insertMyCatProcess(CatDTO dto, int userId);
	
	//유저정보 가져옴
	public List<CatUserDTO> userInfoProcess(int userId);
	
	//내고양이 한개 가져옴
	public List<CatDTO> lookMyCatOneProcess(CatDTO dto);
	
	//카드 삭제한후 출력
	public List<CatDTO> cardDeleteProcess(CatDTO deletedto,int userId);
	
	//카드 수정후 리스트 출력
	public List<CatDTO> updateProcess(CatDTO updatedto, int userId);
	
}
