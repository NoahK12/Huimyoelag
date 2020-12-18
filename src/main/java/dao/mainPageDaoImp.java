package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CatDTO;
import dto.CatUserDTO;

public class mainPageDaoImp implements mainPageDAO {
	private SqlSessionTemplate sqlSession;

	public mainPageDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CatUserDTO> songMethod(CatUserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main." + "list", dto);
	}

	@Override
	public List<CatDTO> songyjMethod(CatDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main." + "aList", dto);
	}

}
