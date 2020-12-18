<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ajax-cross-origin.min.js"></script>

<style type="text/css">
	.mod-top{
		float: right;
	}
	.mod-top{
		margin: 2%;
	}
	
	#modalBtn{
		display: flex;
	}
	
	.download{
		flex-basis: 50%;
	}
	
	.liked{
		flex-basis: 50%;
	}
	
	
	
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	$.ajax({
		crossOrigin : true, 
		
		url: 'https://pixabay.com/api/?key=18660042-4136d08e3d3545f16e29d1cbd&q=cat&image_type=photo&per_page=100',
		type:'GET',
		dataType: 'jsonp',
		success: viewMessage
	});
	$('.modal2').hide();
	
	
	//모달창 데이터 서버에 넘겨주기
	$('.liked').on('click',function(){
		
		var likeUrl = $('.modal-body img').attr('src')
		$.ajax({
			
			type: 'GET',
			url: 'catLikeImg.do',
			dataType:'text',
			data: 'url='+likeUrl,
			success: function(res){
				if(res=='success'){
					alert("좋아요 완료되었습니다.");
				}
			}
		})
		
	})//end download
	
})//end ready

	
//ajax 결과값	
function viewMessage(res) { 
	
	res=JSON.parse(res)
	console.log(res);

	$('#content-body-web-title').empty();
	
	res=res['hits']
	console.log(res)
	//25
	for (i=0; i<100; i++){
		//4
		$('#content-body-web-image').append('<div id=item'+i+' style="text-align:center;"></div>')
		for(j=0; j<4; j++){
			console.log(res[i+j]['pageURL'])
			$('#content-body-web-image #item'+i).append('<img src="'+res[i+j]['previewURL']+'" alt="'+(i+j)+'" style=" height:150px; object-fit: cover; margin:1%" id=image'+(i+j)+' onclick="catImage(this.id);"/>')
		}
		i=i+3;
		
	}
}//end viewMessage

var imageNumber;


//동적이미지에 대한 모달창
function catImage(num){//img태그는 src와 alt로 가져오기
	alert(num);
	console.log(this);
	imageNumber=num;
	
	$('.modal2').click();
	var imgUrl=$('#'+imageNumber).attr("src");
	var imgAlt=$('#'+imageNumber).attr("alt");
	$('.modal-body img').attr("alt",imgAlt);
	
	$('.modal-body img').attr("src",imgUrl);
	//alert($('#'+imageNumber).attr("src"))
	
	//$('a').attr("href",imgUrl);
}


</script>
<title>webViewImage</title>
</head>
<body>
	
		<header id="head">
		<div id="mainHeader">
			<div id="headerInner">
				<div class="logo-box" id="logo">
					<a href="/main">
						<svg id="svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 167 100" preserveAspectRatio="xMidYmid meet" >
							
						</svg>
					</a>
				</div>
				
				<div id="btn-box">
					<button type="button" class="headerBtn">
						shop
					</button> 
					<div class="dropdown" id="userbox">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    커뮤니티
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="communityHome.do">커뮤니티 메인</a>
						    <a class="dropdown-item" href="webViewVideo.do">동영상</a>
						    <a class="dropdown-item" href="webViewImage.do">이미지</a>
						  </div>
					</div>
					<c:if test="${sessionScope.chk == null}">
						<button type="button" class="headerBtn">
							<a href="login.do">로그인</a>
						</button> 
						<button type="button" class="headerBtn">
							<a href="regist.do">회원가입</a>
						</button> 
					</c:if>
					<c:if test="${sessionScope.chk != null}">
						<div class="dropdown" id="userbox">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    유저
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">마이페이지</a>
						    <a class="dropdown-item" href="logout.do">로그아웃</a>
						  </div>
						</div>
					</c:if>
					<button type="button" class="headerBtn">
						<a href="shopBasket.do">장바구니</a>
					</button> 
				</div>
			</div>
		</div>
		
	</header>
	<nav id="nav">
		<div id="subHeader">
			<div id="subHeaderInner">
				<div id="sub-title">
				
				</div>
				
				<div id="sub-list">
				
				</div>
				
				<div id="search-bar">
				
				</div>
			</div>
		</div>
	</nav>
	
	<div id="content-body">
		<div id="content-body-web-image">
			이미지
		</div>
	</div>
	
	<footer id="footer">
		<div id="footerInner">
			<div id="footer-content">
			
			</div>
			
			<div id="footer-email">
			
			</div>
		</div>
		
	</footer>
	
	<!-- 모달 -->
		<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary modal2" data-toggle="modal" data-target="#exampleModal">
	  Launch demo modal
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="background-color:black">
			<div class="mod-top">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true" style="color:white">&times;</span>
	        </button>
	      	</div>
	      <div class="modal-body">
	        <img src="#" alt="#" id="modal" style="width:400px; height:300px; object-fit: cover;" >
	      </div>
	        <div id="modalBtn">
	         <c:if test="${sessionScope.chk != null}"> 
					<button type="button" class="btn alert-warning download" style="height: 50px;">
						다운로드
					</button>
				<button type="button" class="alert alert-danger liked" style="height: 50px;">
					좋아요
				</button>
			 </c:if> 
			</div>
	    </div>
	  </div>
	</div>
</body>
</html>