package service;

import java.util.List;

import dao.CommunityDAO;
import dto.CatDTO;
import dto.PlaceDTO;
import dto.PlaceDetailDTO;
import dto.PlaceMediaDTO;
import dto.PlaceReviewDTO;
import dto.PostCatDTO;
import dto.PostCatLikeDTO;
import dto.PostCatMediaDTO;
import dto.PostDTO;
import dto.WebMediaDTO;
import dto.WebMediaLikeDTO;

public class CommunityServiceImp implements CommunityService {
	private CommunityDAO dao;

	public CommunityServiceImp() {

	}

	public void setDao(CommunityDAO dao) {
		this.dao = dao;
	}
	
	// community main start ->
	@Override
	public List<PostDTO> postViewProcess(PostDTO dto) {
		// TODO Auto-generated method stub
		return dao.postlistMethod(dto);
	}

	@Override
	public List<PostCatDTO> photoViewprocess(PostCatDTO pdto) {
		// TODO Auto-generated method stub
		return dao.photolistMethod(pdto);
	}

	// <- community main end
	
	// post cat process start ->
	@Override
	public List<PostCatDTO> postCatListProcess() {
		return dao.postCatListMethod();
	}
	
	@Override
	public List<PostCatDTO> postCatModalProcess(int postCatId){
		return dao.postCatModalMethod(postCatId);
	}
	
	@Override
	public void postCatDelProcess(int postCatId) {
		dao.postCatDelMethod(postCatId);
	}
	
	@Override
	public void postCatReplyDelProcess(int replyId) {
		dao.postCatReplyDelMethod(replyId);
	}
	
	@Override
	public void postCatModifyProcess(int postCatId, String modifiedContent) {
		dao.postCatModifyMethod(postCatId, modifiedContent);
	}
	
	@Override
	public void postCatReplyModifyProcess(int replyId, String modifiedReplyContent) {
		dao.postCatReplyModifyMethod(replyId, modifiedReplyContent);
	}
	
	@Override
	public void postCatReplyWriteProcess(int postCatId, int userId, String content) {
		dao.postCatReplyWriteMethod(postCatId, userId, content);
	}
	
	@Override
	public int postCatGetReplyIdProcess(int postCatId, int userId) {
		return dao.postCatGetReplyIdMethod(postCatId, userId);
	}
	
	@Override
	public void postCatIncViewCountProcess(int postCatId) {
		dao.postCatIncViewCountMethod(postCatId);
	}
	
	@Override
	public List<PostCatLikeDTO> postCatLikeListProcess(int postCatId) {
		return dao.postCatLikeListMethod(postCatId);
	}
	
	@Override
	public void postCatCancleLikeProcess(int postCatId, int userId) {
		dao.postCatCancleLikeMethod(postCatId, userId);
	}
	
	@Override
	public void postCatIncLikeProcess(int postCatId, int userId) {
		dao.postCatIncLikeMethod(postCatId, userId);
	}
	
	@Override
	public List<CatDTO> postCatCatListProcess(int userId) {
		return dao.postCatCatListMethod(userId);
	}
	
	@Override
	public void postCatWritePorcess(PostCatDTO postCatDto, List<PostCatMediaDTO> postCatMediaList) {
		dao.postCatWriteMethod(postCatDto, postCatMediaList);
	}
	// <- post cat process end
	
	// place process start ->
	@Override
	public List<PlaceDTO> placeListProcess() {
		return dao.placeListMethod();
	}

	@Override
	public PlaceDetailDTO placeDetailProcess(int placeId) {
		PlaceDetailDTO placeDetail = new PlaceDetailDTO();
		placeDetail.setPlace(dao.placeOneMethod(placeId));
		placeDetail.setPlaceReviewList(dao.placeReviewListMethod(placeId));
		placeDetail.setPlaceLikeList(dao.placeLikeListMethod(placeId));
		return placeDetail;
	}

	@Override
	public List<String> placeCategoryListProcess() {
		return dao.placeCategoryListMethod();
	}

	@Override
	public void placeWritePorcess(PlaceDTO placeDto, List<PlaceMediaDTO> placeMediaList) {
		dao.placeInsertMethod(placeDto);
		int id = dao.getLastId();
		for (int i = 0; i < placeMediaList.size(); i++) {
			placeMediaList.get(i).setPlaceId(id);
			dao.placeMediaInsertMethod(placeMediaList.get(i));
		}
	}

	@Override
	public void placeDeleteProcess(int placeId) {
		dao.plcaeDeleteMethod(placeId);
	}

	@Override
	public void placeLikeProcess(int placeId, int userId) {
		dao.placeLikeMethod(placeId, userId);
	}

	@Override
	public void placeUnlikeProcess(int placeId, int userId) {
		dao.placeUnlikeMethod(placeId, userId);
	}

	@Override
	public void placeReviewWriteProcess(PlaceReviewDTO dto) {
		dao.placeReviewInsertMethod(dto);
		dao.placeRatingUpdateMethod(dto.getPlaceId());
	}

	@Override
	public void placeReviewDeleteProcess(int placeId, int reviewId) {
		dao.placeReviewDeleteMethod(reviewId);
		dao.placeRatingUpdateMethod(placeId);
	}

	@Override
	public void placeEditProcess(PlaceDTO dto) {
		dao.placeUpdateMethod(dto);
	}

	@Override
	public void placeReviewLike(int reviewId) {
		dao.placeReviewLikeMethod(reviewId);
	}

	@Override
	public List<String> placeGetUrlProcess(int placeId) {
		return dao.placeGetUrlMethod(placeId);
	}
	// <- place process end
	
	// web image process start ->
	// 고양이 사진 좋아요 삽입
	@Override
	public void webMediaInsertProcess(WebMediaDTO dto) {
		dao.webMediaInsertMethod(dto);
	}

	// url에 해당하는 아이디 가져오기
	@Override
	public int selectMediaIdProcess(WebMediaDTO dto) {
		return dao.selectMediaIdMethod(dto);
	}

	// webMediaLike에 유저정보 넣기
	@Override
	public void webMediaLikeInsertProcess(WebMediaLikeDTO dto) {
		dao.webMediaLikeInsertMethod(dto);
	}

	// 0 1값으로 DB에 url이 있는지 없는지 확인해줌
	@Override
	public int checkUrlProcess(WebMediaDTO dto) {
		return dao.checkUrlMethod(dto);
	}
	// <- web image process end
	
	// web video process start ->
	@Override
	public List<WebMediaDTO>youtubeVideoIdListProcess(){
		return dao.youtubeVideoIdListMethod();
	}
	// <- web video process end

}
