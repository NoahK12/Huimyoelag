package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CatUserDTO;

public class AuthDaoImp implements AuthDAO{

	
	private SqlSessionTemplate authSqlsession;
	
	
	public AuthDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	
	public void setAuthSqlsession(SqlSessionTemplate authSqlsession) {
		this.authSqlsession = authSqlsession;
	}


	@Override
	public int registIdentifyMethod(CatUserDTO dto) {
		return authSqlsession.selectOne("auth.registIdentify",dto);
	}


	@Override
	public void RegistMethod(CatUserDTO dto) {
		authSqlsession.insert("auth.regist",dto);
	}


	@Override
	public int loginIdentifyMethod(CatUserDTO dto) {
		return authSqlsession.selectOne("auth.loginIdentify",dto);
	}


	@Override
	public int emailCheckMethod(CatUserDTO dto) {
		return authSqlsession.selectOne("auth.email_check",dto);
	}


	@Override
	public int nicknameCheckMethod(CatUserDTO dto) {
		return authSqlsession.selectOne("auth.nickname_check",dto);
	}


	//이메일로 검색시 아이디 가져오기
	@Override
	public CatUserDTO getSessionMethod(CatUserDTO dto) {
		return authSqlsession.selectOne("auth.get_session",dto);
	}
	
	
	
	
	
}
