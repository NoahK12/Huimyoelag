<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/main/main.css" type="text/css" rel="stylesheet"/>



<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

</style>
</head>
<body style="overflow-x:hidden">

	<!-- ------------------------상단 이미지--------------------------  -->
	<div class="show">
		<div class="show1">
			<img src="/huimyoelag/upload/냥이1.jpg"> <img
				src="/huimyoelag/upload/냥이3.jpg"> <img src="/huimyoelag/upload/냥이4.jpg">
		</div>
	</div>


	<div class="container">
		<div class="brandbannerk" style="display:flex">
			<a href="${pageContext.request.contextPath}/store/list.do?category=1" class="cat"><img src="/huimyoelag/upload/리빙.png"></a>
			<a href="${pageContext.request.contextPath}/store/list.do?category=2" class="cat"><img src="/huimyoelag/upload/사료.png"></a>
			<a href="${pageContext.request.contextPath}/store/list.do?category=3" class="cat"><img src="/huimyoelag/upload/패션.png"></a>
			
		</div>
	</div>

	<div>
		<div class="poter999">
			<p>새로 등록한 고양이</p>
			<h2>뉴비냥</h2>
		</div>
	</div>

	<div class="step23">
		<div class="card-position">
			<c:forEach items="${aList}" var="CatDTO">
				<div class="card-table">
					<div class="card">
						<img src="/huimyoelag/upload/${CatDTO.image}"
							style="width: 100%; height: 270px; border-radius: 10px">
						<div class="container">
							<h4>
								<b>${CatDTO.name}</b>
							</h4>

						</div>
					</div>
				</div>
			  </c:forEach>
	</div>	</div>

	<!-- ------------------------최근 한컷--------------------------  -->
	<div>
		<div class="poter">
			<p>새로 등록한 회원</p>
			<h2>뉴 페이스</h2>
		</div>
	</div>

	<div class="poter1">
		<div class="poter2">
			<c:forEach items="${list}" var="CatUserDTO">
				<img src="/huimyoelag/upload/${CatUserDTO.image}"
					style="width: 260px; height: 270px; border-radius: 10px">
			</c:forEach>
		</div>
	</div>

	<!-- ------------------------md가 추천하는 추천상품--------------------------  -->


	<!-- ------------------------움직이는 그림--------------------------  -->

	<div>
		<div class="poter">
			<p>MD가 직접 써보고 추천하는</p>
			<h2>특가 상품</h2>
		</div>
	</div>


	<div class="poter100" style="max-width: 1500px">
		<div class="poter200">
			<img src="/huimyoelag/upload/2020101225418343.jpg"
				style="width: 270px; height: 270px; border-radius: 200px"> <img
				src="/huimyoelag/upload/2020101225724619.jpg"
				style="width: 270px; height: 270px; border-radius: 200px"> <img
				src="/huimyoelag/upload/2020101225826438.png"
				style="width: 270px; height: 270px; border-radius: 200px"> <img
				src="/huimyoelag/upload/202010123332237.jpg"
				style="width: 270px; height: 270px; border-radius: 200px">
		</div>
	</div>

	<!-- 버튼 이미지 -->
	<!-- <button type="button" class="btm_image" id="img_btn">
<img src="/huimyoelag/upload/브랜드1.png"></button> -->





</body>
</html>