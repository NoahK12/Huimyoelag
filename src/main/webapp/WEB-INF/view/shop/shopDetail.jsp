<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.section {
	width: 1100px;
	margin: 0 auto;
}

.detailView {
	height: 1000px;
	padding-top: 50px;
}

.detailView .itemDetail {
	width: 100%;
	margin: 0 auto;
	display: flex;
}

.detailView .itemDetail .itemImages {
	width: 50%;
	height: 700px;
	border-radius: 10px;
}

.detailView .itemDetail .itemImages .imageArea {
	margin-bottom: 30px;
}

#forPreview {
	height: 500px;
}

.detailView	.itemDetail .itemImages .imageList {
	height: 15%;
}

#forPreview {
	height: 500px;
}

.detailView .itemDetail .itemImages .imageList {
	height: 15%;
}

.detailView .itemDetail .itemSpecsDetail {
	width: 50%;
	height: 700px;
	padding: 0 20px;
}

.detailView .itemDetail .itemSpecsDetail .itemSpec {
	height: 230px;
	font-size: 20px;
	margin-bottom: 30px;
	border-bottom: 2px solid gainsboro;
}

.specTitle {
	font-size: 30px;
	margin: 10px 0;
}

.specDesc {
	font-size: 14px;
}

.specEvaluate {
	font-size: 12px;
	margin: 5px 0;
}

.specPrice {
	text-align: right;
	font-weight: bolder;
	font-size: 50px;
}

.detailView .itemDetail .itemSpecsDetail .orderArea {
	height: 30%;
}

.orderQuantity {
	height: 100px;
	padding: 10px;
}

.quantityInner {
	height: 60px;
	background-color: gainsboro;
	border-radius: 10px;
	/* line-height: 60px; */
	padding-top: 15px;
}

span#quantityText {
	font-size: medium;
	margin-left: 20px;
}

span#quantityValue {
	float: right;
	margin-right: 20px;
}

span#quantityValue input {
	height: 30px;
}

span#quantityValue input[type="text"] {
	width: 50px;
}

span#quantityValue input[type="button"] {
	width: 30px;
}

div.orderTotal {
	margin-bottom: 30px;
}

span#orderText {
	font-size: x-large;
}

span#orderValue {
	float: right;
	font-size: x-large;
}

span#orderValue input {
	border: none;
	color: gray;
	font-size: x-large;
	font-weight: bold;
	width: 120px;
	text-align: right;
}

.orderBtnArea {
	clear: both;
	width: 100%;
	display: flex;
}

.orderBtnArea div {
	width: 45%;
	height: 50px;
	border: 2px solid gainsboro;
	border-radius: 10px;
	text-align: center;
	line-height: 45px;
	font-size: larger;
	font-weight: bold;
	cursor: pointer;
}

.orderBtnArea div:hover {
	border: 2px solid brown;
}

.orderBtnArea div.basketBtn {
	margin-right: 50px;
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/slick/slick-theme.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="section">
		<form action="">
			<input type="hidden" value="${productId }" />
		</form>
		<div class="detailView">
			<div class="itemDetail">
				<div class="itemImages">
					<div class="imageArea slider-for">
						<c:forEach items="${detailImages }" var="di">
							<img src="/huimyoelag/upload/${di.url }" alt="이미지사진" id="forPreview" />
						</c:forEach>
					</div>
					<div class="imageList slider-nav">
						<c:forEach items="${detailImages }" var="di">
							<img src="/huimyoelag/upload/${di.url }" alt="이미지사진" id="listPreview" />
						</c:forEach>
					</div>
				</div>
				<div class="itemSpecsDetail">
					<div class="itemSpec">
						<c:forEach items="${productDetail }" var="pd">
							<div class="specBrand">${pd.brand }</div>
							<div class="specTitle">${pd.title }</div>
							<div class="specDesc">${pd.description }</div>
							<div class="specEvaluate">
								<span class="specRating">${pd.rating }</span>
								<span class="specReview"></span>
							</div>
							<div class="specPrice">
								<input type="hidden" value="${pd.price}" id="getPrice">
								<fmt:formatNumber value="${pd.price}" pattern="#,###" />
								원
							</div>
						</c:forEach>
					</div>
					<div class="orderArea">
						<form action="orderPage.do">
							<div class="orderQuantity">
								<div class="quantityInner">
									<span id="quantityText">수량</span>
									<span id="quantityValue">
										<input type="button" value="━" onclick="del();" />
										<input type="text" id="amount" value="1" size="3" onchange="amountChange();">
										<input type="button" value="┼" onclick="add();" />
									</span>
								</div>
							</div>
							<div class="orderTotal">
								<span id="orderText">총 상품금액</span>
								<span id="orderValue">
									<input type="text" id="sum" size="11" readonly="readonly">
									원
								</span>
							</div>
							<div class="orderBtnArea">
								<div class="basketBtn">장바구니</div>
								<div class="orderBtn">주문하기</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/slick/slick.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.slider-for').slick({
				slidesToShow : 1,
				slidesToScroll : 1,
				arrows : false,
				fade : true,
				asNavFor : '.slider-nav'
			});

			$('.slider-nav').slick({
				slidesToShow : 3,
				slidesToScroll : 1,
				asNavFor : '.slider-for',
				dots : true,
				centerMode : true,
				focusOnSelect : true
			});

		});

		/* 가격 계산 */

		var sell_price = document.getElementById('getPrice').value;
		var amount = document.getElementById('amount').value;
		var hm = document.getElementById('amount');
		var sum = document.getElementById('sum');

		document.getElementById('sum').value = sell_price;

		function add() {
			hm.value++;
			sum.value = parseInt(hm.value) * sell_price;
		}

		function del() {
			if (hm.value > 1) {
				hm.value--;
				sum.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = parseInt(hm.value) * sell_price;
		}
	</script>
</body>
</html>