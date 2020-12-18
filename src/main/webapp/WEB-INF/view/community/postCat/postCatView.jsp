<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- boot strap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- Slick -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/slick/slick-theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/button.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/slick/slick.min.js"></script>
<!-- boot strap -->
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


<title>Insert title here</title>
<script type="text/javascript">
      $.noConflict();
</script>

<script>
	$(document).ready(function() {

        $('.post_cat_modal').on('click', function() {  
  		  prePostCatId = $(this).data('postcatid');
  		  var postCatId = Number(prePostCatId); 
  		  var listIndex = $(this).data('listindex');
  		  userId = "<%=session.getAttribute("userId") %>";
  		  $('.modal-reply-write').data('listIndex', listIndex);
  		  
		  currentViewCount = $('#post_cat_view_count'+listIndex).text();
		  newViewCount = Number(currentViewCount)+1;
		  console.log("newViewCount: " + newViewCount)
		  $('#post_cat_view_count'+listIndex).text(newViewCount);
	  	  
        	//모달
        	$.ajax({
        		type: 'POST',
        		url: 'modal.do',
        		dataType: 'json',
        		data: 'postCatId='+postCatId,
        		success: result_list
        	});
        	
        })
        
        //게시글 수정 버튼
        $(document).on("click","#modal_modify",function(){
        	var preContent = $('#modal_content').text();
        	$('.modal-body').append('<textarea id="modal_content_modify"  rows="5" cols="70" maxlength="100">' + preContent + '</textarea>');
        	$('#modal_content').remove();
        	$('#modal_modify').css("display", "none");
        	$('#modal_modify_complet').css("display", "inline-block");
        })
        
        //게시글 수정완료 버튼
        $(document).on("click","#modal_modify_complet",function(){
        	$('#modal_modify').css("display", "inline-block");
        	$('#modal_modify_complet').css("display", "none");
			var postCatId = $(".modal-footer").data("postcatid");
			
			var modifiedContent = $('#modal_content_modify').val();
			//수정한 내용 db에 업데이트
			$.ajax({
        		type: 'POST',
        		url: 'postCatModify.do',
        		dataType: 'json',
        		data: 'postCatId='+postCatId + '&modifiedContent=' + modifiedContent
			})
        	$('#modal_content_modify').remove();
			$('.modal-body').append('<p id="modal_content">' + modifiedContent + '</p>');
			var now =  new Date();
			nowDate = new Date(now).toLocaleDateString();
			nowTime = new Date(now).toLocaleTimeString();
			$('#postCatUpdatedAt').html(nowDate + ' ' + nowTime);
			alert("게시글이 수정 되었습니다.");
        })
        
        /* function  */
        
    })
    
    //모달 내용 삭제 기능
    function removeModalDetail(){
		$('#modal_img').remove();
    	$('#modal_nickname').remove();
    	$('#modal_content').remove();
    	$('#modal_profile_img').remove();
    	$('#modal_catName').remove();
    	$('#modal_catAge').remove();
    	$('#madal_catKind').remove();
    	$('#madal_postCatLikeCount').remove();
    	$('#madal_postCatViewCount').remove();
    	$('#postCatUpdatedAt').remove();
    	$('#modal_content').remove();
    	$('#modal_content_modify').remove();
    	$('.modal-reply').empty();
    	$('#modal_modify').remove();
    	$('#modal_modify_complet').remove();
    	$('#post_cat_del').remove();
    	$('#reply_write').val('');
    	$('.modal-header').children().first().remove();
    	$('.modal-header').append("<div class='modal-image-area'></div>");
    	console.log('chk')
	};
	
	
	
       $(document).on("click",'#modal_close',function(){

       	if (document.getElementById('modal_nickname')) {
       		removeModalDetail();
   		}
       	console.log('chk')
        }) 
    
	
    //모달
    function result_list(data){
		var res = data.modalDetail;
		var likeChk = data.likeChk;
		var sessionNickname = "<%=session.getAttribute("userNickname") %>";
		var postCatId = res[0].id
		var imgList = res[0].mediaList;
		var nickname = res[0].catUser.nickname;
		var content = res[0].content;
		var profileImg = res[0].catUser.image;
		var catName = res[0].cat.name;
		var catAge = res[0].cat.age;
		var catKind = res[0].catKind.kind;
		var postCatLikeCount = 0;
		if(res[0].likeCounting){
			postCatLikeCount = res[0].likeCounting.likeCount;
		}else{
			postCatLikeCount = 0
		}
		var postCatViewCount = res[0].viewCount;
		
		var postCatUpdatedAt = res[0].updatedAt;
		postCatUpdatedAtDate = new Date(postCatUpdatedAt).toLocaleDateString();
		postCatUpdatedAtTime = new Date(postCatUpdatedAt).toLocaleTimeString();
		
		var postCatReplyList = res[0].replyList;
		var postCatReplyListLength = res[0].replyList.length;
		
		/* for(i=0;i<imgList.length;i++){
			$('.modal-image-area').append('<img id="modal_img" src="/huimyoelag/upload/' + imgList[i].url + '" />');
		} */
		$('.modal-image-area').append('<img id="modal_img" src="/huimyoelag/upload/' + imgList[0].url + '" />');
		$('.modal-profile').append('<img id="modal_profile_img" src="/huimyoelag/upload/' + profileImg + '" />');
		$('.modal-profile').append('<p id="modal_nickname">' + nickname + '</p>');
		$('.modal-profile').append('<p id="modal_catName">'+ "이름: " + catName + '</p>');
		$('.modal-profile').append('<p id="modal_catAge">'+ "나이: " + catAge + "살" + '</p>');
		$('.modal-profile').append('<p id="madal_catKind">'+ "품종: " + catKind + '</p>');
		$('.modal-profile').append('<p id="madal_postCatLikeCount">'+ "좋아요: " + postCatLikeCount + "개" + '</p>');
		$('.modal-profile').append('<p id="madal_postCatViewCount">'+ postCatViewCount + "명이 다녀갔냥" + '</p>');
		
		if(likeChk){
			$('#like_image').attr('src', '/huimyoelag/upload/fullheart.png');
			$('#like_btn').attr('onclick', 'cancleLike(' + postCatId + ')');
		}else{
			$('#like_btn').attr('onclick', 'incLike(' + postCatId + ')');
		}
		
		$('.modal-body').append('<p id="postCatUpdatedAt">' + postCatUpdatedAtDate + " " + postCatUpdatedAtTime + '</p>');
		$('.modal-body').append('<p id="modal_content">' + content + '</p>');
		
		$('#reply_write_complet').attr('onclick', 'reply_write_complet(' + postCatId + ', ' + postCatReplyListLength + ')');
		
		$('.modal-footer').data('postcatid', res[0].id);
		
		console.log('nickname: ' + nickname)
		console.log('sessionNickname: ' + sessionNickname)
		
		if(nickname == sessionNickname){
			$('.modal-footer').prepend('<button id="modal_modify">수정</button>')
			$('.modal-footer').prepend('<button id="modal_modify_complet" style="display:none"> 수정 완료 </button>')
			$('.modal-footer').prepend('<a href="#" id="post_cat_del">삭제</a>')
		}
		
		for(var i = 0 ; i<postCatReplyListLength ; i++){
			var modalReplyCreatedAt = res[0].replyList[i].createdAt;
			modalReplyCreatedAtDate = new Date(modalReplyCreatedAt).toLocaleDateString();
			modalReplyCreatedAtTime = new Date(modalReplyCreatedAt).toLocaleTimeString();
			var replyId = res[0].replyList[i].id;
			var replyName = postCatReplyList[i].replyName;
			var replyContent = postCatReplyList[i].content;
			
			$('.modal-reply').append('<div id="modal_reply' + [i] +'"></div>');
			$('#modal_reply' + [i]).data('i', [i]);
			$('#modal_reply' + [i]).data('replyId', replyId);
			
			$('#modal_reply' + [i]).append('<img id="modal_reply_img" src=/huimyoelag/upload/"' + postCatReplyList[i].replyImage + '" />');
			$('#modal_reply' + [i]).append('<p id="modal_reply_name' + [i] + '">' + replyName + '</p>');
			$('#modal_reply' + [i]).append('<p id="modal_reply_content' + [i] + '">' + replyContent + '</p>');
			
			$('#modal_reply' + [i]).append('<p id="modal_reply_likeCount' + [i] + '">' + postCatReplyList[i].likeCount + '</p>');
			$('#modal_reply' + [i]).append('<p id="modal_reply_createdAt' + [i] + '">' + modalReplyCreatedAtDate + " " + modalReplyCreatedAtTime + '</p>');
			
			if(replyName == sessionNickname){
				$('#modal_reply' + [i]).append('<button id="modal_reply_modify' + [i] + '" onclick="replyModify(this.id)" value="' + [i] +'">댓글 수정</button>');
				$('#modal_reply' + [i]).append('<button id="modal_reply_modify_complet' + [i] + '" onclick="replyModifyComplet(this.id)" value="' +[i] +'" style="display:none">댓글 수정 완료</button>');
				$('#modal_reply' + [i]).append('<button id="post_cat_reply_del' + [i] + '" onclick="replyDel(this.id)" value="' + [i] + '" ">삭제</button>');
		       
			}
			
		}
		
		//모달 이미지 슬라이더
    	/* $('.modal-image-area').slick({
    		  dots: true,
    		  infinite: true,
    		  speed: 500,
    		  fade: true,
    		  cssEase: 'linear'
		}); */

		
		//게시글 삭제
        $(document).on("click","#post_cat_del",function(){
            if(confirm("게시글을 삭제 하시겠습니까?") == true){
            	$('#post_cat_del').attr("href", 'postCatDel.do?postCatId=' + res[0].id);
    			$('#modal_modify').remove();
            	$('#modal_modify_complet').remove();
            	$('#post_cat_del').remove();
            }
            else{
                return;
            }

        })
        
	}
	
	//댓글 수정
	function replyModify(i){
    	num = $('#' + i).val();
    	var preReplyContent = $('#modal_reply_content' + num).text();
    	$('#modal_reply_name' + num).after('<textarea id="modal_reply_content_modify' + num + '" rows="3" cols="40" maxlength="100">' + preReplyContent + '</textarea>');
    	$('#modal_reply_content' + num).remove();
    	$('#modal_reply_modify' + num).css("display", "none");
    	$('#modal_reply_modify_complet' + num).css("display", "inline-block");
    }
	
	//댓글 수정완료
	function replyModifyComplet(i){
		num = $('#' + i).val();
		replyId = $('#modal_reply' + num).data('replyId');
       	console.log("완료 num: " + num);
       	console.log("replyId: " + replyId);
       	
       	$('#modal_reply_modify' + num).css("display", "inline-block");
       	$('#modal_reply_modify_complet' + num).css("display", "none");
		var modifiedReplyContent = $('#modal_reply_content_modify' + num).val();
		//수정한 내용 db에 업데이트
		$.ajax({
       		type: 'POST',
       		url: 'postCatReplyModify.do',
       		dataType: 'json',
       		data: 'replyId=' + replyId + '&modifiedReplyContent=' + modifiedReplyContent
		})
       	$('#modal_reply_content_modify' + num).remove();
		console.log('#modal_reply_content_modify' + num);
		$('#modal_reply_name' + num).after('<p id="modal_reply_content' + num + '">' + modifiedReplyContent + '</p>');
		alert("댓글이 수정 되었습니다.");
    }
	
	//댓글 삭제
	function replyDel(i){
		num = $('#' + i).val();
		 if(confirm("댓글을 삭제 하시겠습니까?") == true){
			 modifiedId = $('#modal_reply' + num).data('replyId');
		    	
				//삭제 db에 업데이트
				$.ajax({
		    		type: 'POST',
		    		url: 'postCatReplyDel.do',
		    		dataType: 'json',
		    		data: 'replyId=' + modifiedId
				})
				
		    	$('#modal_reply' + num).remove();
				$('#modal_reply_modify' + num).remove();
		    	$('#modal_reply_modify_complet' + num).remove();
		    	$('#post_cat_reply_del' + num).remove();
		    	
		    	checkIndex = $('.modal-reply-write').data('listIndex');
				currentReplyCount = $('#post_cat_reply_count'+checkIndex).text();
				newReplyCount = Number(currentReplyCount)-1 ;
				$('#post_cat_reply_count'+checkIndex).text(newReplyCount);
			 
		    }
		    else{
		        return ;
		    }


	}
	
	//댓글 작성
	function reply_write_complet(pcId, replyNum){
		if(confirm("댓글을 등록하시겠습니까 ?") == true){
			postCatId = pcId;
			userId = "<%=session.getAttribute("userId") %>";
			userName = "<%=session.getAttribute("userNickName") %>";
			userImage = "<%=session.getAttribute("userImg") %>";
			content = $('#reply_write').val();

			//댓글 작성 db 업데이트
			$.ajax({
				type : 'POST',
				url : 'postCatReplyWrite.do',
				dataType : 'json',
				data : 'postCatId=' + postCatId + '&userId=' + userId
						+ '&content=' + content + '&replyNum=' + replyNum,
				success : function(replyWrtie) {
					replyId = replyWrtie[0];
					replyNum = replyWrtie[1];
					$('#modal_reply' + replyNum).data('replyId', replyId);
				}
			})

			//모달창에 새로운 댓글 추가
			console.log("replyNum:" + replyNum);
			now = new Date();
			modalReplyCreatedAtDate = new Date(now).toLocaleDateString();
			modalReplyCreatedAtTime = new Date(now).toLocaleTimeString();

			$('.modal-reply').append(
					'<div id="modal_reply' + replyNum +'"></div>');
			$('#modal_reply' + replyNum).data('i', replyNum);
			$('#modal_reply' + replyNum).data('replyId', userId);

			$('#modal_reply' + replyNum).append(
					'<img id="modal_reply_img" src=/huimyoelag/upload/"' + userImage + '" />');
			$('#modal_reply' + replyNum).append(
					'<p id="modal_reply_name' + replyNum + '">' + userName
							+ '</p>');
			$('#modal_reply' + replyNum).append(
					'<p id="modal_reply_content' + replyNum + '">' + content
							+ '</p>');

			$('#modal_reply' + replyNum).append(
					'<p id="modal_reply_likeCount' + replyNum + '">' + 0
							+ '</p>');
			$('#modal_reply' + replyNum).append(
					'<p id="modal_reply_createdAt' + replyNum + '">'
							+ modalReplyCreatedAtDate + " "
							+ modalReplyCreatedAtTime + '</p>');

			$('#modal_reply' + replyNum).append(
					'<button id="modal_reply_modify' + replyNum
							+ '" onclick="replyModify(this.id)" value="'
							+ replyNum + '">댓글 수정</button>');
			$('#modal_reply' + replyNum).append(
					'<button id="modal_reply_modify_complet' + replyNum
							+ '" onclick="replyModifyComplet(this.id)" value="'
							+ replyNum
							+ '" style="display:none">댓글 수정 완료</button>');
			$('#modal_reply' + replyNum).append(
					'<button id="post_cat_reply_del' + replyNum
							+ '" onclick="replyDel(this.id)" value="'
							+ replyNum + '" ">삭제</button>');

			nextNumber = Number(replyNum) + 1;
			$('#reply_write_complet').attr(
					'onclick',
					'reply_write_complet(' + postCatId + ', ' + nextNumber
							+ ')');

			$('#reply_write').val("");

			checkIndex = $('.modal-reply-write').data('listIndex');
			currentReplyCount = $('#post_cat_reply_count' + checkIndex).text();
			newReplyCount = Number(currentReplyCount) + 1;
			$('#post_cat_reply_count' + checkIndex).text(newReplyCount);
		} else {
			return;
		}

	}

	function cancleLike(postCatId) {
		//좋아요 db 삭제
		$.ajax({
			type : 'POST',
			url : 'cancleLike.do',
			dataType : 'json',
			data : 'postCatId=' + postCatId
		})

		$('#like_image').attr('src', 'images/emptyheart.png');
		$('#like_btn').attr('onclick', 'incLike(' + postCatId + ')');
    	checkIndex = $('.modal-reply-write').data('listIndex');
    	currentLikeCount = $('#post_cat_like_count'+checkIndex).text();
    	newLikeCount = Number(currentLikeCount)-1;
		$('#post_cat_like_count' + checkIndex).text(newLikeCount);
	}

	function incLike(postCatId) {
		//좋아요 db 추가
		$.ajax({
			type : 'POST',
			url : 'incLike.do',
			dataType : 'json',
			data : 'postCatId=' + postCatId
		})
		$('#like_image').attr('src', '/huimyoelag/upload//fullheart.png');
		$('#like_btn').attr('onclick', 'cancleLike(' + postCatId + ')');
    	checkIndex = $('.modal-reply-write').data('listIndex');
		currentLikeCount = $('#post_cat_like_count'+checkIndex).text();
    	newLikeCount = Number(currentLikeCount)+1;
		$('#post_cat_like_count' + checkIndex).text(newLikeCount);

	}
	
	$(document).on("toggle","#dropdownMenuButton",function(){
		$('.dropdown-menu').attr("style", "display:block");
	})
	
	var dropMenuBtn = $('#dropdownMenuButton');
	var dropMenu = $('.dropdown-menu');
	
	dropMenuBtn.click(function(){
		dropMenu.toggle(
			function(){dropMenu.addClass('show')},
			function(){dropMenu.addClass('hide')},
		);
	});
	
	
