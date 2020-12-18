package dto;

import java.util.List;


public class PlaceDetailDTO {
	PlaceDTO place;
	List<PlaceReviewDTO> placeReviewList;
	List<PlaceLikeDTO> placeLikeList;
	boolean meLike;
	
	public PlaceDetailDTO() {
		
	}

	public PlaceDTO getPlace() {
		return place;
	}

	public void setPlace(PlaceDTO place) {
		this.place = place;
	}

	public List<PlaceReviewDTO> getPlaceReviewList() {
		return placeReviewList;
	}

	public void setPlaceReviewList(List<PlaceReviewDTO> placeReviewList) {
		this.placeReviewList = placeReviewList;
	}

	public List<PlaceLikeDTO> getPlaceLikeList() {
		return placeLikeList;
	}

	public void setPlaceLikeList(List<PlaceLikeDTO> placeLikeList) {
		this.placeLikeList = placeLikeList;
	}

	public boolean isMeLike() {
		return meLike;
	}

	public void setMeLike(boolean meLike) {
		this.meLike = meLike;
	}
	
}
