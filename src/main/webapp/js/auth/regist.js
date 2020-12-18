//이메일 형식
	function emailFormCheck(str) {
    	let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	return regEmail.test(str);
	}

//비밀번호 입력 형식 (영어와 숫자의 혼합, 6~12자리 이내의 암호)
function passwordFormCheck(str) {
    let regPassword = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
    return regPassword.test(str);
}




$(document).ready(function(){
	
	
	//이메일 인증 팝업창 띄우기
	$("#sendMail").on('click',function(){
		window.open("sendMail.do","인증받기","width=470,height=500")
	})
	
	
	// 회원가입 - 닉네임
	$("#nickname").keyup(function (e) {
	    var nickname = $("#nickname").val();

	    $.ajax({ // 이메일 입력란 중복체크 및 유효성 검사
	        type: "POST",
	        url: "nicknameCheck.do",
	        dataType: "text", 
	        data: 'nickname='+nickname,
	        success: function (res) {
	        	if (res == "noneFail"){
	        		$("#nicknameHelp").text("닉네임을 입력해주세요.").removeClass("text-muted text-success").addClass("text-danger")
	        	}else{
	        		if (res == "success") {
		                $("#nicknameHelp").text("사용 가능한 닉네임입니다.").removeClass("text-muted text-danger").addClass("text-success")
		            } else{
		                $("#nicknameHelp").text("중복된 닉네임 입니다.").removeClass("text-muted text-success").addClass("text-danger")
		            }
	        	}
	        }
	    })
	});
	
	
	
	// 회원가입 - 패스워드
	$("#password").keyup(function (e) {
	    var password = $("#password").val();
	    if (!passwordFormCheck(password)) {
	        $("#passwordHelp").text("문자와 숫자가 포함된 6~12자리로 작성해주세요.").removeClass("text-muted text-success").addClass("text-danger")
	    } else if (passwordFormCheck(password)) {
	        $("#passwordHelp").text("사용 가능한 패스워드입니다.").removeClass("text-muted text-danger").addClass("text-success")
	    }
	});
	
	
	// 회원가입 - 패스워드
	$("#resister_password_check").keyup(function (e) {
	    var passwordCheck = $("#resister_password_check").val();
	    var password = $("#password").val();
	    
	    if (passwordCheck != password) {
	    	$("#password_checkHelp").text("비밀번호가 서로 일치하지 않습니다.").removeClass("text-muted text-success").addClass("text-danger")
	    } else if (password == "") {
	        $("#password_checkHelp").text("비밀번호를 먼저 입력해 주세요.").removeClass("text-muted text-success").addClass("text-danger")
	    } else {
	        $("#password_checkHelp").text("일치한 비밀번호입니다.").removeClass("text-muted text-danger").addClass("text-success")
	    }
	});
	
	
	
	
	//회원가입
	$('.registComplit').on('click',function(){

		// 폼에 입력된 각 값에 대한 변수 정의
		    var nickname = $("#nickname").val();
		    var email = $("#email").val();
		    var password = $("#password").val();
		    var passwordCheck = $("#resister_password_check").val();
		    
		 // 빈칸 및 형식 체크 알람
		    if (nickname == "") {
		        alert("닉네임을 입력해주세요")
		        $("#nickname").focus() //focus는 초점 맞춰주는 기능
		        return
		    } else if (email == "") {
		        alert("이메일을 입력해주세요.")
		        $("#email").focus()
		        return
		    } else if (!emailFormCheck(email)) {
		        alert("올바른 이메일 형식이 아닙니다.")
		        return
		    } else if (password == "") {
		        alert("비밀번호를 입력해주세요")
		        $("#password").focus()
		        return
		    } else if (!passwordFormCheck(password)) {
		        alert("문자와 숫자가 포함된 6~12자리로 작성해주세요.")
		        return
		    } else if (passwordCheck == "") {
		        alert("비밀번호를 입력해주세요")
		        $("#resister_password_check").focus()
		        return
		    } else if (password != passwordCheck) { // 비밀번호 재입력이 비밀번호와 같은지
		        alert("비밀번호가 서로 일치하지 않습니다.")
		        $("#resister_password_check").focus()
		        return
		    } 
				
			
			//회원가입 (update기능/ key값이 없으면 인증해주세요라고 뜨게하기)
				$.ajax({
					
					type: 'POST',
					url: 'checkRegist.do',
					dataType: 'text',
					data: 'nickname='+$('#nickname').val()+'&email='+$('#email').val()+'&password='+$('#password').val()+'&emailSecretKey='+$('#emailSecretKey').val(),
					success : function(res){
						//이름 넘어옴
						console.log(res);
							 if (res== "success") {
								alert('회원가입이 완료되었습니다.');
								location.href="login.do";
							}else{
								alert('회원가입 실패했습니다.');
								return
							}
					}
				})
			})//end registComplit
				
				
				
			//취소 버튼 누를시 첫 페이지로 이동하기
			$('.registCancel').on('click',function(){
				location.href="mainHome.do";
			})
		
		
		
		
})//end document