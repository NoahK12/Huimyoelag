package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.CatUserDTO;
import dto.PageDTO;
import dto.PostDTO;
import dto.PostMediaDTO;
import dto.PostReplyDTO;


public interface PostService {
	public int countProcess(PageDTO pv);
	public List<PostDTO> listProcess(PageDTO pv);
	public void insertProcess(PostDTO dto, List<PostMediaDTO> postMediaList);
	public List<PostDTO> contentProcess(int id);
	public PostDTO updateSelectProcess(int id);
	public void updateProcess(PostDTO dto);
	public void deleteProcess(int id);
	public String fileSelectProcess(int id);
	public List<PostReplyDTO> replyInsertProcess(PostReplyDTO rdto);
	public List<PostReplyDTO> replyListProcess(PostReplyDTO rdto);
	public List<PostReplyDTO> replyDeleteProcess(PostReplyDTO rdto,HttpServletRequest request);
	public List<PostReplyDTO> replyUpdateProcess(PostReplyDTO rdto);
	// test용
	public List<PostDTO> testListProcess(PageDTO pv);
	
	
}
