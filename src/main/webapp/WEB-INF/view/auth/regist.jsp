<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regist</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/auth/regist.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/auth/regist.js"></script>

<script type="text/javascript">
	
$(document).ready(function(){
	//페이지가 벗어나거나 닫히면 이벤트
	  $(window).on('beforeunload', function() { 
		 
		 var email=$('#email').val();
		 $.ajax({ // 이메일 입력란 중복체크 및 유효성 검사
		        type: "POST",
		        url: "outEmailCheck.do",
		        dataType: "text", 
		        data: 'email='+email,
		        success: function (res) {
		            
		        }
		    })
	});//end beforeunload  
});
</script>
</head>
<body>
	
	<div id="content-body">
	<div id="content-body-regist">
		<div class="d-flex">
               <div class="col">
                    <fieldset>
                        <h2 class="regist-box-h2">회원정보 입력</h2>
                        <hr class="my-4">
                        <h5 class="regist-box-h5">필수사항</h5>
                        <div class="form-group">
                            <label for="nickname">닉네임</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" aria-describedby="nameHelp">
                            <small id="nicknameHelp" class="form-text text-muted">한글 또는 영문으로 입력해 주세요.</small>
                        </div>
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <div id="email-box" style="display: flex">
                            	
                            	<c:if test="${param.email == null}">
	                            	<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" readonly="readonly" style="flex-basis: 75%;">
                            		<button type="button" class="btn btn-secondary" id="sendMail" style="width:160px">이메일 인증하기</button>
                            	</c:if>
                            	<c:if test="${param.email != null}">
	                            	<input type="email" class="form-control" id="email" name="email" value="${param.email}" aria-describedby="emailHelp" readonly="readonly" style="flex-basis: 75%;">
                            		<input type="hidden" name="emailSecretKey" id="emailSecretKey" value="${param.emailSecretKey}">
                            		<button type="button" class="btn btn-secondary" id="sendMail" style="width: 25%">인증완료</button>
                            	</c:if>
                            </div>
                            <small id="emailHelp" class="form-text text-muted">사용할 이메일을 입력해 주세요.</small>
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp">
                            <small id="passwordHelp" class="form-text text-muted">숫자와 영문이 혼합된 6~12자리를 입력해주세요.</small>
                        </div>
                        <div class="form-group">
                            <label for="resister_password_check">비밀번호 재입력</label>
                            <input type="password" class="form-control" id="resister_password_check"
                                   aria-describedby="password_checkHelp">
                            <small id="password_checkHelp" class="form-text text-muted">비밀번호를 다시 입력해주세요.</small>
                        </div>
			   			<button type="button" class="btn alert-warning registComplit">가입</button>
						<button type="button" class="btn alert-secondary registCancel">뒤로가기</button>
                    </fieldset>
              </div>
         </div>
    </div>
	</div>
    <br>
    <br>
    <br>

</body>
</html>