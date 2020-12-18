<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.section {
	width: 1100px;
	margin: 0 auto;
}

.shop-container {
	max-width: 1100px;
	margin: 0 auto;
}

.shop-top {
	margin-top: 50px;
	text-align: center;
}

.shop-top>p {
	font-size: 15px;
	font-weight: 300;
	color: #1E262C;
	margin-bottom: 8px;
	line-height: 15px;
}

.shop-top>h3 {
	font-size: 39px;
	font-weight: 800;
	color: #1E262C;
	line-height: 46px;
}

.shop-category {
	display: inline-block;
	padding: 20px 0 0 0;
}

.order-category {
	float: right;
	padding: 20px 0 0 0;
}

.category-nav {
	margin: 20px 0 0;
	height: 40px;
	line-height: 40px;
}

.category-nav .cateSelect:hover {
	border-radius: 5px;
	border: 2px solid black;
}

.category-nav #cateMain {
	margin-right: 40px;
}

.cateSelect {
	width: 130px;
	height: 40px;
	border-radius: 10px;
	font-size: 15px;
}

.searchItem ul {
	list-style: none;
	font-size: 0;
}

.searchItem>ul {
	margin-left: -20px;
}

.itemListStyle {
	list-style: none;
	display: inline-block;
	box-sizing: border-box;
	width: 25%;
	vertical-align: top;
	padding: 20px 0 0 20px;
}

.itemListStyle .itemImageArea {
	margin: 0 auto;
	width: 255px;
	height: 250px;
	border-radius: 10px;
	border: none;
}

img#listPreview {
	max-width: 100%;
	height: 250px;
	border-radius: 10px;
}

.itemListStyle .itemInfoArea {
	padding: 7px 0 0 0;
}

.itemListStyle .itemInfoArea li {
	padding-bottom: 5px;
}

.itemListStyle .itemInfoArea li.itemName {
	font-size: 15px;
}

.itemListStyle .itemInfoArea li.itemName a {
	text-decoration: none;
	color: black;
}

.itemListStyle .itemInfoArea li.itemName a:hover{
	text-decoration: underline;
}

.itemListStyle .itemInfoArea li.itemPrice {
	font-size: 15px;
	text-align: right;
}

.itemListStyle .itemInfoArea li.itemSell {
	font-size: 12px;
	color: gray;
}

/* b::after {
	content: "|";
	padding-left: 5px;
} */

.pagging {
	margin-bottom: 50px;
}
</style>
<div class="section">
	<form action="" method="get">
		<input type="hidden" value="${categoryNum }" id="categoryId" />
		<input type="hidden" value="${categorySubName }" id="categorySubName" />
	</form>
	<div class="shop-container">
		<div class="shop-top">
			<p>사랑스런 우리 아이의 선물을 골라주세요!</p>
			<h3>냥냥이 스토어</h3>
		</div>
		<div class="shop-category">
			<span class="category-nav">
				<select id="cateMain" class="cateSelect">
					<option selected value=0>전체</option>
					<c:forEach items="${categoryListView }" var="clv">
						<option value="${clv.cateId }">${clv.mainCategory }</option>
					</c:forEach>
				</select>
			</span>
			<span class="category-nav" id="sub-nav">
				<select id="cateSub" class="cateSelect">
					<option selected value=0>전체</option>
					<c:forEach items="${categoryList2View }" var="clv2" varStatus="status">
						<option>${clv2.subCategory }</option>
					</c:forEach>
				</select>
			</span>
		</div>

		<div class="writeBtn" style="float: right; padding: 20px 0 0">
			<form action="writeForm.do">
				<button type="submit">글쓰기</button>
			</form>
		</div>

		<div class="clear" style="clear: both"></div>
	</div>

	<div class="searchItem">
		<ul>
			<c:forEach items="${productListView}" var="plv">
				<c:forEach items="${plv.productList}" var="pl">
					<li class="itemListStyle">
						<div class="itemImageArea">
							<a href="detail.do?itemId=${pl.id }"> <img src="/huimyoelag/upload/${pl.productMediaList[0].url }" alt="이미지사진" id="listPreview" />
							</a>
						</div>
						<ul class="itemInfoArea">
							<li class="itemName">
								<a href="detail.do?itemId=${pl.id }">${pl.title }</a>
							</li>
							<li class="itemPrice">
								<fmt:formatNumber value="${pl.price }" pattern="#,###" />
								원
							</li>
							<li class="itemSell">
								<span class="itemReadCount">
									조회수 <b>${pl.readCount }</b>
								</span>
								<span class="itemSale">
									<%-- 판매량 <b>${pl.saledCount }</b> --%>
								</span>
								<span class="itemRating">
									<%-- 별점 <b>${pl.rating }</b> --%>
								</span>
							</li>
						</ul>
					</li>
				</c:forEach>
			</c:forEach>
		</ul>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(
			function() {
				var categoryId = $('#categoryId').val();
				var categorySubName = $('#categorySubName').val();
				var categoryOrder = $('#categoryOrderBy').val();

				/* 메인카테고리 변경 */
				if (categoryId != 0) {
					$('select#cateMain option[value=' + categoryId + ']').attr(
							'selected', 'selected');
				} else {
					$('#sub-nav').css('display', 'none');
				}

				$('#cateMain').change(function() {
					var value = $('#cateMain').val();

					if (value != 0) {
						location.href = '?category=' + value;
					} else {
						location.href = 'list.do';
					}
				});

				/* 서브카테고리 변경 */
				if (categorySubName != "") {
					$('select#cateSub').val(categorySubName).attr('selected',
							'selected');
					console.log("categorysubName = " + categorySubName);
				}

				$('#cateSub').change(
						function() {
							var value = $('#cateSub').val();
							var item = $('#cateSub option:selected').text();

							if (value != 0) {
								location.href = '?category=' + categoryId
										+ '&subCategoryName=' + item;
							} else {
								location.href = '?category=' + categoryId;
							}
						});
			});
</script>