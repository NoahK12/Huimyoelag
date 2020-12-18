package dao;

import java.util.List;

import dto.CatUserDTO;
import dto.PageDTO;
import dto.PostDTO;
import dto.PostLikeDTO;
import dto.PostMediaDTO;
import dto.PostReplyDTO;
import dto.WebMediaDTO;

public interface PostDAO {
	public int count(PageDTO pv);
	
	public List<PostDTO> list(PageDTO pv);
	
	public void readCount(int postId);
	
	public List<PostDTO> content(int id);

	public void insert(PostDTO dto);
	
	public PostDTO updateNum(int postId);
	
	public void update( PostDTO dto);
	
	public void delete(int postId);
	
	public int getLastId();
	
	public void replyInsertMethod(PostReplyDTO rdto);
	
	public List<PostReplyDTO> replyListMethod(int id);
	
	public void replyDeleteMethod(int id);
	
	public void replyUpdateMethod(PostReplyDTO rdto);
	
	public List<PostLikeDTO> postLikeListMethod(int postId);

	public List<String> postCategoryListMethod();
	
	public void postMediaInsertMethod(PostMediaDTO dto);
	
	public void postLikeMethod(int postId, int userId);
	
	public List<String> postGetUrlMethod(int postId);

	public void postUnlikeMethod(int postId, int userId);
	
	public void postReplyLikeMethod(int postreplyId);
	
	public int checkUrlMethod(WebMediaDTO dto);
	
	// test용 메소드
	public List<PostDTO> testListMethod(PageDTO pv);
	
	
	
}//end interface
