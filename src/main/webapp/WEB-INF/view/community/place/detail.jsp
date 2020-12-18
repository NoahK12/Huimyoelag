<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- Slick -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/slick/slick-theme.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/slick/slick.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/button.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community/place/detail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community/place/starRating.css" />


</head>
<body>
	<div></div>
	<a href="main.do">뒤로가기</a>
	<div class="container">
		<div class="postContainer">
			<div class="row">
				<div class="headerContainer">
					<div class="tag">${placeDetail.place.category}</div>
					<div class="title">${placeDetail.place.title}</div>
					<div class="rating">
						<c:forEach begin="1" end="${placeDetail.place.rating}">
							<label class="fas fa-star" style="color: #fd4"></label>
						</c:forEach>
						<c:forEach begin="${placeDetail.place.rating + 1}" end="5">
							<label class="fas fa-star" style="color: #444"></label>
						</c:forEach>
					</div>
					<c:if test="${id == placeDetail.place.catUserId}">
						<div class="buttonGroup">
							<form action="editForm.do?placeId=${param.placeId}">
								<input type="hidden" name="id" value="${placeDetail.place.id }" />
								<input type="hidden" name="title"
									value="${placeDetail.place.title }" /> <input type="hidden"
									name="content" value="${placeDetail.place.content }" /> <input
									type="hidden" name="category"
									value="${placeDetail.place.category }" /> <input type="hidden"
									name="phoneNumber" value="${placeDetail.place.phoneNumber }" />
								<input type="hidden" name="address"
									value="${placeDetail.place.address }" /> <input type="hidden"
									name="latitude" value="${placeDetail.place.latitude }" /> 
								<input type="hidden" name="longitude"
									value="${placeDetail.place.longitude }" />
								<button class="hover-up-button">수정</button>
							</form>
							<a href="delete.do?placeId=${param.placeId}"
								class="deleteButton hover-up-button-red">삭제하기</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="imageContainer">
					<div class="slick">
						<c:forEach items="${placeDetail.place.placeMediaList}" var="media">
							<div>
								<img src="/huimyoelag/upload/${media.url}" />
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="iconContainer">
					<ul class="iconList">
						<li class="iconItem"><c:if
								test="${placeDetail.place.meLike == true}">
								<a class="unlikeButton hover-up-button-red"
									href="unlike.do?placeId=${param.placeId}">
									<div class="icon">
										<i class="fas fa-heart"></i>
									</div>
									<div class="iconText">좋아요 취소
										${fn:length(placeDetail.placeLikeList)}</div>
								</a>

							</c:if> <c:if test="${placeDetail.place.meLike == false}">
								<a class="likeButton hover-up-button-red"
									href="like.do?placeId=${param.placeId}">
									<div class="icon">
										<i class="far fa-heart"></i>
									</div>
									<div class="iconText">좋아요
										${fn:length(placeDetail.placeLikeList)}</div>
								</a>
							</c:if></li>
						<li class="iconItem">
							<button class="goReview hover-up-button">리뷰 하기</button>
						</li>
						<li class="iconItem">
							<button class="goSeeReview hover-up-button">리뷰 보기</button>
						</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="descContainer">
					<div class="descTitle">${placeDetail.place.title}</div>
					<div class="descContent">${placeDetail.place.content}</div>
				</div>
			</div>
			<div class="row">
				<div class="infoContainer">
					<div class="infoBox">
						<div class="address">주소 : ${placeDetail.place.address}</div>
						<div class="phone">번호 : ${placeDetail.place.phoneNumber}</div>
					</div>
					<div id="map" style="width: 100%; height: 350px;"></div>
				</div>
			</div>
			<div class="row">
				<div class="likeContainer">
					<div class="likeTitle">가고싶은 사람</div>
					<c:if test="${fn:length(placeDetail.placeLikeList) == 0}">
						처음으로 좋아요를 눌러보세요!
					</c:if>
					<c:forEach items="${placeDetail.placeLikeList}" var="liker">
						<div class="avatar">
							<img src="/huimyoelag/upload/${liker.catUser.image}" />
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="row">
				<div class="reviewContainer">
					<div class="review">
						<div class="reviewTitle">리뷰 작성</div>
						<div class="starWidget">
							<input type="radio" name="rate" id="rate-5" class="rate" /> <label
								for="rate-5" class="fas fa-star"></label> <input type="radio"
								name="rate" id="rate-4" class="rate" /> <label for="rate-4"
								class="fas fa-star"></label> <input type="radio" name="rate"
								id="rate-3" class="rate" /> <label for="rate-3"
								class="fas fa-star"></label> <input type="radio" name="rate"
								id="rate-2" class="rate" /> <label for="rate-2"
								class="fas fa-star"></label> <input type="radio" name="rate"
								id="rate-1" class="rate" /> <label for="rate-1"
								class="fas fa-star"></label>
							<form action="writeReview.do" class="reviewForm">
								<input type="hidden" name="placeId"
									value="${placeDetail.place.id}" /> <input type="hidden"
									name="rate" class="rateNumber" value="0" />
								<header></header>
								<div class="textarea">
									<textarea cols="30" name="content" placeholder="리뷰를 작성해주세요!"
										class="reviewContent"></textarea>
								</div>
								<div class="btn">
									<button type="submit" class="reviewWriteButton">Post</button>
								</div>
							</form>
						</div>
					</div>
					<ul class="reviewList">
						<c:forEach items="${placeDetail.placeReviewList}" var="review">
							<li class="reviewItem">
								<div class="reviewInfo">
									<div class="avatar">
										<img src="/huimyoelag/upload/${review.catUser.image}" />

									</div>
									<div class="rating">
										<c:forEach begin="1" end="${review.rating}">
											<label class="fas fa-star" style="color: #fd4"></label>
										</c:forEach>
										<c:forEach begin="${review.rating + 1}" end="5">
											<label class="fas fa-star" style="color: #444"></label>
										</c:forEach>
									</div>

									<a
										href="reviewLike.do?placeId=${param.placeId}&reviewId=${review.id}"
										class="hover-up-button-red" style="margin-right: 10px">
										좋아요 ${review.likeCount} </a>
									<c:if test="${id == review.catUserId}">
										<a
											href="deleteReview.do?placeId=${placeDetail.place.id}&reviewId=${review.id}"
											class="reviewDeleteButton hover-up-button-red">삭제</a>
									</c:if>
								</div> <textarea class="content" disabled>${review.content}</textarea>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</div>

	<!-- Slick 관련 Script -->
	<script>
		$('.slick').slick({
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
			arrows : true,
			dots : true,
		});
	</script>

	<!-- 리뷰 쓰기/보기 -->
	<script>
		const goReview = document.querySelector(".goReview");
		const goSeeReview = document.querySelector(".goSeeReview");
		
		goReview.addEventListener("click", function() {
			window.scrollTo({
				top: document.querySelector(".review").offsetTop - 50,
				behavior: 'smooth'
			});
		});
		goSeeReview.addEventListener("click", function() {
			window.scrollTo({
				top: document.querySelector(".reviewList").offsetTop - 50,
				behavior: 'smooth'
			});
		});
	</script>

	<!-- Validation -->
	<script>
		const reviewWriteButton = document.querySelector(".reviewWriteButton");
		
		reviewWriteButton.addEventListener("click", function(event) {
			const reviewContent = document.querySelector(".reviewContent");
			if(reviewContent.value === ""){
				alert("리뷰 내용을 입력해주세요.");
				event.preventDefault();
			}
		});
	</script>

	<script>
	
		const rateNumber = document.querySelector(".rateNumber");
		const rate1 = document.querySelector("#rate-1");
		const rate2 = document.querySelector("#rate-2");
		const rate3 = document.querySelector("#rate-3");
		const rate4 = document.querySelector("#rate-4");
		const rate5 = document.querySelector("#rate-5");
		rate1.addEventListener("click", function() {
			rateNumber.value = 1;
			console.log("1");
		});
		rate2.addEventListener("click", function() {
			rateNumber.value = 2;
			console.log("2");
		});
		rate3.addEventListener("click", function() {
			rateNumber.value = 3;
			console.log("3");
		});
		rate4.addEventListener("click", function() {
			rateNumber.value = 4;
			console.log("4");
		});
		rate5.addEventListener("click", function() {
			rateNumber.value = 5;
			console.log("5");
		});
		
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12243b172e033b23ae51083b1a173797"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${placeDetail.place.latitude}, ${placeDetail.place.longitude}), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${placeDetail.place.latitude}, ${placeDetail.place.longitude});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
</body>
</html>