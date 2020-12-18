<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath}/css/template/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/hover.css" rel="stylesheet">

<style type="text/css">
	.catcare{
		border: none !important;
    	font-size: 15px;
    	color: rgba(30, 38, 44, 0.5);
    	background-color: #ffffff;
        box-shadow: none !important;
	}
	

</style>

<div class="header">
	<div class="mainheader">
		<div class="headerInner">
			<div class="logo-box">
				<a id="logo-contain" href='${pageContext.request.contextPath}/main/home.do'> <img id="logo" src="/huimyoelag/upload/logo.png" alt="logo" class="web-logo" />
				</a>
			</div>
			<div class="btn-box">
				<button type="button" class="home-btn hvr-float-shadow" onclick="location.href='${pageContext.request.contextPath}/main/home.do'">
					<img id="main-home-img"src="/huimyoelag/upload/Comminity-02Home.png"/>
				</button>
				<button type="button" class="home-btn hvr-float-shadow" onclick="location.href='${pageContext.request.contextPath}/community/home.do'">
					<img id="community-home-img"src="/huimyoelag/upload/Comminity-Community.png"/>
				</button>
				<button type="button" class="home-btn hvr-float-shadow" onclick="location.href='${pageContext.request.contextPath}/store/list.do'">
					<img id="shop-home-img"src="/huimyoelag/upload/Comminity-Shop.png"/>
				</button>	
				<div class="dropdown" id="userbox">
					<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("userNickName")%></button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myPage.do">마이페이지</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="navheader">
	<div class="headerInner">
		<div class="gnb-bar">
			<div class="gnb-title">
				<a href="${pageContext.request.contextPath}/mypage/myPage.do" class="gnbBtn hvr-fade">마이페이지</a>
				<img src="/huimyoelag/upload/ico_arrow02.png" alt="화살표" />
			</div>

			<ul class="gnb-list">
				<li><a class="hvr-fade" href="${pageContext.request.contextPath}/mypage/profileview.do">프로필</a></li>
				<!-- <li><a class="hvr-fade" href="#">내 고양이</a></li>
				<li><a class="hvr-fade" href="#">장바구니</a></li>
				<li><a class="hvr-fade" href="#">구매목록</a></li>
				<li><a class="hvr-fade" href="#">좋아요</a></li> -->

				<li><div class="dropdown" id="userbox">
						<button class="btn btn-secondary dropdown-toggle hvr-fade catcare" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">고양이관리</button>
						<div class="dropdown-menu hvr-fade" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item hvr-fade" href="${pageContext.request.contextPath}/mypage/Recommendedcalorie.do">권장칼로리 계산기</a>
							<a class="dropdown-item hvr-fade" href="${pageContext.request.contextPath}/mypage/catage.do">나이 계산기</a>
							<a class="dropdown-item hvr-fade" href="${pageContext.request.contextPath}/mypage/catfat.do">비만도 계산기</a>
						</div>
					</div></li>
			</ul>

			<div class="clear" style="clear: both;"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var header = $('.navheader');

		$(window).scroll(function() {

			if (header.offset().top !== 84) {
				if (!header.hasClass('shadow')) {
					header.addClass('shadow');
				}
			} else {
				header.removeClass('shadow');
			}
		});
	});
	
</script>