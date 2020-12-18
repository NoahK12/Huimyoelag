package component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import dao.CommunityDAO;

//import dao.ScheduledDAO;

/*@Component*/
public class SchedulerComponent {
	
	/*@Autowired*/
	/*private CommunityDAO dao;*/
	
	public SchedulerComponent() {
		System.out.println("SchedulerComponent chk");
		// TODO Auto-generated constructor stub
	}
	
	/*public void setDao(ScheduledDAO dao) {
		this.dao = dao;
	}*/
	
	// Automatically run on every day at midnight
	//@Scheduled(cron="*/1 * * * * *")
	public void scheduler() throws IOException{
		//System.out.println("scheduler chk");
		// delete previous media data
		/*dao.delPreviousYoutubeMediaMethod();
		
		String input="";
		String jsonString="";
		String path="https://www.googleapis.com/youtube/v3/search?q=고양이&maxResults=50&key=AIzaSyDgU5Y1CiF1AHPxZw2xAUwrp20suwsoQ8A";
		
		URL url = new URL(path);
		
		URLConnection urlConn = url.openConnection();
		
		HttpURLConnection httpUrl = (HttpURLConnection)urlConn;
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(httpUrl.getInputStream()));
		
		while((input=reader.readLine())!=null){
			jsonString += input;
		}
		
		JSONObject jObject = new JSONObject(jsonString);
		JSONArray jArray = jObject.getJSONArray("items");
		for(int i=0; i<jArray.length(); i++) {
			dao.insertYoutubeMediaMethod(jArray.getJSONObject(i).getJSONObject("id").getString("videoId"));
		}*/
		
	}
		
}
