<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Place</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/button.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community/place/write.css" />

</head>
<body>
	<div class="container">
		<form class="writeContainer" action="write.do"
			enctype="multipart/form-data" method="post" id="writeForm">
			<!-- 첫 번째 row -->
			<div class="row">
				<input type="text" class="title" placeholder="제목을 입력해주세요."
					name="title" id="mainTitle" /> <select name="category"
					id="category" class="category" name="category">
					<option value="Cafe">Cafe</option>
					<option value="Park">Park</option>
					<option value="Lodging">Lodging</option>
					<option value="Hospital">Hospital</option>
					<option value="Playground">Playground</option>
				</select>
				<button class="writeButton hover-up-button">등록</button>
				<a href="main.do" class="cancelButton hover-up-button-red">취소</a>
			</div>
			<!-- 두 번째 row -->
			<div class="row">
				<textarea class="content" id="mainContent" placeholder="소개글"
					name="content"></textarea>
			</div>
			<!-- 세 번째 row -->
			<div class="row">
				<div class="rowTitle">지도에서 위치를 선택해보세요!</div>
				<input type="text" name="phoneNumber"
					placeholder="전화번호를 입력해주세요. ex) 010-0000-0000" id="mainPhoneNumber"
					class="phoneNumber" />
				<div class="map_wrap">
					<div id="map"
						style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>
					<div class="hAddr">
						<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
					</div>
				</div>

				<input id="latitude" type="hidden" name="latitude" value="37.566826" />
				<input id="longitude" type="hidden" name="longitude"
					value="126.9786567" /> <input id="address" type="hidden"
					name="address" value="서울특별시 중구 명동" />
			</div>
			<!-- 네 번째 row -->
			<div class="row">
				<div class="rowTitle">사진을 첨부해보세요!</div>
				<div class="uploadContainer">
					<div class="image hover-up-button">사진 첨부</div>
					<input type="file" name="files" id="upImgFiles"
						onChange="uploadImgPreview();" accept="image/*" multiple
						style="display: none" />

					<div id="thumbnailImgs"></div>
				</div>
			</div>
		</form>
	</div>

	<!-- Validation -->
	<script>
		const writeButton = document.querySelector(".writeButton");
		writeButton.addEventListener("click", function(event) {
			if (!validation()) {
				event.preventDefault();
			}
		});

		function validation() {
			if (document.querySelector("#mainTitle").value === "") {
				alert("제목을 입력해주세요.");
				return false;
			} else if (document.querySelector("#mainContent").value === "") {
				alert("내용을 입력해주세요.");
				return false;
			} else if (document.querySelector("#mainPhoneNumber").value === "") {
				alert("전화번호를 입력해주세요.");
				return false;
			} else if (document.querySelector("#upImgFiles").files.length === 0) {
				alert("사진을 추가해주세요.");
				return false;
			}

			return true;
		}
	</script>

	<!-- Kakao Map API -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12243b172e033b23ae51083b1a173797&libraries=services"></script>
		
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event
				.addListener(
						map,
						'click',
						function(mouseEvent) {
							searchDetailAddrFromCoords(
									mouseEvent.latLng,
									function(result, status) {
										if (status === kakao.maps.services.Status.OK) {
											var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
													+ result[0].road_address.address_name
													+ '</div>'
													: '';
											detailAddr += '<div>지번 주소 : '
													+ result[0].address.address_name
													+ '</div>';

											var content = '<div class="bAddr">'
													+ '<span class="title">법정동 주소정보</span>'
													+ detailAddr + '</div>';

											document.querySelector("#address").value = result[0].address.address_name;
											// 마커를 클릭한 위치에 표시합니다 
											marker
													.setPosition(mouseEvent.latLng);
											marker.setMap(map);

											// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
											infowindow.setContent(content);
											infowindow.open(map, marker);
										}
									});

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;
							document.querySelector("#latitude").value = latlng
									.getLat();
							document.querySelector("#longitude").value = latlng
									.getLng();

						});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
	</script>


	<!-- Image 미리 보기 -->
	<script>
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
</body>
</html>