<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#no_img{
	margin: 15px;
}

table {
	/* border: 1px solid; */
	width: 80%;
}

table, th, td {
	border: 1px solid;
	border-collapse: collapse;
}

th.an {
	width: 20%;
}

textarea#ta1 {
	width: auto;
	height: auto;
	resize: none; /* 사용자 임의 변경 불가 */
}

.modifyHide {
	visibility: hidden;
	width: 0px;
	height: 0px;
}

textarea #ab {
	width: 100px;
	height: 100px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script type="text/javascript">
	var urno;
	$(document).ready(function() {
		$("#list").on('click', listRun);
		//	$("#replyAddBtn").on('click', reply_list);
		$("#upt").on('click', uptRun);
		$("#del").on('click', delRun);
		$("#btnModify").on('click', reload);
		$("#replyAddBtn").on('click', reload);
	});

	function listRun() {
		$('form').attr('action', 'list.do').submit();
		/* form이라는 요소에 list.sb라는 action을 설정하고 강제적으로 submit을 발생 시키는 것이다. */

	}///////////////////

	/* function replyRun(){
		$('form').attr('action', 'write.sb').submit(); 
		
	}//////////////////  */

	function uptRun() {
		$('form').attr('action', 'update.do').submit();

	}//////////////////

	function delRun() {
		$('form').attr('action', 'delete.do').submit();

	}//////////////////
	
	
	
</script>
</head>
<body>


	<table>
		<c:forEach var="dto" items="${dto}" >
		<tr>
			<th class="an">글쓴이</th>
			<td>${dto.userDetail.nickname}</td>
			<th class="an">조회수</th>
			<td>${dto.view_count}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.title}</td>
		</tr>
		<tr>
			<th>등록시간</th>
			<td colspan="3">${dto.updatedAt}</td>
		</tr> 
		<tr>
			<th>내용</th>
			<td class="aa" colspan="3"><textarea id="ta1" rows="13"
					cols="40" readonly="readonly">${dto.content}
				</textarea></td>
		</tr>
			
		</c:forEach>
		<tr>
		<th>게시물사진</th>
		<td colspan="3">
		<c:forEach items="${dto}" var="media">
			<c:forEach items="${media.postMediaList}" var="urlList">
				<div id="no_img" style="float: left;" >
					<img width="264px" height="264px" src="/huimyoelag/upload/${urlList.url}" />
				</div>
			</c:forEach>
		</c:forEach>
		</td>
		</tr>
	</table>

	<form name="frm" method="get">
		
       <c:forEach var="dto" items="${dto}" >
		 <input type="hidden" name="id" value="${dto.id}" /> 
		</c:forEach>
		<!-- 화면에 보일 필요가 없는 것이기 때문에 hidden으로 넘긴다. -->
		<input type="hidden" name="currentPage" value="${pageDTO.currentPage}" />
		<!--  -->
		<input type="hidden" name="searchKey" value="${pageDTO.searchKey}" />
		<input type="hidden" name="searchWord" value="${pageDTO.searchWord}" />
		<input type="button" id="list" value="목록" />
		<!-- <input type="button" id="reply" value="답변" />	 -->
		<input type="button" id="upt" value="수정" /> 
		<input type="button" id="del" value="삭제" />
	</form>
	 <div class="wrap">
		<!-- class="box-body" 시작 -->
		<%-- <div class="box-body">
		    <div class="form-group">
				<label>Title</label> 
				<input type="text"	name='title' class="form-control" 
				       value="${dto.title}" readonly="readonly"> <!-- readonly는 수정 불가 읽기만 가능하게 하고싶을경우 -->
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" name="content" rows="3"
					readonly="readonly">${dto.content}</textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input type="text"
					name="writer" class="form-control" 
					value="${dto.writer}" readonly="readonly">
			</div>
		</div> --%>
		<!-- class="box-body" 끝 -->
		<hr />
		<%-- <!-- box box-success 시작 -->
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">ADD NEW REPLY</h3>
			</div>

			<div class="box-body">
				<label for="newReplyWriter">Writer</label> <input
					class="form-control" type="text" 
					id="newReplyWriter"> 
					<label for="newReplyText">ReplyText</label> 
					<input class="form-control" type="text"
					placeholder="REPLY TEXT" id="newReplyText">
			</div>

			<div class="box-footer">
				<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
					REPLY</button>
			</div>
		</div>
		<!-- box box-success 끝 -->
		<hr />
		
		<ul class="timeline">
			<li class="time-label" id="repliesDiv"><span class="bg-green">RepliesList 
			<small id='replycntSmall'> [ ${fn:length(reply)} ] </small>
			</span></li>

			<c:forEach items="${reply}" var="PostReplyDTO">
				<li class="time_sub" id="${PostReplyDTO.id}">
					<p>${PostReplyDTO.content}</p>
					<p>${PostReplyDTO.createdAt }</p>
					<p>
						<button id="${PostReplyDTO.id}">delete</button>
						<button id="${PostreplyDTO.id}">update</button>
					</p>
				</li>
			</c:forEach>
		</ul>
	</div>

	<div id="modifyModal">
		<p>
			<label for="updateReplyText">Reply Text</label> <input
				class="form-control" type="text" placeholder="REPLY TEXT"
				id="updateReplyText">
		</p>
		<p>
			<button id="btnModify">Modify</button>
			<button id="btnClose">Close</button>
		</p>
	</div> --%>
	
</body>
</html>














