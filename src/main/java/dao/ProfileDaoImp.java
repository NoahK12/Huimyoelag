package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CatUserDTO;

public class ProfileDaoImp implements ProfileDAO {
	private SqlSessionTemplate profileSqlSession;

	public ProfileDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setProfileSqlSession(SqlSessionTemplate profileSqlSession) {
		this.profileSqlSession = profileSqlSession;
	}

	@Override
	public List<CatUserDTO> profileView(CatUserDTO dto) {
		return profileSqlSession.selectList("profile.profileModify", dto);
	}

	@Override
	public List<CatUserDTO> profileUpdate(CatUserDTO dto) {
		profileSqlSession.update("profile.profileUpdate", dto);
		return profileSqlSession.selectList("profile.profileModify", dto);

	}

	@Override
	public int checkNickname(CatUserDTO dto) {
		return profileSqlSession.selectOne("profile.nicknameCheck", dto);
	}

}
