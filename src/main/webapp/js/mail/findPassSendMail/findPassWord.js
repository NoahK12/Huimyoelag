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
	        return
	    }else if (!emailFormCheck(email)) {
	        alert("올바른 이메일 형식이 아닙니다.")
	        return
	    }
		
		
		// 이메일 중복검사 필요=>없는 이메일이면 안되기때문
		    $.ajax({ 
		        type: "POST",
		        url: "checkMailPass.do",
		        dataType: "text", 
		        data: 'email='+email,
		        success: function (res) {
		            if (res == "success") { //해당 이메일이 없다는뜻
		            	$('#frm').attr('action',"updateKey.do")
				 		$('#frm').attr('method',"post")
				 		$('#frm').submit();
		            } else {
		                alert("등록되지않은 이메일입니다.")
		                return;
		            }
		        }
		    })
	    
	    
	})//end click
});//end ready