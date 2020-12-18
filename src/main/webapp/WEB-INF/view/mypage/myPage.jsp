<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
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

<link href="${pageContext.request.contextPath}/css/common/header.css" type="text/css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">


<style type="text/css">
#content-body-myPage {
	height: 100%;
	width: 1080px;
	margin: auto;
	margin-top: 5%;
}

/*퀵 메뉴*/
#quick_menu {
	width: 15%;
	text-align: center;
	position: absolute;
	top: 23%;
	left: 5%;
	margin: 1%;
	z-index: 1;
}

/*내 프로필 이미지 설정*/
#myPyhoto {
	border-radius: 50%;
	border: 1px solid;
	width: 100px;
	height: 100px;
	margin: auto;
	margin-top: 20%;
}

/*카드 크기 설정*/
.myCard {
	width: 100px;
}

.catCard {
	display: inline-block;
	margin-right: 4%;
}

#buttonGroup {
	margin: 2%;
}

.insert {
	margin-left: 28%;
}


/*아무런 이미지가 없을경우 삽입*/
#noImageSpace {
	height: 500px;
}

#sexual {
	margin-right: 50px;
}



@media screen and (max-width: 1080px) {
	#content-body-myPage {
		height: 100%;
		width: 650px;
		margin-left: 30%;
		margin-top: 5%;
	}
	#quick_menu {
		width: 26%;
		text-align: center;
		position: absolute;
		top: 23%;
		left: 5%;
		margin: 1%;
		z-index: 1;
	}
	.insert {
		margin-left: 18%;
	}
	
	.catCard {
	display: inline-block;
	margin-right: 4%;
	}
	
	#noImageSpace {
	height: 500px;
	}
	
	#sexual {
		margin-right: 50px;
	}
	
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	$('.lookModalbtn').hide();
	$('.updateModalbtn').hide();
	
	//마이 프로필 카드 자동 스크롤
	var defaultTop=parseInt($('#quick_menu').css('top'));
	 $(document).on('scroll',function(){
		 var scv=$(document).scrollTop();
		 $('#quick_menu').stop().animate({top:scv+defaultTop},1000);
	 });
	 
		 
	   // 선택한 이미지 img요소에 보 이기
	    $("#filepath").on("change", (e) => {
	      const str = $("#filepath").val();
	      console.log("image: " + str);
	      
	      // 이미지 첨부파일인지 체크
	      const patt = /(.jpeg$|.jpg$|.gif$|.png$)/gi;
	      const result = str.match(patt);
	      if(!result){
	         alert("jpg, gif, png만 가능합니다.")
	         $("#filepath").val("");
	         return false;
	      }
	      
	      // 파일첨부 사이즈 체크
	      console.log("size: " + e.target.files[0].size);
	      if(e.target.files[0].size > 1000000000){
	         alert("1GB 이하만 가능합니다.");
	         $("#filepath").val("");
	         return false;
	      }
	      
	      // 파일을 읽기 위한 FileReader 객체 생성
	      const reader = new FileReader();
	      
	      // File내용을 읽어 dataURL 형식의 문자열 저장
	      reader.readAsDataURL(e.target.files[0]);
	
	      // 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	      reader.onload = (e) => { 
	         // img요소의 src속성에 읽어들인 File내용을 지정
	         $("#cardCat").attr("src", e.target.result);
	      }
	    })
    
	   // 선택한 이미지 img요소에 보 이기 (수정시)
	    $("#modifiedFilepath").on("change", (e) => {
	      const str = $("#modifiedFilepath").val();
	      console.log("image: " + str);
	      
	      // 이미지 첨부파일인지 체크
	      const patt = /(.jpeg$|.jpg$|.gif$|.png$)/gi;
	      const result = str.match(patt);
	      if(!result){
	         alert("jpg, gif, png만 가능합니다.")
	         $("#modifiedFilepath").val("");
	         return false;
	      }
	      
	      // 파일첨부 사이즈 체크
	      console.log("size: " + e.target.files[0].size);
	      if(e.target.files[0].size > 1000000000){
	         alert("1GB 이하만 가능합니다.");
	         $("#modifiedFilepath").val("");
	         return false;
	      }
	      
	      // 파일을 읽기 위한 FileReader 객체 생성
	      const reader = new FileReader();
	      
	      // File내용을 읽어 dataURL 형식의 문자열 저장
	      reader.readAsDataURL(e.target.files[0]);
	
	      // 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	      reader.onload = (e) => { 
	         // img요소의 src속성에 읽어들인 File내용을 지정
	         $("#modifiedCardCat").attr("src", e.target.result);
	      }
	    })
	
	
   //memoSubmit 저장 버튼
   $('.myCatSubmit').on('click',function(){
	   
	   //이름 없으면 알림띄우기
	   if($('#name').val()==""){
		   alert("이름을 입력해 주세요.");
		   return
	   }else if($('#legLength').val()==""){
		   alert("종아리 길이를 입력해 주세요.")
		   return
	   }else if($('#circumference').val()==""){
		   alert("둘레를 입력해 주세요.")
		   return
	   }else if($('#rec_calory').val()==""){
		   alert("권장 칼로리를 입력해 주세요.")
		   return
	   }
	   
	   
	   $('#insertfrm').attr('action','myCatSubmit.do')
	   $('#insertfrm').submit();
	   
   })
  
   
   //수정 버튼 눌러서 수정후 리로드함
   $('.updateSubmit').on('click',function(){
	   
	   //이름 없으면 알림띄우기
	   if($('#modifiedName').val()==""){
		   alert("이름을 입력해 주세요.");
		   return
	   }else if($('#modifiedLegLength').val()==""){
		   alert("종아리 길이를 입력해 주세요.")
		   return
	   }else if($('#modifiedCircumference').val()==""){
		   alert("둘레를 입력해 주세요.")
		   return
	   }else if($('#modifiedRec_calory').val()==""){
		   alert("권장 칼로리를 입력해 주세요.")
		   return
	   }
	   
	   
	   $('#updatefrm').attr('action','updateSubmit.do')
	   $('#updatefrm').submit();
   })
   
});//end ready
	
	var catid;
	
	function lookCatCardView(catid){
		
		alert(catid);
		console.log(catid);
		
		catid=catid;
		$('.lookModalbtn').click();
		
		$.ajax({
			
			type: 'GET',
			url: 'lookModal.do',
			dataType:'json',
			data: 'catid='+catid,
			success: function(res){
				console.log(res);
				console.log(res[0]);
				var filename="/huimyoelag/upload/"+res[0]['image'];
				console.log(filename)
					
				$('#lookimage').attr('src',filename)
				$('#lookname').val('이름 : '+ res[0]['name'] +'냥')
				$('#lookage').val('나이 : '+ res[0]['age'] + '냥')
				$('#lookstatus').val('상태 : '+ res[0]['status'])
				$('#lookgender').val('성별 : '+ res[0]['gender'])
				$('#lookweight').val('몸무게 : '+ res[0]['weight'] + '냥')
				$('#looklegLength').val('다리길이 : '+ res[0]['legLength'] + '냥')
				$('#lookcircumference').val('둘레 : '+ res[0]['circumference'] +'냥');
				$('#lookrecCalory').val('권장 칼로리 : '+ res[0]['recCalory'] + '냥')
			}
		})
	}
	
	var deletecatid;
	//카드 삭제 후 다시 출력
	function cardDelete(catid){
		alert(catid);
		
		deletecatid=catid;
		$('#catCardGroup').empty();
		
		$.ajax({
			
			type:'POST',
			dataType: 'json',
			url: 'cardDelete.do',
			data: 'id='+deletecatid,
			success: function(res){
				alert("삭제완료");
				console.log(res);
				
				$.each(res,function(index,value){
					
					$('#catCardGroup').append(
						'<div class="card catCard" style="width: 18rem;">'
						+'<img src="/huimyoelag/upload/'+ value.image +'" class="card-img-top catCard" id="'+ value.id +'" onclick="lookCatCardView(this.id)" alt="...">'
						+'<div class="card-body">'
						+'<h5 class="card-title" style="font-family: "Do Hyeon", sans-serif; font-size: 27px;">'+value.name+'</h5>'
						+'<h7 style="font-family: "Cute Font", cursive; font-size:20px; color: #FF3399;">'+value.status+'</h7>'
						+'<br><button type="button" class="btn alert-warning cardUpdate" id="'+value.id+'" onclick="cardUpdate(this.id)">수정</button>'
						+'<button type="button" class="btn alert-warning cardDelete" id="'+value.id+'" onclick="cardDelete(this.id)">삭제</button>'
						+'</div></div>');
					
					
					});//end each
				}//end success
		})//end ajax
	}//end cardDelete
	
	
	var updateCatCard;
	
	//수정 버튼 누를시 등장하는 모달창
	function cardUpdate(catid){
		
		$('.updateModalbtn').click();
		
		alert("수정시 등장하는 모달창:"+catid);
		
		updateCatCard=catid;
		
		$.ajax({
			
			type:'POST',
			dataType: 'json',
			url: 'cardUpdate.do',
			data: 'id='+updateCatCard,
			success: function(res){
				
				console.log(res);
				console.log(res[0]);
				var filename="/huimyoelag/upload/"+res[0]['image'];	
				console.log(filename)
					
				$('#updatefrm #modifiedCardCat').attr('src',filename);
				$('#updatefrm #modifiedFilepath').val(filename);
				

			}
		})
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="content-body">
		<c:forEach items="${userInfoList}" var="user">
			<div id="quick_menu">
				<div class="card myCard" style="width: 13rem;">
					<img src="/huimyoelag/upload/${user.image}" id="myPyhoto" alt="myProfile" />
					<div class="card-body">
						<h5 class="card-title">${user.nickname}님반갑습니다.</h5>
						<p class="card-text">나옹 ~ ♥</p>
						<a href="#" class="btn alert-warning">프로필 이미지 변경</a>
					</div>
				</div>
			</div>
		</c:forEach>

		<div id="content-body-myPage">

			<div id="buttonGroup">
				<span>
					<button type="button" class="alert alert-primary insert"
						data-toggle="modal" data-target="#insertModal">내 고양이 작성 ~
						!</button>
				</span>
			</div>
			<div id="catCardGroup">
			<form id="frm" action="delete.do">
				<c:forEach items="${myCatList}" var="CatDTO">
					<div class="card catCard" style="width: 18rem;">
						<img src="/huimyoelag/upload/${CatDTO.image}" class="card-img-top catCard" id="${CatDTO.id}" onclick='lookCatCardView(this.id)' alt="...">
						<div class="card-body">
							<h5 class="card-title"
								style="font-family: 'Do Hyeon', sans-serif; font-size: 27px;">${CatDTO.name}
							</h5>
							<h7	style="font-family: 'Cute Font', cursive; font-size:20px; color: #FF3399;">${CatDTO.status}</h7>
							<br>
							<button type="button" class="btn alert-warning cardUpdate" id="${CatDTO.id}" onclick='cardUpdate(this.id)'>수정</button>
							<button type="button" class="btn alert-warning cardDelete" id="${CatDTO.id}" onclick='cardDelete(this.id)'>삭제</button>
						</div>
					</div>
				</c:forEach>
			</form>
			</div>
			<!-- 아무런 이미지 없을경우 실행 -->
			<div id="noImageSpace"></div>
		</div>
		<br>
		<br>
		<br>
	</div>


	<!-- modal 넣기 -->

	<!-- Modal 삽입누를시 모달창 -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">내 고양이 작성 ~ !</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- 저장 버튼 누를시 리로드 되는 내용 -->
				<form id="insertfrm" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<p>
							<img id="cardCat" class="cardCat" width="400" height="250" />
						</p>
						<p>
							<input type="file" name="filename" id="filepath" class="filepath">
						</p>
						<div class="dropdown">
							<label for="catLabel">고양이 종류</label> <select class="form-control"
								id="catLabel" name="catCodeId">
								<option value="1">노르웨이 숲 고양이</option>
								<option value="2">데본 렉스</option>
								<option value="3">라가머핀</option>
								<option value="4">라팜</option>
								<option value="5">렉돌</option>
								<option value="6">러시안 블루</option>
								<option value="7">맹크스 고양이</option>
								<option value="8">메인쿤</option>
								<option value="9">발라네즈 고양이</option>
								<option value="10">버만</option>
								<option value="11">버미즈</option>
								<option value="12">봄베이</option>
								<option value="13">브리티쉬 숏 헤어</option>
								<option value="14">샤트룩스</option>
								<option value="15">샴</option>
								<option value="16">셀커스 렉스</option>
								<option value="17">소말리</option>
								<option value="18">스코티쉬 폴드</option>
								<option value="19">스핑크스</option>
								<option value="20">시베리아</option>
								<option value="21">싱거퓨라</option>
								<option value="22">아메리칸 밥테일</option>
								<option value="23">아메리칸 숏헤어</option>
								<option value="24">아메리칸 와이어 헤어</option>
								<option value="25">아메리칸 컬</option>
								<option value="26">아바시니안</option>
								<option value="27">오리엔탈</option>
								<option value="28">오시캣</option>
								<option value="29">유러피안 버미즈</option>
								<option value="30">이그저틱</option>
								<option value="31">이집션 마우</option>
								<option value="32">재패니즈밥테일</option>
								<option value="33">컬러포인트 쇼트헤어</option>
								<option value="34">코니시 렉스</option>
								<option value="35">코렛</option>
								<option value="36">터키시 반</option>
								<option value="37">터키쉬 앙고라</option>
								<option value="38">통키니즈</option>
								<option value="39">페르시안</option>
								<option value="40">하바나 브라운</option>
								<option value="41">자바니즈</option>
							</select>
						</div>
						<br>
						<div class="form-group row">
							<label for="name" class="col-2 col-form-label">이름</label>
							<div class="col-10">
								<input class="form-control" type="text" name="name" id="name">
							</div>
						</div>
						<div class="form-group row">
							<label for="age" class="col-2 col-form-label">나이</label>
							<div class="col-10">
								<input class="form-control" type="number" value="1" id="age"
									name="age">
							</div>
						</div>
						<div class="form-group row">
							<label for="weight" class="col-2 col-form-label">몸무게(kg)</label>
							<div class="col-10">
								<input class="form-control" type="number" value="1" id="weight"
									name="weight">
							</div>
						</div>
						<div class="form-group row">
							<label for="legLength" class="col-2 col-form-label">종아리
								길이</label>
							<div class="col-10">
								<input class="form-control" type="text" value=""
									name="legLength" id="legLength">
							</div>
						</div>
						<div class="form-group row">
							<label for="circumference" class="col-2 col-form-label">둘레</label>
							<div class="col-10">
								<input class="form-control" type="text" value=""
									name="circumference" id="circumference">
							</div>
						</div>
						<div class="form-group row">
							<label for="rec_calory" class="col-2 col-form-label">권장
								칼로리</label>
							<div class="col-10">
								<input class="form-control" type="text" value=""
									name="recCalory" id="rec_calory">
							</div>
						</div>
						<div class="dropdown">
							<label for="status">상태</label> <select class="form-control"
								id="status" name="body_status">
								<option value="양호">양호</option>
								<option value="중간">중간</option>
								<option value="나쁨">나쁨</option>
							</select>
						</div>
						<br> <label id="sexual">성별</label>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <input
								class="form-check-input" type="radio" name="gender"
								id="inlineRadio1" value="1"> 남
							</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <input
								class="form-check-input" type="radio" name="gender"
								id="inlineRadio2" value="2"> 여
							</label>
						</div>
						<div class="form-group row">
							<label for="birthday" class="col-2 col-form-label">생일</label>
							<div class="col-10">
								<input class="form-control" type="date" value="" name="birthday"
									id="birthday">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary myCatSubmit">저장</button>
						<button type="button" class="btn btn-secondary finish"
							data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 수정시 사용하는 모달창 -->
	<button type="button" class="btn btn-primary updateModalbtn"
		data-toggle="modal" data-target="#updateModal">Launch demo
		modal</button>

	<!-- Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="background-color: white">
				<div class="mod-top">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white">&times;</span>
					</button>
				</div>
				
				<!-- 저장 버튼 누를시 리로드 되는 내용 -->
				<form id="updatefrm" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<p>
							<img id="modifiedCardCat" class="cardCat" width="400" height="250" />
						</p>
						<p>
							<input type="file" name="modifiedFilename" id="modifiedFilepath" class="filepath">
						</p>
						<div class="dropdown">
							<label for="catLabel">고양이 종류</label> <select class="form-control"
								id="catLabel" name="catCodeId">
								<option value="1">노르웨이 숲 고양이</option>
								<option value="2">데본 렉스</option>
								<option value="3">라가머핀</option>
								<option value="4">라팜</option>
								<option value="5">렉돌</option>
								<option value="6">러시안 블루</option>
								<option value="7">맹크스 고양이</option>
								<option value="8">메인쿤</option>
								<option value="9">발라네즈 고양이</option>
								<option value="10">버만</option>
								<option value="11">버미즈</option>
								<option value="12">봄베이</option>
								<option value="13">브리티쉬 숏 헤어</option>
								<option value="14">샤트룩스</option>
								<option value="15">샴</option>
								<option value="16">셀커스 렉스</option>
								<option value="17">소말리</option>
								<option value="18">스코티쉬 폴드</option>
								<option value="19">스핑크스</option>
								<option value="20">시베리아</option>
								<option value="21">싱거퓨라</option>
								<option value="22">아메리칸 밥테일</option>
								<option value="23">아메리칸 숏헤어</option>
								<option value="24">아메리칸 와이어 헤어</option>
								<option value="25">아메리칸 컬</option>
								<option value="26">아바시니안</option>
								<option value="27">오리엔탈</option>
								<option value="28">오시캣</option>
								<option value="29">유러피안 버미즈</option>
								<option value="30">이그저틱</option>
								<option value="31">이집션 마우</option>
								<option value="32">재패니즈밥테일</option>
								<option value="33">컬러포인트 쇼트헤어</option>
								<option value="34">코니시 렉스</option>
								<option value="35">코렛</option>
								<option value="36">터키시 반</option>
								<option value="37">터키쉬 앙고라</option>
								<option value="38">통키니즈</option>
								<option value="39">페르시안</option>
								<option value="40">하바나 브라운</option>
								<option value="41">자바니즈</option>
							</select>
						</div>
						<br>
						<div class="form-group row">
							<label for="modifiedName" class="col-2 col-form-label">이름</label>
							<div class="col-10">
								<input class="form-control" type="text" name="name" id="modifiedName">
							</div>
						</div>
						<div class="form-group row">
							<label for="modifiedAge" class="col-2 col-form-label">나이</label>
							<div class="col-10">
								<input class="form-control" type="number" value="1" id="modifiedAge"
									name="age">
							</div>
						</div>
						<div class="form-group row">
							<label for="modifiedWeight" class="col-2 col-form-label">몸무게(kg)</label>
							<div class="col-10">
								<input class="form-control" type="number" value="1" id="modifiedWeight"
									name="weight">
							</div>
						</div>
						<div class="form-group row">
							<label for="modifiedLegLength" class="col-2 col-form-label">종아리
								길이</label>
							<div class="col-10">
								<input class="form-control" type="text" value=""
									name="legLength" id="modifiedLegLength">
							</div>
						</div>
						<div class="form-group row">
							<label for="modifiedCircumference" class="col-2 col-form-label">둘레</label>
							<div class="col-10">
								<input class="form-control" type="text" value=""
									name="circumference" id="modifiedCircumference">
							</div>
						</div>
						<div class="form-group row">
							<label for="modifiedRec_calory" class="col-2 col-form-label">권장
								칼로리</label>
							<div class="col-10">
								<input class="form-control" type="text" value=""
									name="recCalory" id="modifiedRec_calory">
							</div>
						</div>
						<div class="dropdown">
							<label for="modifiedStatus">상태</label> <select class="form-control"
								id="modifiedStatus" name="status">
								<option value="양호">양호</option>
								<option value="중간">중간</option>
								<option value="나쁨">나쁨</option>
							</select>
						</div>
						<br> <label id="sexual">성별</label>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <input
								class="form-check-input" type="radio" name="gender"
								id="modifiedInlineRadio1" value="1"> 남
							</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <input
								class="form-check-input" type="radio" name="gender"
								id="modifiedInlineRadio2" value="2"> 여
							</label>
						</div>
						<div class="form-group row">
							<label for="modifiedBirthday" class="col-2 col-form-label">생일</label>
							<div class="col-10">
								<input class="form-control" type="date" value="" name="birthday"
									id="modifiedBirthday">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary updateSubmit">저장</button>
						<button type="button" class="btn btn-secondary finish"
							data-dismiss="modal">취소</button>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
	
	


	<!-- 카드눌렀을때 자세한 정보 나오게하는 용도 -->
	<button type="button" class="btn btn-primary lookModalbtn"
		data-toggle="modal" data-target="#lookModal">Launch demo
		modal</button>

	<!-- Modal -->
	<div class="modal fade" id="lookModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="background-color: white">
				<div class="mod-top">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img src="#" id="lookimage" width="400" height="250" />
					<input class="form-control" type="text" readonly="readonly" id="lookname" name="lookname" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly"  id="lookage" name="lookage" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly" id="lookstatus" name="lookstatus" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly" id="lookgender" name="lookgender" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly" id="lookweight" name="lookweight" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly" id="looklegLength" name="looklegLength" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly" id="lookcircumference" name="lookcircumference" style="border:0px solid">
					<input class="form-control" type="text" readonly="readonly" id="lookrecCalory" name="lookrecCalory" style="border:0px solid">
				</div>
			</div>
		</div>
	</div>


</body>
</html>