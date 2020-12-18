package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class CommunityDaoImp implements CommunityDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public CommunityDaoImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// community main start ->
	@Override
	public List<PostDTO> postlistMethod(PostDTO dto) {
		return sqlSession.selectList("community.list",dto);
	}

	@Override
	public List<PostCatDTO> photolistMethod(PostCatDTO pdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("community.image_list");
	}
	// <- community main end
	
	// post cat method start ->
	@Override
	public List<PostCatDTO> postCatListMethod(){
		return sqlSession.selectList("postCat.list");
	}
	
	@Override
	public List<PostCatDTO> postCatModalMethod(int postCatId){
		System.out.println("chk: " + sqlSession.selectList("postCat.modal", postCatId));
		return sqlSession.selectList("postCat.modal", postCatId);
	}
	
	@Override
	public void postCatDelMethod(int postCatId) {
		sqlSession.update("postCat.postCatDel", postCatId);
	}
	
	@Override
	public void postCatReplyDelMethod(int replyId) {
		sqlSession.update("postCat.postCatReplyDel", replyId);
	}
	
	@Override
	public void postCatModifyMethod(int postCatId, String modifiedContent) {
		HashMap<String, Object> pcMap = new HashMap<String, Object>();
		pcMap.put("modifiedContent", modifiedContent);
		pcMap.put("postCatId", postCatId);
		sqlSession.delete("postCat.postCatModify", pcMap);
	}
	
	@Override
	public void postCatReplyModifyMethod(int replyId, String modifiedReplyContent) {
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("modifiedReplyContent", modifiedReplyContent);
		reMap.put("replyId", replyId);
		System.out.println("remap: " + reMap);
		sqlSession.update("postCat.postCatReplyModify", reMap);
	}

	@Override
	public void postCatReplyWriteMethod(int postCatId, int userId, String content) {
		HashMap<String, Object> wtMap = new HashMap<String, Object>();
		wtMap.put("postCatId", postCatId);
		wtMap.put("userId", userId);
		wtMap.put("content", content);
		sqlSession.insert("postCat.postCatReplyWrite", wtMap);
	}
	
	@Override
	public int postCatGetReplyIdMethod(int postCatId, int userId) {
		HashMap<String, Object> griMap = new HashMap<String, Object>();
		griMap.put("postCatId", postCatId);
		griMap.put("userId", userId);
		return sqlSession.selectOne("postCat.getReplyId", griMap);
	}
	
	@Override
	public void postCatIncViewCountMethod(int postCatId) {
		sqlSession.update("postCat.incViewCount", postCatId);
	}
	
	@Override
	public List<PostCatLikeDTO> postCatLikeListMethod(int postCatId) {
		return sqlSession.selectList("postCat.likeList", postCatId);
	}
	
	@Override
	public void postCatCancleLikeMethod(int postCatId, int userId) {
		HashMap<String, Object> clMap = new HashMap<String, Object>();
		clMap.put("postCatId", postCatId);
		clMap.put("userId", userId);
		sqlSession.delete("postCat.cancleLike", clMap);
	}
	
	@Override
	public void postCatIncLikeMethod(int postCatId, int userId) {
		HashMap<String, Object> ilMap = new HashMap<String, Object>();
		ilMap.put("postCatId", postCatId);
		ilMap.put("userId", userId);
		sqlSession.insert("postCat.incLike", ilMap);
	}
	
	@Override
	public List<CatDTO> postCatCatListMethod(int userId) {
		return sqlSession.selectList("postCat.catList", userId);
	}
	
	@Override
	public void postCatWriteMethod(PostCatDTO postCatDto, List<PostCatMediaDTO> postCatMediaList) {
		sqlSession.insert("postCat.insert", postCatDto);
		int id = sqlSession.selectOne("postCat.last_id");
		for(int i=0; i< postCatMediaList.size(); i++) {
			postCatMediaList.get(i).setPostCatId(id);
			sqlSession.insert("postCat.mediaInsert", postCatMediaList.get(i));
		}
	}
	// <- post cat method end
	
	// place method start ->
	@Override
	public List<PlaceDTO> placeListMethod() {
		return sqlSession.selectList("place.list");
	}

	@Override
	public PlaceDTO placeOneMethod(int placeId) {
		return sqlSession.selectOne("place.one", placeId);
	}

	@Override
	public List<PlaceReviewDTO> placeReviewListMethod(int placeId) {
		return sqlSession.selectList("place.review_list", placeId);
	}

	@Override
	public List<PlaceLikeDTO> placeLikeListMethod(int placeId) {
		return sqlSession.selectList("place.like_list", placeId);
	}

	@Override
	public List<String> placeCategoryListMethod() {
		return sqlSession.selectList("place.category_list");
	}

	@Override
	public void placeInsertMethod(PlaceDTO dto) {
		sqlSession.insert("place.insert", dto);
	}

	@Override
	public void placeMediaInsertMethod(PlaceMediaDTO dto) {
		sqlSession.insert("place.media_insert", dto);
	}

	@Override
	public int getLastId() {
		return sqlSession.selectOne("place.last_id");
	}

	@Override
	public void plcaeDeleteMethod(int placeId) {
		sqlSession.delete("place.delete", placeId);
	}

	@Override
	public void placeLikeMethod(int placeId, int userId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("placeId", placeId);
		map.put("userId", userId);
		sqlSession.insert("place.like", map);
	}

	@Override
	public void placeUnlikeMethod(int placeId, int userId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("placeId", placeId);
		map.put("userId", userId);
		sqlSession.delete("place.unlike", map);
	}

	@Override
	public void placeReviewInsertMethod(PlaceReviewDTO dto) {
		sqlSession.insert("place.review_insert", dto);
	}

	@Override
	public void placeReviewDeleteMethod(int reviewId) {
		sqlSession.delete("place.review_delete", reviewId);
	}

	@Override
	public void placeUpdateMethod(PlaceDTO dto) {
		sqlSession.update("place.update", dto);
	}

	@Override
	public void placeRatingUpdateMethod(int placeId) {
		sqlSession.update("place.rating_update", placeId);
	}

	@Override
	public void placeReviewLikeMethod(int reviewId) {
		sqlSession.update("place.review_like", reviewId);
	}

	@Override
	public List<String> placeGetUrlMethod(int placeId) {
		return sqlSession.selectList("place.get_url", placeId);
	}
	// <- place method end

	// web image method start ->
	// api고양이 사진 Db에 삽입
	@Override
	public void webMediaInsertMethod(WebMediaDTO dto) {
		sqlSession.insert("web_media.web_img_insert", dto);
	}

	@Override
	public int selectMediaIdMethod(WebMediaDTO dto) {
		return sqlSession.selectOne("web_media.web_id_select", dto);
	}

	@Override
	public void webMediaLikeInsertMethod(WebMediaLikeDTO dto) {
		sqlSession.insert("web_media.web_like_insert", dto);
	}

	// DB에 url이 있는지 없는지 체크
	@Override
	public int checkUrlMethod(WebMediaDTO dto) {
		return sqlSession.selectOne("web_media.check_url", dto);
	}
	// <- web image method end
	
	
	// web video method start ->
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
	// <- web image method end

}
