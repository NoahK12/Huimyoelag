<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mypage/RecommendedCalorieResult.css" type="text/css"
	rel="stylesheet" />
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
<title>권장칼로리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<div class="containerbox">
		<div class="eat_image">
			<img src="/huimyoelag/upload/calorie.PNG" class="image_cat" alt="...">
		</div>

		<form class="claoriebox">
			<div class="form-group row">
				<label for="inputprotein" class="col-sm-2 col-form-label">몸무게</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="weight" name="weight"
						value="${weight}" readonly>
					<div>
						<h5 class="kg">kg</h5>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputinfo" class="col-sm-2 col-form-label">상태</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="option" name="option"
						value="${option}" readonly>
				</div>
			</div>
		</form>
		<div class="result_card" id="box1">
			<div class="card-body">
				<h2 class="kcalResult">권장칼로리 결과</h2>
				<br> <br>
				<p id="testResultBox">1일 권장칼로리: ${result}kcal</p>
				<p>건강 상태, 비만도에 따라 달라질 수 있으니 정확한 섭취량은 수의사와 상담해보세요.</p>
				<div class="resetBtn">
					<a href="catcare.do" class="card-link">메인으로</a> 
					<a href="Recommendedcalorie.do" class="reset">다시계산하기</a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>