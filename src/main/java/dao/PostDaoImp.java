package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CatUserDTO;
import dto.PageDTO;
import dto.PostDTO;
import dto.PostLikeDTO;
import dto.PostMediaDTO;
import dto.PostReplyDTO;
import dto.WebMediaDTO;

public class PostDaoImp implements PostDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public PostDaoImp() {

	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	

	@Override
	public int count(PageDTO pv) {
		
		return sqlSession.selectOne("post.count",pv);
	}

	@Override
	public List<PostDTO> list(PageDTO pv) {
		
		return sqlSession.selectOne("post.list", pv);
	}

	@Override
	public void readCount(int postId) {
		sqlSession.update("post.post_ViewCount", postId);
		
	}

	@Override
	public List<PostDTO> content(int id) {
		
		return sqlSession.selectList("post.view", id);
	}

	@Override
	public void insert(PostDTO dto) {
		sqlSession.insert("post.post_insert", dto);
		
	}

	@Override
	public PostDTO updateNum(int postId) {
		
		return sqlSession.selectOne("post.content", postId);
	}

	@Override
	public void update(PostDTO dto) {
		sqlSession.update("post.post_Modify", dto);
		
	}

	@Override
	public void delete(int postId) {
		sqlSession.delete("post.post_Del", postId);
		
	}

	@Override
	public void replyInsertMethod(PostReplyDTO rdto) {
		sqlSession.insert("post.post_ReplyWrite",rdto);
		
	}

	@Override
	public List<PostReplyDTO> replyListMethod(int id) {
		
		return sqlSession.selectList("post.post_list",id);
	}

	@Override
	public void replyDeleteMethod(int id) {
		sqlSession.delete("post.post_ReplyDel",id);
		
	}

	@Override
	public void replyUpdateMethod(PostReplyDTO rdto) {
		sqlSession.update("post.post_ReplyModify",rdto);
		
	}

	@Override
	public List<PostLikeDTO> postLikeListMethod(int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> postCategoryListMethod() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void postMediaInsertMethod(PostMediaDTO dto) {
		sqlSession.insert("post.media_insert", dto);
		
	}

	@Override
	public void postLikeMethod(int postId, int userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> postGetUrlMethod(int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void postUnlikeMethod(int postId, int userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postReplyLikeMethod(int postreplyId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int checkUrlMethod(WebMediaDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	// test용
	@Override
	public List<PostDTO> testListMethod(PageDTO pv) {
		System.out.println("dao : " +pv.getCategory());
		return sqlSession.selectList("post.testList", pv);
		
	}

	@Override
	public int getLastId() {
		
		return sqlSession.selectOne("post.post_last_id");
	}
	
	
} // end class
