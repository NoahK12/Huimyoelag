<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">   

 <link href="css/mypage/profileUpdate.css" type="text/css" rel="stylesheet" />  
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
<script type="text/javascript" src="js/mypage/profileUpdate.js">




</script>
<style type="text/css">

</style>

</head>
<body>
 
	<div id="content-body">
		<!-- 추가 -->
		<div class="containerbox">
			<h2 class="title">프로필<br><br></h2>
			 
			<h4 class="upttitle">정보수정</h4>
			
				<table class="profilebox">

					<c:forEach items="${aList}" var="CatUserDTO">
						<div class="profileimage" style="text-align: center">
						<img src="/huimyoelag/upload/<%=session.getAttribute("userImg") %>" class="img-top" alt="...">			 
						</div>
			 		
			 			<%-- <div class="form-group">
				 			<label for="Emailbox">이메일</label> <input type="text"
								class="form-control" id="InputEmail1" name="email"
								value="${CatUserDTO.email}" readonly>
						</div> --%>
						 
							<div class="form-group">
							<label for="nicknamebox">닉네임</label> <input type="text"
								class="form-control" id="Inputnickname" name="nickname"
								value="${CatUserDTO.nickname}">
								
						</div>


						<div class="form-group">
							<label for="password2">새 비밀번호</label> <input type="password"
								class="form-control" id="newpassword2" name="password"
								placeholder="새 비밀번호 입력">
						</div>

						<div class="form-group">
							<label for="password">새 비밀번호 확인</label> <input type="password"
								class="form-control" id="newpassword3" name="password3"
								placeholder="새 비밀번호 확인">
						</div>

						
					</c:forEach>

					<a href="${pageContext.request.contextPath}/main/home.do"><button type="submit" class="btn btn-primary" id="updatebtn" >저장</button></a>
				</table>
			
		</div>
	</div>
</body>
</html>