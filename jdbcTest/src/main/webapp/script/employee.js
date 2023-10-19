function loginCheck() {
	if(document.frm.id.value.length == 0) {
		alert("아이디를 입력해주세요!");
		frm.id.focus();
		return false;
	}
	if(document.frm.pw.value == "") {
		alert("암호는 반드시 입력해야합니다!");
		frm.pw.focus();
		return false;
	}
	return true;
}
function registerCheck() {
	if(confirm("등록하시겠습니까?")) {
		if(document.frm.id.value.length == 0) {
			alert("아이디를 입력해주세요!");
			frm.id.focus();
			return false;
		}
		if(document.frm.pw.value == "") {
			alert("암호는 반드시 입력해야합니다!");
			frm.pw.focus();
			return false;
		}
		if(document.frm.name.value.length == 0) {
			alert("이름을 입력해주세요!");
			frm.name.focus();
			return false;
		}
		return true;
	} else {
		return false;
	}
}