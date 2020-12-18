
$(document).ready(function(){
	
	$('#emailCheckingBtn').on('click',function(){
		var email=$('#email').val();
		var emailSecretKey=$('#emailSecretKey').val();
		
		$.ajax({
			
			type: 'POST',
			url:'emailChecking.do',
			data: '&email='+$('#email').val()+'&emailSecretKey='+$('#emailSecretKey').val(),
			dataType :'text',
			success: function(res){
				if(res=="false"){
					alert("인증번호가 일치하지 않습니다.")
					location.href="findpw.do";
				}else{
					alert("인증번호가 일치하였습니다.")
					//ajax이기 때문에 이메일과 인증키를 사용할수있음
					
					$('#wrap').empty();
					$('#wrap').append(
					'<h3 class="textE">고객님 이메일입니다.</h3>'+
					'<h4 class="textE">'+email+'</h4>'
					)
				}
			}//end success
		})//end ajax
		
	})//end emailCheckingBtn
})