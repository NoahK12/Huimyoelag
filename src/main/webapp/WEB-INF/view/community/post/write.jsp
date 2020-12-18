<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* Write */
.writeContainer {
	display: flex;
	flex-direction: column;
	width: 100%;
	margin:
}

.writeContainer .row {
	margin-bottom: 30px;
	display: flex;
}

/* 네 번째 row */
.writeContainer .row {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

.writeContainer .row .rowTitle {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 10px;
}

.writeContainer .row .image {
	text-align: center;
	margin-bottom: 20px;
}

.writeContainer .row #thumbnailImgs {
	display: flex;
	flex-wrap: wrap;
}

.writeContainer .row #thumbnailImgs img {
	width: 300px;
	height: 300px;
	margin-right: 10px;
	margin-bottom: 10px;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnList1').on('click', function() {
			$('#frm').attr('action', 'list.do');
			$('#frm').submit();
		});
		$('#btnCancel').on('click', function() {
			// document.getElementById('#frm').reset();
			$('#frm')[0].reset();
		});
		$('#btnSave').on('click', function() {
			$('#frm').attr('action', 'write.do');
			$('#frm').submit();
		});

		// 첨부파일 용량 체크
		$('#filepath').on('change', function() {
			if (this.files[0].size > 1000000000) {
				alert('1GB미만의 파일만 첨부할 수 있습니다.');
				$('#filepath').val('');
				return false;
			}
		});

	});

	/* $.each(res,function(index, value){
		$('.frm').append('<li class="time_sub" id="'
				+value.bno+'"><p>'+value.upload+'</p></li>')
				
		
	});
	
	}  */

/* 	const image = document.querySelector(".image");
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
 */
</script>
</head>
<body>


	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<!-- form에서 입력한 첨부파일을 보낼때 MultipartFile로 보낸다. -->

		<table>
			<tr>
				<td width="20%" align="center">카테고리</td>
				<td><select name="category">
						<optgroup label="카테고리">
							<option value="1">자유게시판</option>
							<option value="2">공지사항</option>
						</optgroup>
				</select></td>
			</tr>

			<tr>
				<td width="20%" align="center">제목</td>
				<td><c:if test="${dto!=null}">답변</c:if> 
				<input type="text" name="title" size="40" /></td>
			</tr>

			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea name="content" rows="13" cols="40"></textarea></td>

			</tr>

		</table>
	<div class="row">
			<div class="uploadContainer">
				<div class="image hover-up-button">사진 첨부</div>
				<input type="file" name="files" id="upImgFiles"
					onChange="uploadImgPreview();" accept="image/*" multiple/>

				<div id="thumbnailImgs"></div>
			</div>
		</div>
		
		<input type="button" id="btnList1" value="목록" />
		<input type="button"id="btnSave" value="저장" />
			<input type="button" id="btnCancel"value="취소" />
	</form>
	
</body>
</html>









