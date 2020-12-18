$(document).ready(function(){
	
	
	//로그인
	$('#login').on('click',function(){
		var returnUrl = $('#returnUrl').val()
		$.ajax({
			type: 'POST',
			url: 'loginIdentify.do',
			dataType: 'text',
			data: '&email='+$('#email').val()+'&password='+$('#password').val(),
			success : function(res){
				//이름 넘어옴
				console.log(res);
					 if (res == "success") {
						alert('로그인 되었습니다.');
						if (returnUrl==""){ //없으면 홈으로 //홈에서-> 로그인 버튼이므로
							location.href="/huimyoelag/main/home.do";
						}else{
							location.href="/huimyoelag"+returnUrl;
						}
					}else{
						alert('로그인에 실패했습니다.');
						return
					}
			}
		})
	})//end registComplit
	
	
	//취소 버튼 누를시 첫 페이지로 이동하기
	$('#cancel').on('click',function(){
		location.href="mainHome.do";
	})

	
})