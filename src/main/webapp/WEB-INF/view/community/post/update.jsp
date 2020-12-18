<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#update').on('click', uptRun);
		$('#cancel').on('click', cancelRun);
		$('#back').on('click', backRun);
	});
	
	function uptRun(){
		$('#frm').attr('action', 'update.do').submit(); 
	}

	function cancelRun(){
		$('#frm')[0].reset();
		
	}
	
	function backRun(){
		// history.back(); // 뒤로 돌아가기?.
		history.go(-1); // 숫자를 이용해서 뒤로 가는것. back은 -해주면 된다.
	}
	
	
</script>
<style type="text/css">
table {
	width: 80%;
}
</style>
</head>
<body>

	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th width="20%">글쓴이</th>
				<td>${dto.cat_user_id}</td>
				<th width="20%">등록일</th>
				 <td>${dto.updatedAt}</td>
							</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="title" id="title"
					value="${dto.title}" /></td>
			</tr>

		
			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea name="content"
						id="content" rows="13" cols="40">
						${dto.content}
				</textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input type="file" name="filename" /> <%-- <span>${fn:substringAfter(dto.upload, "_") }</span> --%>
				</td>
			</tr>
		</table>
		<input type="hidden" name="id" value="${dto.id}" />
		 <input type="hidden" name="currentPage" value="${currentPage}" /> 
		 <input type="button" id="update" value="수정" /> 
		 <input type="button" id="cancel" value="취소" />
		 <input type="button" id="back" value="뒤로" />
	</form>
</body>
</html>









