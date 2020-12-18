//이메일 형식
function emailFormCheck(str) {
	let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return regEmail.test(str);
}

$(document).ready(function(){
	
	$('#sendbtn').on('click',function(){
		
		var email = $("#email").val();
		console.log(email);
		
		if (email == "") {
	        alert("이메일을 입력해주세요.")
	        document.location.reload();
	    }else if (!emailFormCheck(email)) {
	        alert("올바른 이메일 형식이 아닙니다.")
	        document.location.reload();
	    }
		
		
		// 이메일 체크
		    $.ajax({ // 이메일 입력란 중복체크 및 유효성 검사
		        type: "POST",
		        url: "emailCheck.do",
		        dataType: "text", 
		        data: 'email='+email,
		        success: function (res) {
		            if (res == "success") { //해당 이메일이 없다는뜻
		            	$('#frm').attr('action',"MailCheck.do")
				 		$('#frm').attr('method',"post")
				 		$('#frm').submit();
		            } else {
		                alert("중복되는 이메일입니다.")
		                document.location.reload();
		            }
		        }
		    })
	    
	    
	})//end click
});//end ready