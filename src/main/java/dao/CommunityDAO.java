package dao;

import java.util.List;

import dto.CatDTO;
import dto.PlaceDTO;
import dto.PlaceLikeDTO;
import dto.PlaceMediaDTO;
import dto.PlaceReviewDTO;
import dto.PostCatDTO;
import dto.PostCatLikeDTO;
import dto.PostCatMediaDTO;
import dto.PostDTO;
import dto.WebMediaDTO;
import dto.WebMediaLikeDTO;

public interface CommunityDAO {
	
	// community main start ->
	/*인기게시글 가져오기*/
	public List<PostDTO> postlistMethod(PostDTO dto);
	
	/*인기사진 가져오기*/
	public List<PostCatDTO> photolistMethod(PostCatDTO pdto);
	// <- community main end

	// post cat method start ->
	public List<PostCatDTO> postCatListMethod();

	public List<PostCatDTO> postCatModalMethod(int postCatId);

	public List<PostCatLikeDTO> postCatLikeListMethod(int postCatId);

	public List<CatDTO> postCatCatListMethod(int userId);

	public void postCatDelMethod(int postCatId);

	public void postCatReplyDelMethod(int replyId);

	public void postCatModifyMethod(int postCatId, String modifiedContent);

	public void postCatReplyModifyMethod(int replyId, String modifiedReplyContent);

	public void postCatReplyWriteMethod(int postCatId, int userId, String content);

	public int postCatGetReplyIdMethod(int postCatId, int userId);

	public void postCatIncViewCountMethod(int postCatId);

	public void postCatCancleLikeMethod(int postCatId, int userId);

	public void postCatIncLikeMethod(int postCatId, int userId);

	public void postCatWriteMethod(PostCatDTO postCatDto, List<PostCatMediaDTO> postCatMediaList);
	// <- post cat method end

	// place method start ->
	public List<PlaceDTO> placeListMethod();

	public PlaceDTO placeOneMethod(int placeId);

	public List<PlaceReviewDTO> placeReviewListMethod(int placeId);

	public List<PlaceLikeDTO> placeLikeListMethod(int placeId);

	public List<String> placeCategoryListMethod();

	public void placeMediaInsertMethod(PlaceMediaDTO dto);

	public void placeInsertMethod(PlaceDTO dto);

	public int getLastId();

	public void plcaeDeleteMethod(int placeId);

	public void placeLikeMethod(int placeId, int userId);

	public void placeUnlikeMethod(int placeId, int userId);

	public void placeReviewInsertMethod(PlaceReviewDTO dto);

	public void placeReviewDeleteMethod(int reviewId);

	public void placeUpdateMethod(PlaceDTO dto);

	public void placeRatingUpdateMethod(int placeId);

	public void placeReviewLikeMethod(int reviewId);

	public List<String> placeGetUrlMethod(int placeId);
	// <- place method end

	// web image method start ->
	public void webMediaInsertMethod(WebMediaDTO dto);

	public int selectMediaIdMethod(WebMediaDTO dto);

	// webMediaLike에 유저정보 넣기
	public void webMediaLikeInsertMethod(WebMediaLikeDTO dto);

	// DB에 url이 있는지 없는지 체크
	public int checkUrlMethod(WebMediaDTO dto);
	// <- web image method end
	
	// web video method start ->
	public void delPreviousYoutubeMediaMethod();
	
	public void insertYoutubeMediaMethod(String videoId);
	
	public List<WebMediaDTO> youtubeVideoIdListMethod();
	// <- web video method end

}
