//비밀번호 입력 형식 (영어와 숫자의 혼합, 6~12자리 이내의 암호)
function passwordFormCheck(str) {
 let reg_password = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
 return reg_password.test(str);
}
function checkNickName() { 

for(var i=0; i<nickname.length; i++){

	  nick = nickname.charAt(i);
	  if(escape(nick).length >4){ 
		  nickLength += 2; 
		  }else{ nickLength += 1; { 
			  nickLength += 1;
		  }

	  }

}
}

$(document).ready(function(){
	
	// 회원가입
	$('#updatebtn').on('click',function(){
		var nickLength = 0; 
		var engCheck = /[a-z]/; 
		var numCheck = /[0-9]/; 
		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

		// 폼에 입력된 각 값에 대한 변수 정의
		    var nickname = $("#Inputnickname").val();
		    var email = $("#InputEmail1").val();
		    var password = $("#newpassword2").val();
		    var passwordCheck=$("#newpassword3").val();
		 // 빈칸 및 형식 체크 알람
		    if (nickname == null || nickname == "") { 
		    	alert("닉네임 입력은 필수입니다."); 
		    	return
		    }else if (nickname.search(/\s/) != -1) { 
		    	alert("닉네임은 빈 칸을 포함 할 수 없습니다.");
		    	return
		    }else if (nickname.length<2 || nickname.length>20){
		    	alert("닉네임은 한글 1~10자, 영문 및 숫자 2~20자 입니다.");
		    	return
		    }else if (specialCheck.test(nickname)) { 
		    	alert("닉네임은 특수문자를 포함 할 수 없습니다.");
		    	return 


		    } if(password!="undefined" && password !=null && password !=""){
		    	  if(!passwordFormCheck(password)) {
		              alert("문자와 숫자가 포함된 6~12자리로 작성해주세요.")
		              $("#newpassword2").focus();
		              return false

	          }	else if (password != passwordCheck) { // 비밀번호 재입력이 비밀번호와 같은지
	              alert("비밀번호가 서로 일치하지 않습니다.")
	              $("#newpassword3").focus()
	              return
	          } 
		    }
	
			$.ajax({
				
				type: 'POST',
				url: 'profilemodify.do',
				dataType: 'text',
				data:'nickname='+$('#Inputnickname').val()+'&email='+$('#InputEmail1').val()+'&password='+$('#newpassword2').val(),
				success : function(res){
					console.log(res);
						 if (res== "success") {
							location.href="profileview.do"; 
						}else{
							alert("중복된닉네임입니다.")
							return
						}
							
						 		
							 
				}
			})
		})// end registComplit

});// end document
