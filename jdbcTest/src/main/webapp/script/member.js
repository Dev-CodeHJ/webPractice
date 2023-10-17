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
function idCheck() {
	if(document.frm.id.value == "") {
		alert('아이디를 입력해 주세요.');
		document.frm.id.focus();
		return;
	}
	var url = "idCheck.do?id=" + document.frm.id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}
function idok() {
	opener.frm.id.value = document.frm.id.value;
	opener.frm.reid.value = document.frm.id.value;
	self.close();
}
function joinCheck() {
	if(document.frm.name.value.length == 0) {
		alert("이름을 작성해주세요.");
		frm.name.focus();
		return false;
	}
	if(document.frm.id.value.length == 0) {
		alert("아이디를 작성해주세요.");
		frm.id.focus();
		return false;
	}
	if(document.frm.id.value.length < 4) {
		alert("아이디는 4글자이상이어야 합니다.");
		frm.id.focus();
		return false;
	}
	if(document.frm.pw.value == "") {
		alert("비밀번호는 반드시 입력해야 합니다.");
		frm.pw.focus();
		return false;
	}
	if(document.frm.pw.value != document.frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.pw_check.focus();
		return false;
	}
	if(document.frm.reid.value.length == 0) {
		alert("중복 체크를 진행해주세요");
		frm.id.focus();
		return false;
	}
	return true;
}