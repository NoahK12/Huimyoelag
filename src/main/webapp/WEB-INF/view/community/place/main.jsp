<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<title>Place</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/place/main.css" />

</head>
<body>

	<div class="container">

		<div class="row">
			<!-- Filter Start -->
			<div class="filterContainer">
				<select class="selectBox">
					<option value="all">전체</option>
					<c:forEach items="${placeCategoryList}" var="category">
						<option value="${category}">${category}</option>
					</c:forEach>
				</select>
			</div>
			<!-- Filter End -->

			<div class="buttonGroup">
				<a href="writeForm.do" class="writeFormButton hover-up-button">글쓰기</a>
			</div>
		</div>

		<!-- Card Start -->
		<div class="card">
			<c:forEach items="${placeList}" var="place">
				<div class="cardContainer">
					<div class="imageContainer">
						<c:forEach items="${place.placeMediaList}" var="media" varStatus="status">
							<c:if test="${status.index == 0}">
								<!-- 서버에서 실행 시키면 myapp을 붙여줘야 하지만 도메인을 생성하면 빼야함 -->
								<img src="/huimyoelag/upload/${media.url}" />
								<p>${media.url}</p>
							</c:if>
						</c:forEach>
					</div>
					<div class="contentContainer">
						<div class="tag">${place.category}</div>
						<div class="title">${place.title}</div>
						<div class="placeName">${place.content}</div>
					</div>
					<a class="detailLink" href="detail.do?placeId=${place.id}"> 자세히 보기 </a>
				</div>
			</c:forEach>
		</div>
		<!-- Card End -->
	</div>

	<!-- Filter -->
	<script>
		const select = document.querySelector(".selectBox");
		const list = document.querySelectorAll(".cardContainer");

		function filterCard() {
			for (let i = 0; i < list.length; i++) {
				tag = list[i].querySelector(".tag");
				if (select.value === tag.innerText || select.value === "all") {
					list[i].classList.remove("hide")
				} else {
					list[i].classList.add("hide")
				}
			}
		}
		select.addEventListener("change", filterCard);
	</script>
</body>
</html>