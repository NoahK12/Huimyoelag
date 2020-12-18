	$(document).ready(function() {
		
		$('#resultBtn').on('click', function() {
		
			//숫자만 가능하게 허용
			var engCheck = /[a-z]/; 
			var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			var korcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			// 폼에 입력된 각 값에 대한 변수 정의
			var weight = $("#weight").val();
			 if (weight == null || weight == "" || weight=="undefined") { 
		    	alert("몸무게 입력은 필수입니다."); 
		    	$("#weight").focus();
		    	return false;
			 }else if (engCheck.test(weight)) { 
			    	alert("몸무게 입력은 숫자만 가능합니다.");
			    	$("#weight").focus();
				    return false;
				 }else if (specialCheck.test(weight)) { 
				    	alert("몸무게 입력은 숫자만 가능합니다.");
				    	$("#weight").focus();
					    return false;
				 }else if (korcheck.test(weight)) { 
				    	alert("몸무게 입력은 숫자만 가능합니다.");
				    	$("#weight").focus();
					    return false;
				 }
			
		});
	});
	