<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet" />



<style type="text/css">
#content-body {
	height: 2000px;
}



.cat_img {
	width: 253px;
	height: 251px;
	border-radius: 30px;
	margin-right: 23px;
}

.content {
	display: flex;
	text-align: center;
	margin: 0px 0px 0px 14px;
	padding-bottom: 150px;
	
}

* {
	margin: 0;
	padding: 0;
}

.show1 {
	max-width: 100%;
	height: 500px;
	margin: auto;
	display: flex;
}

.show img {
	width: 100%;
	height: 500px;
	background-size: cover;
	max-height: 650px;
	display: flex;
}

.container {
	width: 1200px;
	margin: 0 auto;
}

.container #brandbanner {
	width: inherit;
	height: 200px;
	position: relative;
}
/*상단 이미지 6개 브랜드*/
.cat {
	font-size: 30px;
	width: 50px;
	text-align: center;
	text-decoration: none;
}

#brandbannerk {
	background: #3B5998;
	color: white;
}

/*상단 이미지 6개 브랜드*/
.cat img {
	padding: 40px 0 40px 0;
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}
/*상단 이미지 6개 브랜드*/
.cat:hover img {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

.container #step2 {
	width: 43%;
	height: 400px;
	position: relative;
	left: 665px;
	top: -200px;
	border-radius: 10px 10px 0 0;
}

.container #step3 {
	width: 43%;
	height: 200px;
	border-radius: 10px 10px 0 0;
}

.container #pagemove {
	width: inherit;
	height: 250px;
	/*background-color: #5F9EA0; */
	font-size: 30px;
	color: blue;
	text-align: center;
}

#signform {
	text-align: right;
	font-size: 24px;
}

.card-position {
	width: 100%;
}

.card-table {
	width: 14%;
	/* margin: auto; */
	display: flex;
	float: left;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 330%;
	float: right;
	margin: 10px;
	background-color: white;
	background-size: cover;
	border-radius: 10px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.container {
	padding: 2px 16px;
}

.card-position p {
	width: 100px;
	height: 10px;
}

.a {
	border: 4px solid #bcbcbc;
	margin: 10px 0px;
	font-family: Consolas, monospace;
	font-style: italic;
	font-size: 13px;
	left: 10px;
	height: 60px;
	border-radius: 10px;
}

/*우리냥냥이들 얼굴보고가실게요*/
.poter {
	text-align: center;
	color: #1E262C;
	padding: 30px;
}

.poter p {

	font-size: 15px;
	font-weight: 300;
	margin-bottom: 8px;
}

.poter h2 {
	font-size: 39px;
	font-weight: 800;
}

.poter3 {
	padding: 20px;
	margin: auto;
}

.poter2 {
	width: 1096px;
	margin: auto;
}

.poter4 {
	margin: auto;
	width: 1091px;
}

.poter50 {
	text-align: center;
	color: #1E262C;
	padding: 30px;
}

.poter200 {
	padding-bottom: 200px;
	margin: auto;
	position: relative;
	animation-name: example;
	animation-duration: 15s;
	animation-iteration-count: 150;
	display: flex;
}




/*게시글 인기순 */
.board_list {
	margin: auto;
	width: 672px;
	font-size: 15px;
	padding: 30px 0 30px 70px;
}

/*게시글 페이지*/
.board_list p {
	border-bottom: 1px;
	color: black;
	font-weight: bolder;
}

.board {
	display: flex;
	border-radius: 20px;
	border: solid 1px lightgray;
	margin-bottom: 180px;
	color: gray;
	height: 300px;
	background-color: ghostwhite;
}

}
#s {
	background-color: red;
}

.board_title {
	display: flex;
}

.board_title h6 {
	padding-right: 438px;
}

.title {
	display: inline-block;
	width: 479px;
	color: black;
	font-weight: bolder;
}

.container0 .brandbannerk {
	width: inherit;
	height: 200px;
	position: relative;



}

.brandbannerk {
  color: white;
  text-align: center;
}



.cat img {
     padding: 40px 0 40px 0 ;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
/*상단 이미지 6개 브랜드*/
.cat:hover img {
    -webkit-transform:scale(1.5);
    -moz-transform:scale(1.5);
    -ms-transform:scale(1.5);   
    -o-transform:scale(1.5);
    transform:scale(1.5);
}

.image_list img {
   
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
/*상단 이미지 6개 브랜드*/
.image_list:hover img{
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}


.board_list  .title {

     padding: 0px 0px 0px 0px ;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
/*상단 이미지 6개 브랜드*/
.board_list  .title:hover {
   font-size:17px;
    -webkit-transform:scale(1.05);
    -moz-transform:scale(1.05);
    -ms-transform:scale(1.05);   
    -o-transform:scale(1.05);
    transform:scale(1.05);
}


.index1{
position: relative;
float: left;
background-color: orange;
width:50px;
font-size:15px;
font-weight: 900;
text-align: center;
border-radius: 20px;
margin-right: 20px;
}

</style>
<title>communityHome</title>

</head>
<body>

	<!-- 상단이미지 -->
	<div class="show">
		<div class="show1">
			<img src="/huimyoelag/upload/커뮤고양1.png"> 
			<img src="/huimyoelag/upload/커뮤고양2.png"> 
			<img src="/huimyoelag/upload/커뮤고양3.png">
		</div>
	</div>

	<!-- 냥이한컷 -->
	<div class="container">
		<div class="poter">
			<p>우리냥냥이들 얼굴보고 가실게요</p>
			<h2 class="title">최근 데일리냥</h2>
		</div>

		<div class="content">
			<c:forEach items="${list}" var="list">
				<div class="card-group">
					<div class="image_list">
						<a class="goPostCat" href="${pageContext.request.contextPath}/community/postcat/view.do"><img src="/huimyoelag/upload/${list}" class="cat_img" alt="..."></a>
					</div>
				</div>
			</c:forEach>
		</div>

		<div>
			<div class="poter">
				<p>이야기 게시판에 올라온</p>
				<h2>인기 게시글</h2>
			</div>
		</div>
		<div class="board">
			<div class="board_list">
				<c:forEach items="${aList}" var="PostDTO" varStatus="i">
					<div class="index1">${i.index+1}</div>
					<p>
						<a class="title" href="${pageContext.request.contextPath}/community/post/list.do">${PostDTO.title}</a>
						<span class="user_id">${PostDTO.id}</span>
					</p>
				</c:forEach>
			</div>
			
		</div>
	</div>
</body>
</html>