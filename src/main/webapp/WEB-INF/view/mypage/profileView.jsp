<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link href="css/mypage/profileView.css" type="text/css" rel="stylesheet" />
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
	
	#a1{
		max-width: 1100px;
		margin: 0 auto;
	}
</style>

</head>
<body>
	<div id="content-body">
		<!--추가  -->
		<div class="containerbox">
			<form id="a1">
				<h2 class="title">프로필<br><br></h2>
				

				<c:forEach items="${aList}" var="CatUserDTO">
					<div class="image" style="text-align: center">
						<img src="/huimyoelag/upload/<%=session.getAttribute("userImg") %>" class="img-top" alt="...">
					</div>
					<div class="form-group">
						<label for="nicknamebox">닉네임</label> <input type="text"
							class="form-control" id="Inputnickname"
							value="${CatUserDTO.nickname}" readonly="readonly">
					</div>

 
				<%-- 	<div class="form-group">
						<label for="Emailbox">이메일</label> <input type="text"							class="form-control" id="InputEmail" value="${CatUserDTO.email}"
							readonly="readonly">
					</div> --%>

					<a class="btnSave" href="profileupdate.do?id=${CatUserDTO.id}">수정</a>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>