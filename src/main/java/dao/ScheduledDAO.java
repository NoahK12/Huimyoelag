package dao;

import java.util.List;

import dto.WebMediaDTO;

public interface ScheduledDAO {
	public void delPreviousYoutubeMediaMethod();
	public void insertYoutubeMediaMethod(String videoId);
	public List<WebMediaDTO> youtubeVideoIdListMethod();
}
