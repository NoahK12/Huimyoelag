package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.PostDAO;
import dto.CatUserDTO;
import dto.PageDTO;
import dto.PostDTO;
import dto.PostMediaDTO;
import dto.PostReplyDTO;

public class PostServiceImp implements PostService {

	private PostDAO dao;

	public PostServiceImp() {

	}

	public void setDao(PostDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess(PageDTO pv) {

		return dao.count(pv);
	}

	@Override
	public List<PostDTO> listProcess(PageDTO pv) {

		return dao.list(pv); // 파라미터로 받아온 값 그대로 넣어준다.
	}

	// 제목글일때 여기 호출되어 처리
	@Override
	public void insertProcess(PostDTO dto, List<PostMediaDTO> postMediaList) {
		dao.insert(dto); // dto를 넘기는 것이다.
		int id = dao.getLastId();
		for (int i = 0; i < postMediaList.size(); i++) {
			postMediaList.get(i).setPostId(id);
			dao.postMediaInsertMethod(postMediaList.get(i));
		}
	}

	@Override
	public List<PostDTO> contentProcess(int id) {
		dao.readCount(id);
		return dao.content(id);
	}

	// 답변글일때 여기 호출되어 처리
	/*
	 * @Override public void reStepProcess(BoardDTO dto) { dao.reStepCount(dto); //
	 * re_step과 re_level 값은 여기서 하나 증가 시켜줘야한다.
	 * 
	 * dto.setRe_step(dto.getRe_step() + 1); dto.setRe_level(dto.getRe_level() + 1);
	 * dao.save(dto); }
	 */

	@Override
	public PostDTO updateSelectProcess(int id) {
		return dao.updateNum(id);
	}

	@Override
	public void updateProcess(PostDTO dto) {
		dao.update(dto);
	}

	@Override
	public void deleteProcess(int id) {
		dao.delete(id);
	}

	/*
	 * @Override public String fileSelectProcess(int id) { return dao.getFile(id); }
	 */

	
	/*
	 * @Override public List<PostReplyDTO> replyDeleteProcess(PostReplyDTO rdto,
	 * HttpServletRequest request) { dao.replyDeleteMethod(rdto.getRno()); return
	 * dao.replyListMethod(rdto.getId()); }
	 */

	@Override
	public String fileSelectProcess(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<PostDTO> testListProcess(PageDTO pv) {
		return dao.testListMethod(pv);
	}

	@Override
	public List<PostReplyDTO> replyInsertProcess(PostReplyDTO rdto) {
		dao.replyInsertMethod(rdto);
		return dao.replyListMethod(rdto.getPost_id());
	}

	@Override
	public List<PostReplyDTO> replyListProcess(PostReplyDTO rdto) {
		// TODO Auto-generated method stub
		return dao.replyListMethod(rdto.getId());
	}

	@Override
	public List<PostReplyDTO> replyDeleteProcess(PostReplyDTO rdto, HttpServletRequest request) {
		dao.replyDeleteMethod(rdto.getId());
		return dao.replyListMethod(rdto.getPost_id());
	}

	@Override
	public List<PostReplyDTO> replyUpdateProcess(PostReplyDTO rdto) {
		dao.replyUpdateMethod(rdto);
		return dao.replyListMethod(rdto.getPost_id());
	}

}
