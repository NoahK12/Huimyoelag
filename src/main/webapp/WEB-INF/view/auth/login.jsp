<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/auth/login.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/auth/login.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		
		if($("#loginCheck").val() == 1){
			alert("로그인해주세요.");
		}
	})
</script>
<title>login</title>
</head>
<body>
	
	<div id="content-body">		
		<div id="content-body-login">
				  <div class="form-group">
				    <label for="email">이메일</label>
				    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
				  </div>
				  <div class="form-group">
				    <label for="password">비밀번호</label>
				    <input type="password" class="form-control" id="password" name="password">
				  </div>
				  <fieldset >
				  	<ul>
				      <li class="find_join">
				      	<a href="findpw.do" class="find_join_id">비밀번호 찾기</a>
				      	<a href="regist.do" class="find_join_id">회원가입</a>
				      </li>
				    </ul>
			      </fieldset>
			      <input type="hidden" name="returnUrl" id="returnUrl" value="${param.returnUrl}"/>
				  <button id="login" class="btn alert-warning form-control">로그인</button>
				  <button id="cancel" class="btn alert-secondary form-control">뒤로가기</button>
				  <input type="hidden" id="loginCheck" name="loginCheck" value="${param.loginCheck}">
		</div>
	</div>
	
</body>
</html>