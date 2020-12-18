<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FindPassWord</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/mail/findPassSendMail/findPassWord.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mail/findPassSendMail/findPassWord.js"></script>


</head>
<body>
	<header id="head">
	<div id="mainHeader">
		<div id="headerInner">
			<div class="logo-box" id="logo">
				<a href="/main"> <svg id="svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 167 100" preserveAspectRatio="xMidYmid meet"> </svg>
				</a>
			</div>

			<div id="btn-box">
				<button type="button" class="headerBtn">shop</button>
				<div class="dropdown" id="userbox">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="communityHome.do">커뮤니티 메인</a> <a class="dropdown-item" href="webViewVideo.do">동영상</a> <a class="dropdown-item" href="webViewImage.do">이미지</a>
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
						<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">유저</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">마이페이지</a> <a class="dropdown-item" href="logout.do">로그아웃</a>
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
			<div id="sub-title"></div>

			<div id="sub-list"></div>

			<div id="search-bar"></div>
		</div>
	</div>
	</nav>

	<div id="content-body">
		<div id="content-body-findPassword">
			<div id="wrap" style="text-align: center;">

				<form id="frm">
					<br>
					<h4>비밀번호 찾기</h4>
					<br>
					<hr>
					<br>
					<input type="text" class="form-control MailCheckField" id="email" name="email" placeholder="이메일을 입력해주세요.">
					<br>
					<button type="button" class="btn alert-warning" id="sendbtn">이메일 인증 받기(이메일 보내기)</button>
				</form>
			</div>
		</div>
	</div>

	<footer id="footer">
	<div id="footerInner">
		<div id="footer-content"></div>

		<div id="footer-email"></div>
	</div>

	</footer>

</body>
</html>