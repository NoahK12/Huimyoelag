package service;

import java.util.List;

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

public interface CommunityService {
	
	// community main start ->
	/*인기게시글 가져오기*/
	public List<PostDTO> postViewProcess(PostDTO dto);
	/*인기냥이한컷 가져오기*/
	public List<PostCatDTO> photoViewprocess(PostCatDTO pdto);
	// <- community main end
	
	// post cat process start ->
	public List<PostCatDTO> postCatListProcess();
	
	public List<PostCatDTO> postCatModalProcess(int postCatId);
	
	public List<PostCatLikeDTO> postCatLikeListProcess(int postCatId);
	
	public List<CatDTO> postCatCatListProcess(int userId);
	
	public void postCatDelProcess(int postCatId);
	
	public void postCatModifyProcess(int postCatId, String modifiedContent);
	
	public void postCatReplyModifyProcess(int replyId, String modifiedReplyContent);
	
	public void postCatReplyDelProcess(int replyId);
	
	public void postCatReplyWriteProcess(int postCatId, int userId, String content);
	
	public int postCatGetReplyIdProcess(int postCatId, int userId);
	
	public void postCatIncViewCountProcess(int postCatId);
	
	public void postCatCancleLikeProcess(int postCatId, int userId);
	
	public void postCatIncLikeProcess(int postCatId, int userId);
	
	public void postCatWritePorcess(PostCatDTO postCatDto, List<PostCatMediaDTO> postCatMediaList);
	// <- post cat process end
	
	// place process start ->
	public List<PlaceDTO> placeListProcess();

	public PlaceDetailDTO placeDetailProcess(int placeId);

	public List<String> placeCategoryListProcess();

	public void placeWritePorcess(PlaceDTO placeDto, List<PlaceMediaDTO> placeMediaList);

	public void placeDeleteProcess(int placeId);

	public void placeLikeProcess(int placeId, int userId);

	public void placeUnlikeProcess(int placeId, int userId);

	public void placeReviewWriteProcess(PlaceReviewDTO dto);

	public void placeReviewDeleteProcess(int placeId, int reviewId);

	public void placeEditProcess(PlaceDTO dto);

	public void placeReviewLike(int reviewId);

	public List<String> placeGetUrlProcess(int placeId);
	// <- place process end
	
	// web image process start ->
	// 좋아요누른 데이터 DB에삽입
	public void webMediaInsertProcess(WebMediaDTO dto);

	// url에 해당하는 아이디 가져오기
	public int selectMediaIdProcess(WebMediaDTO dto);

	// webMediaLike에 유저정보 넣기
	public void webMediaLikeInsertProcess(WebMediaLikeDTO dto);

	// 0 1값으로 DB에 url이 있는지 없는지 확인해줌
	public int checkUrlProcess(WebMediaDTO dto);
	// <- web image process end
	
	// web video process start ->
	public List<WebMediaDTO>youtubeVideoIdListProcess();
	// <- web video process end
}
