$(document).ready(function() {

	$('#resultBtn').on('click', function() {
		
		                //한글영어특수문자 체크
						var engCheck = /[a-z]/;
						var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
						var korcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
						//변수정의 몸통둘레 종아리길이
						var Calflength = $('#Calflength').val();
						var circumference = $('#circumference').val();

						if (circumference == null || circumference == ""|| circumference == "undefined") {
							alert("몸통둘레 입력은 필수입니다.");
							$("#circumference").focus();
							return false;
						} else if (engCheck.test(circumference)) {
							alert("몸통둘레는 숫자만 가능합니다.");
							return false;
						} else if (circumference.search(/\s/) != -1) {
							alert("몸통둘레는 공백은 가능하지 않습니다.");
							return false;
						}else if (specialCheck.test(circumference)) {
							alert("몸통둘레는 숫자만 가능합니다.");
							return false;
						} else if (korcheck.test(circumference)) {
							alert("몸통둘레는 숫자만 가능합니다.");
							return false;
					
 
						}
						if (Calflength == null || Calflength == ""
								|| Calflength == "undefined") {
							alert("종아리길이 입력은 필수입니다.");
							$("#Calflength").focus();
							return false;
						} else if (Calflength.search(/\s/) != -1) {
							alert("종아리길이공백은 가능하지 않습니다.");
							return false;

						} else if (engCheck.test(Calflength)) {
							alert("종아리길이는 숫자만 가능합니다.");
							return false;
						} else if (specialCheck.test(Calflength)) {
							alert("종아리길이는 숫자만 가능합니다.");
							return false;
						} else if (korcheck.test(Calflength)) {
							alert("종아리길이는 숫자만 가능합니다.");
							return false;
						}
						
						
					});

		});