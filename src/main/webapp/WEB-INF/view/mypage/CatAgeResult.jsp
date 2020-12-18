<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="css/mypage/CatAgeResult.css" type="text/css" rel="stylesheet" />
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

		<form class="agebox">
			<div class="form-group row">
				<label for="inputAge" class="col-sm-2 col-form-label">태어난년도</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="birthYear"
						placeholder="년도를 입력해주세요." name="birthYear" value="${birthYear}" readonly>
							<div>
						<h5 class="year">년도</h5>
					</div>

				</div>
			</div>
		</form>
		<div class="result_card" id="box1">
			<div class="card-body">
				<h2 class="result">나이계산기</h2>
				<br>
				<br> 
				<p id="testResultBox">
					우리아이의 나이는: "${result}"살 입니다.
				</p>
				<p>아직 모든 고양이의 나이를 사람 나이로 정확하게 변환하는 연구 결과는 없습니다.</p> 
				<p>고양이마다 나이가 드는 속도가 다릅니다. 위 결과는 참고로만 봐주세요.</p>
				<div class="resetBtn">
				<a href="catcare.do" class="card-link">메인으로</a>
				<a href="catage.do" class="reset">다시계산하기</a>
                </div>

			</div>
		</div> 
	</div>
 
</body>
</html>