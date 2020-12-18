<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">  
<link href="css/mypage/catCareMain.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

</style>
 
</head>
<body>

	<div id="content-body"> 

		<div class="containerbox">

			<div class="untitle">
				<img src="/huimyoelag/upload/tools.PNG" class="cat_image" alt="...">
				<div class="toolsbox">
					<h3 class="tools">
						<span class="tools2">고양이</span> 툴즈
					</h3>
					<p class="tool_p">우리아이를 위한 계산기, 가이드라인 모음</p>
					</div>
					</div>
			<div class="catcare">
				<div class="card" id="cardbox2" style="width: 18rem;">
					<div class="card-body">
						<span class="title2">권장칼로리</span>
						<h5 class="card-title">계산기</h5>
						<a href="Recommendedcalorie.do" class="btn-primary2">></a>
					</div>
				</div>
			
				
			
				<div class="card" style="width: 18rem;" id="cardbox3">
					<div class="card-body">
						<span class="title3">비만도</span> 
						<h5 class="card-title">계산기</h5>
						<a href="catfat.do" class="btn-primary3">></a>
					</div>
				</div>
				<div class="card" style="width: 18rem;" id="cardbox4">
					<div class="card-body">
						<span class="title4">나이</span>
						<h5 class="card-title">계산기</h5>
						<a href="catage.do" class="btn-primary4">></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>