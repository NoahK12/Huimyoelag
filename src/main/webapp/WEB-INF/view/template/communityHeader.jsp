<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath}/css/hover.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/template/header.css" rel="stylesheet">

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
				<c:if test="${sessionScope.userId == null}">
					<button type="button" class="home-btn hvr-float-shadow" onclick="location.href='${pageContext.request.contextPath}/auth/login.do'">
						<img id="login-img" src="/huimyoelag/upload/Comminity-03Login.png"/>
					</button>
					<button type="button" class="home-btn hvr-float-shadow" onclick="location.href='${pageContext.request.contextPath}/auth/regist.do'">
						<img id="regist-img" src="/huimyoelag/upload/regist.png"/>
					</button>
				</c:if>
				<c:if test="${sessionScope.userId != null}">
					<div class="dropdown" id="userbox">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("userNickName")%></button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myPage.do">마이페이지</a> 
							<a class="dropdown-item" href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a>
						</div>
					</div>
				</c:if> 
			</div>
		</div>
	</div>
</div>

<div class="navheader">
	<div class="headerInner">
		<div class="gnb-bar">
			<div class="gnb-title">
				<a href="${pageContext.request.contextPath}/community/home.do" class="gnbBtn hvr-fade">커뮤니티</a>
				<img src="/huimyoelag/upload/ico_arrow02.png" alt="화살표" />
			</div>

			<ul class="gnb-list">
				<li><a class="hvr-fade" href="${pageContext.request.contextPath}/community/postcat/view.do">데일리냥</a></li>
				<%-- <li><a class="hvr-fade" href="${pageContext.request.contextPath}/community/web/viewImage/list.do">누구냥?</a></li> --%>
				<li><a class="hvr-fade" href="${pageContext.request.contextPath}/community/web/youtubeVideo/list.do">냥튜브</a></li>
				<li><a class="hvr-fade" href="${pageContext.request.contextPath}/community/place/main.do">냥플레이스</a></li>
				<li><a class="hvr-fade" href="${pageContext.request.contextPath}/community/post/list.do">이야기</a></li>
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