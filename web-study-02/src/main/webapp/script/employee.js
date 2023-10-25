function employeeCheck() {
	if(document.frm.id.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.id.focus();
		return false;
	}
	if(document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.pw.focus();
		return false;
	}
	if(document.frm.name.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.name.focus();
		return false;
	}
	return true;
}

function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}

function pwCheck() {
	if(document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;
}