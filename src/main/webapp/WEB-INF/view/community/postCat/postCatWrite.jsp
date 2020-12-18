<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/button.css" />
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

<title>postCatWritePage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

	
	
<style type="text/css">
.content_body {
	width: 1050px;
	margin: auto;
}

.writeContainer {
	display: flex;
	flex-direction: column;
}

.writeContainer .image {
	text-align: center;
	margin-bottom: 20px;
}

.writeContainer #thumbnailImgs {
	display: flex;
	flex-wrap: wrap;
}

.writeContainer #thumbnailImgs img {
	width: 300px;
	height: 300px;
	margin-right: 10px;
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<div class="content_body">
		<form class="writeContainer" action="writeComplet.do" method="post"
			enctype="multipart/form-data" id="writeForm">
			<div class="btnContainer">
				<button class="writeButton hover-up-button">등록</button>
				<a href="view.do" class="cancelButton hover-up-button-red">취소</a>
			</div>
			<!-- 첫 번째 row -->
			<div class="row">
				<div class="rowTile">사진을 첨부해주세요.</div>
				<div class="uploadContainer">
					<div class="image hover-up-button">사진 첨부</div>
					<input type="file" name="files" id="upImgFiles"
						onChange="uploadImgPreview();" accept="image/*" multiple
						style="display: none" />

					<div id="thumbnailImgs"></div>
				</div>
			</div>

			<!-- 두 번째 row -->
			<div class="row">
				<div>사진 속 고양이를 선택해주세요.</div>
				<select name="catSelect">
					<c:forEach items="${catList}" var="list">
						<option class="catId" value="${list.id}">${list.name}</option>
					</c:forEach>
				</select>
			</div>


			<!-- 세 번째 row -->
			<div class="row">
				<textarea id="mainContent" name="content" rows="3"
					placeholder="내용을 입력해주세요."></textarea>
			</div>
		</form>

	</div>

	<!-- validation -->
	<script>
		const writeButton = document.querySelector(".writeButton");
		writeButton.addEventListener("click", function(event) {
			if (!validation()) {
				event.preventDefault();
			}
		});
		
		function validation(){
			if(document.querySelector("#upImgFiles").files.length === 0){
				alert("사진을 추가해주세요.");
				return false;
			} else if(document.querySelector("#mainContent").evalue === ""){
				alert("내용을 입력해주세요.");
				return false;
			}
			return true;
		}
	</script>

	<!-- Image 미리보기 -->
	<script>
		const image = document.querySelector(".image");
		image.addEventListener("click", function() {
			document.querySelector("#upImgFiles").click();
		});
		const uploadContainer = document.querySelector(".uploadContainer");
		
		function uploadImgPreview(){
			uploadContainer.querySelector("#thumbnailImgs").remove();
			const thumbnailImgs = document.createElement("div");
			thumbnailImgs.id = "thumbnailImgs";
			
			// 업로드 파일 읽기
			let fileList = document.getElementById("upImgFiles").files;
			
			// 업로드 파일 읽기
			function readAndPreview(fileList){
				console.log("readAndPreview chk")
				//이미지 확장자 검사
				if(/\.(jpe?g|png|gif)$/i.test(fileList.name)){
					let reader = new FileReader();
					
					reader.addEventListener("load", function(){
						console.log(this)
						let image = new Image();
						image.width = "264px";
						image.height = "264px";
						image.title = fileList.name;
						image.src = this.result;
						
						thumbnailImgs.appendChild(image);
						uploadContainer.appendChild(thumbnailImgs);
					}, false);
					
					//readAsDataURL()을 통해 파일의 URL을 읽어온다.
					if(fileList){
						reader.readAsDataURL(fileList);
					}
				}
				
			}
				if(fileList){
					// @details readAndPreview() 함수를 forEach문을통한 반복 수행
					[].forEach.call(fileList, readAndPreview);
				}
		}
	</script>

<!-- can't write before registration own cat -->
	<script>
		var chk = '${catList[0].name}';
		if(chk == ""){
	    	alert("등록된 고양이가 없습니다. 자신의 고양이를 등록하고 이용해주세요.");
	    	location.href="view.do";
		}
	</script>

</body>
</html>