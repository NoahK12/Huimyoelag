<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/test/List_search.css" type="text/css" rel="stylesheet"> <!-- 검색기능 -->
<title>Insert title here</title>
<style type="text/css">
table {
	margin: auto;
	width: 80%;
	
}

table.striped {
	position: relative;
	bottom : 30px;
		
	width: 60%;
	
	/* 중앙으로 */
	left:0; 
	right:0; 
	margin-left:auto; 
	margin-right:auto;
	top : 10px;
    text-align: center;
    line-height: 2.5;
}


#caption{
	position:relative;
	outline: 1px solid #ffce1f;
	width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #ffce1f;
    margin: 20px 10px;
 
}

#caption2{
	
    font-weight: bold;
    outline: 1px solid #ffce1f;
    vertical-align: top;
    color: #000000; /* 글자 */
	margin: 20px 10px;

}

#btnWrite {
	
		/* position:relative;
		bottom: 10px;
		right: 20%;
        width: 70px;
        height: 70px;
        cursor: pointer;
         */
		width: 90px;
	height:90px;
	float: left;
	}
	
td, th {
	border: 1px solid #ffce1f;
	border-collapse: collapse;
}

p {
	margin: auto;
	width: 80%;
	text-align: left;
	margin-bottom: 5px;
}
/*--페이징 스타일---------------------*/
div.pagelist {
	text-align: center;
	margin-right: 195px;
	margin-top: 20px;
}

div.pagelist span {
	margin-right: 8px;
}

div.pagelist span a {
	text-decoration: none;
	border: 1px solid #ffce1f;
	padding: 3px 7px;
	color: #000000;
	font-weight: bold;
	margin-right: 8px;
}

div.pagelist span a:hover, div.pagelist span a:focus {
	background-color: #ffce1f;
	color: white;
}

div #inner form:nth-child(1) {
	float: left;
}

div #inner form:nth-child(2) {
	float: right;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var alist = $("div.pagelist span a");
		$.each(alist, function(index, value) {
			if ($(value).text() == '${pv.currentPage}') {
				$(value).css({
					'background-color' : '#ffce1f',
					'color' : 'white'
				})
				return;
			}
		});

		$('#searchBtn').click(function() {
			$('#frm2').attr('action', 'list.do');
			$('#frm2').submit();
		})

		var getKey = '${pv.searchKey}';
		if (getKey == 'title' || getKey == 'content' || getKey == 'writer') {
			$('[name=searchWord]').val('${pv.searchWord}');
			$('[name=searchKey]').val('${pv.searchKey}');

		}

	});
</script>
</head>
<body>
	<div id="bodywrap">
		<div id="inner">
			<form id="frm" name="frm" method="get" action="writeForm.do">
				
				<!-- <input type="submit" id="btnWrite" value="글쓰기">  -->
				
				
				<input type="image" id="btnWrite" src="${pageContext.request.contextPath}/huimyoelag/upload/icon-write.png"/>
				
				
				
				 <input type="hidden" id="searchKey" value="${PageDTO.searchKey}">
				<input type="hidden" id="searchWord" value="${PageDTO.searchWord}">
				<input type="hidden" id="category" name="category" value="1">
			</form>
			<form id="frm2">
				<select name="searchKey">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">글쓴이</option>
				</select> <input type="text" name="searchWord" /> <input type="button"
					value="검색" id="searchBtn" />
			</form>

			<table class="striped">
				<tr id="caption">
					<th width="5%">번호</th>
					<th width="40%">제목</th>
					<th width="20%">글쓴이</th>
					<th width="10%">시간</th>
					<th width="5%">조회수</th>
				</tr>

				<c:forEach var="dto" items="${test}">
					<tr id="caption2">

						<td>${dto.id}</td>
						<td ><c:url  var="path" value="view.do">
								<c:param name="currentPage" value="${pv.currentPage}" />
								<c:param name="id" value="${dto.id}" />
								<c:param name="searchKey" value="${pv.searchKey}" />
								<c:param name="searchWord" value="${pv.searchWord}" />
								<c:param name="category" value="${pv.category}" />
							</c:url> <a href="${path}">${dto.title}</a></td>

						<td>${dto.userDetail.nickname}</td>
						<td><fmt:formatDate value="${dto.createdAt}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.view_count}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pagelist">
			<!-- 이전 페이지 출력 -->
			<c:if test="${pv.startPage>1}">
				<span><a
					href="list.do?currentPage=${pv.startPage-pv.blockPage}&category=${pv.category}">이전</a></span>
			</c:if>


			<!-- 페이지 출력 -->
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<span><a
					href="list.do?currentPage=${i}&searchKey=${pv.searchKey}&searchWord=${pv.searchWord}&category=${pv.category}"><c:out
							value="${i}" /></a></span>
			</c:forEach>

			<!-- 다음 페이지 출력 -->
			<c:if test="${pv.totalPage>pv.endPage}">
				<span><a
					href="list.do?currentPage=${pv.startPage + pv.blockPage}&category=${pv.category}">다음</a></span>
			</c:if>
		</div>
	</div>

</body>
</html>






