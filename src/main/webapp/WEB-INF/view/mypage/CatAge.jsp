<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="css/mypage/CatAge.css" type="text/css" rel="stylesheet" />
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

<title>나이계산기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/mypage/CatAge.js">
</script>
</head>
<body>

	<div class="containerbox">
		<div class="eat_image">
			<img src="/huimyoelag/upload/age.PNG" class="image_cat" alt="...">

		</div>

		<form class="agebox" action="catageResult.do" method="post">
			<div class="form-group row">
				<label for="inputAge" class="col-sm-2 col-form-label">태어난년도</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="birthYear"
						placeholder="년도를 입력해주세요." name="birthYear">
						<div>
						<h5 class="year">년도</h5>
					</div>

				</div>
			</div>
			<button type="submit" class="btn-result" id="resultBtn">결과보기</button>
		</form>
	
	</div> 
 
</body>
</html>