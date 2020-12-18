package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.WebMediaDTO;

@Repository
public class ScheduledDaoImp implements ScheduledDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ScheduledDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void delPreviousYoutubeMediaMethod() {
		sqlSession.delete("scheduler.delPreviousYoutubeMedia");
	}
	
	@Override
	public void insertYoutubeMediaMethod(String videoId) {
		sqlSession.insert("scheduler.insertYoutubeMedia", videoId);
	}
	
	@Override
	public List<WebMediaDTO> youtubeVideoIdListMethod(){
		return sqlSession.selectList("scheduler.youtubeVideoIdList");
	}

}
