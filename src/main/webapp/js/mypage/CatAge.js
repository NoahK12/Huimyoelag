
$(document).ready(function() {

	$('#resultBtn').click(function() {
		var numCheck = /[^0-9]/; 
		var birthYear = $('#birthYear').val();
		if (birthYear == null || birthYear == "" || birthYear=="undefined") { 
	    	alert("태어난년도 입력은 필수입니다."); 
	    	$("#birthYear").focus();
	    	return false
		 }else if (numCheck.test(birthYear)) { 
		    	alert("태어난년도는 숫자만 가능합니다.");
		    	$("#birthYear").focus();
			    return false; 
			 }else if (birthYear.length<3 || birthYear.length>4){
			    	alert("태어난년도는 숫자 4자리로 입력해주세요.");
			    	$("#birthYear").focus();
			    	return false;
			 }
	});

}); 