package service;

import java.util.List;

import dao.MyPageDAO;
import dto.CatDTO;
import dto.CatUserDTO;

public class MyPageServiceImp implements MyPageService {

	private MyPageDAO mypagedao;
	
	
	public MyPageServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMypagedao(MyPageDAO mypagedao) {
		this.mypagedao = mypagedao;
	}

	
	//db에 값 삽입 및 리스트로 출력
	@Override
	public List<CatDTO> insertMyCatProcess(CatDTO dto, int userId) {

		mypagedao.insertMyCatMethod(dto);
		
		return mypagedao.selectMyCatMethod(userId);
	}

	
	//맨처음 마이페이지 고양이 리스트
	@Override
	public List<CatDTO> firstMycatListProcess(int userId) {
		return mypagedao.firstMycatListMethod(userId);
	}

	//유저정보 가져옴
	@Override
	public List<CatUserDTO> userInfoProcess(int userId) {
		return mypagedao.userInfoMethod(userId);
	}

	//고양이 카드 정보 한개 가져옴
	@Override
	public List<CatDTO> lookMyCatOneProcess(CatDTO catddto) {
		// TODO Auto-generated method stub
		return mypagedao.lookMyCatOneMethod(catddto);
	}

	//카드 삭제후 출력
	@Override
	public List<CatDTO> cardDeleteProcess(CatDTO deletedto,int userId) {
		
		//카드 삭제
		mypagedao.cardDeleteMethod(deletedto);
		
		//카드 삭제후 내 고양이카드 출력
		return mypagedao.firstMycatListMethod(userId);
	}

	//카드 수정후 리스트 출력
	@Override
	public List<CatDTO> updateProcess(CatDTO updatedto, int userId) {
		
		//카드 수정
		mypagedao.updateCatMethod(updatedto);
		
		return mypagedao.firstMycatListMethod(userId);
	}
	
	
	
	
	
}
