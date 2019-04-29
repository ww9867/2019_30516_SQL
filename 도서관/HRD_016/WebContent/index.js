/**
 * 
 */
document.getElementById("frm").onsubmit = function() {
	if(!document.getElementById("code").value){
		alert("도서코드를 입력하시오.");
		document.getElementById("code").focus();
		return false;
	}else if(!document.getElementById("mumber").value){
		alert("고객번호를 선택해주세요");
		document.getElementById("mumber").focus();
		return false;
	}else{
		alert("등록하셨습니다.");
	}
	
}




