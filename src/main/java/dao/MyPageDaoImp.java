package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CatDTO;
import dto.CatUserDTO;

public class MyPageDaoImp implements MyPageDAO {

private SqlSessionTemplate myPageSqlsession;
	
	public void setMyPageSqlsession(SqlSessionTemplate myPageSqlsession) {
		this.myPageSqlsession = myPageSqlsession;
	}
	
	public MyPageDaoImp() {
		// TODO Auto-generated constructor stub
	}


	//내고양이 삽입
	@Override
	public void insertMyCatMethod(CatDTO dto) {
		myPageSqlsession.insert("myPage.insert_mycat",dto);
	}

	//내고양이 리스트 출력
	@Override
	public List<CatDTO> selectMyCatMethod(int userId) {
		return myPageSqlsession.selectList("myPage.select_mycat", userId);
	}

	//처음 마이페이지 들어왔을때 내고양이 리스트
	@Override
	public List<CatDTO> firstMycatListMethod(int firstuserId) {
		return myPageSqlsession.selectList("myPage.first_select_cat",firstuserId);
	}

	//유저 정보 불러옴
	@Override
	public List<CatUserDTO> userInfoMethod(int userId) {
		return myPageSqlsession.selectList("myPage.userInfo",userId);
	}

	//고양이 정보 한개 불러옴
	@Override
	public List<CatDTO> lookMyCatOneMethod(CatDTO catddto) {
		return myPageSqlsession.selectList("myPage.lookone",catddto);
	}
	
	//고양이 카드 삭제함
	@Override
	public void cardDeleteMethod(CatDTO deletedto) {
		myPageSqlsession.delete("myPage.cardDelete",deletedto);
	}
	
	//고양이 카드 수정
	@Override
	public void updateCatMethod(CatDTO updatedto) {
		myPageSqlsession.update("myPage.cardUpdate",updatedto);
	}
	
	
	
	
}
