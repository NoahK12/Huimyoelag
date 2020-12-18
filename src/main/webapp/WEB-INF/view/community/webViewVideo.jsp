<%@page import="java.util.ArrayList"%>
<%@page import="dto.WebMediaDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<title>webViewVideo</title>
<style type="text/css">
	.youtube-body{
		width: 1300px;
    	margin: 0 auto;
	}
</style>
<script type="text/javascript">
	<%List<WebMediaDTO> mediaList = new ArrayList<WebMediaDTO>();
	mediaList = (List<WebMediaDTO>) request.getAttribute("videoIdList");
	List<String> urlList = new ArrayList<String>();
	for (int i = 0; i < 50; i++) {
		urlList.add(mediaList.get(i).getUrl());
	}%>
	
	var urlList ="<%=urlList%>" 
	var newUrlList = urlList.replace('[', '').replace(']', '').split(', ');
	var j=0;
	
	$(document).ready(function (){
		moreVideo(newUrlList);
		$(window).scroll(function() {
			var scrolltop = $(document).scrollTop();
			var height = $(document).height();
			var height_win = $(window).height();

			if (Math.round($(window).scrollTop()) == $(document).height() - $(window).height()) {
				moreVideo(newUrlList);
			}
		})
	});
	
	function moreVideo(newUrlList) {
		var length = 4;
		for(var i=0;i<length;i++){
			if(j<50){
				$('.youtube-body').append('<iframe id="player" type="text/html" width="640" height="360" src="http://www.youtube.com/embed/'+ newUrlList[j] +'" frameborder="0" allowfullscreen="true" />');
				j++;
			}else{
				return false;
			}
		}
	}
</script>
</head>
<body>
	
		<div class="youtube-body" ></div>
</body>
</html>