</script>

<style type="text/css">
	.show{
	display: block;
	}
	
	.hide{
	display: none;
	}
	.content_body{
		width: 1080px;
		margin: 0 auto;
	}
	
	.card-body {
		color: black;
	}
	
	.post_cat_count {
		display: inline-flex;
	}
	
	.btn-primary {
		display: block;
	}
	
	.modal-header .close {
		padding: unset;
		margin: 0 0 0 750px;
		position: absolute;
	}
	
	#write-btn-container{
		margin: 30px 0 30px 0;
	}
	
	button#post_cat_modal{
		display: inline-block;
		margin: 0 40px 40px 0;
		
	}
	
	.btn-primary{
		background-color: #ffffff;
		outline: 0;
		border: 2px solid #ffffff;
	}
	.btn-primary:hover{
		background-color: #ffffff;
		border: 2px solid rgb(233 181 210);
	}
	#modal_profile_img, #modal_reply_img, .post_cat_user_image {
		width: 40px;
		height: 40px;
	}
	
	#modal_nickname {
		display: inline-flex;
	}
	
	#modal_reply_name {
		display: inline-flex;
	}
	
	.modal-reply, .modal-reply-write, .modal-body, .modal-like {
		border-top: 1px solid #dee2e6;
		padding: 1rem;
		position: relative;
	}
	
	.modal-profile {
		padding: 1rem;
		position: relative;
	}
	
	#like_btn {
		padding: unset;
		border: none;
		width: 50px;
		height: 50px;
	}
	
	#like_image {
		width: 100%;
		height: 100%;
	}
	
	.modal-image-area{
		max-width: 300px;
		max-height: 300px;
	}
	
	.slick-track{
		/* width: 300px !important; */
		width: 300px !important;
		height: 300px !important;
	}
	
	#modal_img{
		max-width: 100%;
		height: 300px;
	}
	
	.slick-track img{
		max-width: 300px;
		width: 300px;
		/* height: fit-content; */
		height: 300px;
		max-height: 300px;
	}
	
	.dropdown-menu{
		z-index: 1500;
	}
	
	#post_cat_count p{
		font-size: 12px;
		margin: auto;
	}
	
	#post_cat_count{
		display: flex;
	}
	.modal-content{
		display: flex;
	}
