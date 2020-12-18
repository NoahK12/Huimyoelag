<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
	margin: 0;
	padding: 0;
	font-size: 15px;
}

.section {
	width: 1100px;
	margin: 0 auto;
	max-height: 2000px;
}

.storeWriteForm {
	width: 1000px;
	height: auto;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

.writeTop {
	width: 100%;
	margin-bottom: 20px;
}

.writeTop div {
	width: 130px;
	height: 40px;
	display: inline-block;
	margin-right: 80px;
}

.writeTop div select {
	width: 150px;
	height: 100%;
	margin-right: 20px;
}

.writeTop div input {
	width: 100%;
	height: 100%;
}

.writeTop div.writeBtn {
	float: right;
	margin: 0;
	height: 40px;
}

.writeTop div.writeBtn form {
	height: 100%;
}

.writeTop div.writeBtn button {
	width: 100%;
	height: 100%;
	background: none;
	cursor: pointer;
	border-radius: 20px;
}

.writeTop div.inputTitle {
	clear: both;
	width: 1000px;
	height: 50px;
	margin-top: 20px;
}

.writeMid textarea {
	width: 100%;
	resize: none;
}

.row {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

.row .rowTitle {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 10px;
}

.row .image {
	text-align: center;
	margin-bottom: 20px;
}

.row #thumbnailImgs {
	display: flex;
	flex-wrap: wrap;
}

.row #thumbnailImgs img {
	width: 300px;
	height: 300px;
	margin-right: 10px;
	margin-bottom: 10px;
}
</style>

<div class="section">
	<form class="writeContainer" action="write.do" enctype="multipart/form-data" method="post">
		<div class="storeWriteForm">
			<div class="writeTop">
				<div class="mainBtn">
					<select name="mainCategory" id="mainSelect" onchange="categoryChange(this)">
						<option>메인</option>
						<option value="리빙">리빙</option>
						<option value="사료">사료</option>
						<option value="패션">패션</option>
					</select>
				</div>
				<div class="subBtn">
					<select name="subCategory" id="subSelect">
						<option>서브</option>
					</select>
				</div>
				<div class="priceBtn">
					<input type="text" name="price" id="inputPrice" placeholder="가격" />
				</div>
				<div class="brandBtn">
					<input type="text" name="brand" id="inputBrand" placeholder="브랜드명" />
				</div>
				<div class="writeBtn">
					<button type="submit">작성</button>
				</div>
				<div class="inputTitle">
					<input type="text" name="title" id="inputTitle" placeholder="상품명" />
				</div>
			</div>
			<div class="writeMid">
				<textarea name="description" id="inputDesc" cols="30" rows="10" placeholder="제품설명"></textarea>
			</div>
			<div class="row">
				<div class="uploadContainer">
					<div class="image hover-up-button">사진 첨부</div>
					<input type="file" name="files" id="upImgFiles" onChange="uploadImgPreview();" accept="image/*" multiple style="display: none" />
					<div id="thumbnailImgs"></div>
				</div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	function categoryChange(e) {
		var living = [ "급식기/급수기", "매트/침대", "캣타워", "하우스/방석" ];
		var food = [ "시니어(7세이상)", "어덜트(1~7세)", "전연령", "키튼(~12개월)" ];
		var fashion = [ "디자인/소품", "악세사리/가방", "의류" ];

		var target = document.getElementById("subSelect");

		if (e.value == "리빙")
			var option = living;
		else if (e.value == "사료")
			var option = food;
		else if (e.value == "패션")
			var option = fashion;

		target.options.length = 1;

		for (x in option) {
			var opt = document.createElement("option");
			opt.value = option[x];
			opt.innerHTML = option[x];
			target.appendChild(opt);
		}
	}

	/* Image 미리 보기 */
	const image = document.querySelector(".image");
	image.addEventListener("click", function() {
		document.querySelector("#upImgFiles").click();
	});
	const uploadContainer = document.querySelector(".uploadContainer");

	function uploadImgPreview() {
		uploadContainer.querySelector("#thumbnailImgs").remove();
		const thumbnailImgs = document.createElement("div");
		thumbnailImgs.id = "thumbnailImgs";

		// 업로드 파일 읽기
		let fileList = document.getElementById("upImgFiles").files;

		// 업로드 파일 읽기
		function readAndPreview(fileList) {

			// 이미지 확장자 검사
			if (/\.(jpe?g|png|gif)$/i.test(fileList.name)) {
				let reader = new FileReader();

				reader.addEventListener("load", function() {
					let image = new Image();
					image.width = "264px";
					image.height = "264px";
					image.title = fileList.name;
					image.src = this.result;

					thumbnailImgs.appendChild(image);
					uploadContainer.appendChild(thumbnailImgs);
				}, false);

				// readAsDataURL( )을 통해 파일의 URL을 읽어온다.
				if (fileList) {
					reader.readAsDataURL(fileList);
				}
			}
		}

		if (fileList) {
			// @details readAndPreview() 함수를 forEach문을통한 반복 수행

			[].forEach.call(fileList, readAndPreview);
		}
	}
</script>