</style>

</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
			<div class="moadl-left">
				<div class="modal-header">
					<div class="modal-image-area"></div>
				</div>
				<div class="modal-like">
					<button id="like_btn">
						<img src="/huimyoelag/upload/emptyheart.png" id=like_image>
					</button>
				</div>
			</div>
			<div class="moadl-right">
				<div class="modal-profile"></div>
				<div class="modal-body"></div>
				<div class="modal-reply"></div>
				<div class="modal-reply-write">
					<p>댓글작성하기</p>
					<textarea id="reply_write" rows="3" cols="40" maxlength="100"></textarea>
					<button id="reply_write_complet">작성 완료</button>
				</div>
				<div class="modal-footer">
					<button id="modal_close" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>

			</div>
		</div>
	</div>
	<!-- Post Cat List -->
	<div class="content_body">
		<!-- write new post -->
		<div id="write-btn-container">
			<a class="hover-up-button" href="writeForm.do?userId=<%=session.getAttribute("userId") %>">글쓰기</a>
		</div>
		<!-- post list -->
		<c:forEach items="${list}" var="list" varStatus="status">
			<button type="button" id="post_cat_modal"
				class="btn btn-primary post_cat_modal" data-toggle="modal"
				data-target="#exampleModal" data-backdrop="static" data-keyboard="false" data-postcatid="${list.id}"
				data-listIndex="${status.index}">
				<div class="card" style="width: 18rem;">
					<div class="image-test">
						<img src="/huimyoelag/upload/${list.mediaList[0].url}" class="card-img-top" />
					</div>
					<div class="card-body">
						<div id="post_cat_profile">
							<img class="post_cat_user_image" src="/huimyoelag/upload/${list.catUser.image}" />
							<h5 class="post_cat_user_nickname">${list.catUser.nickname}</h5>
						</div>
						<div id="post_cat_count">
							<p id="post_cat_view_count${status.index}">조회수: ${list.viewCount}</p>

							<c:set var="likecount" value="${list.likeCounting.likeCount}" />
							<c:choose>
								<c:when test="${likecount==null}">
									<p id="post_cat_like_count${status.index}">좋아요: 0</p>
								</c:when>
								<c:otherwise>
									<p id="post_cat_like_count${status.index}">좋아요: ${list.likeCounting.likeCount}</p>
								</c:otherwise>
							</c:choose>

							<c:set var="replycount" value="${list.replyCounting.replyCount}" />
							<c:choose>
								<c:when test="${replycount==null}">
									<p id="post_cat_reply_count${status.index}">댓글: 0</p>
								</c:when>
								<c:otherwise>
									<p id="post_cat_reply_count${status.index}">댓글: ${list.replyCounting.replyCount}</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</button>
		</c:forEach>
	</div>

</body>
</html>