function movieCheck() {
	if(document.frm.title.value.length == 0) {
		alert("영화제목을 작성해주세요.");
		frm.title.focus();
		return false;
	}
	if(document.frm.price.value.length == 0) {
		alert("가격을 써주세요.");
		frm.price.focus();
		return false;
	}
	if(isNaN(document.frm.price.value)) {
		alert("숫자를 입력해야 합니다.");
		frm.price.focus();
		return false;
	}
	if(document.frm.director.value.length == 0) {
		alert("감독 이름을 작성해주세요.");
		frm.director.focus();
		return false;
	}
	if(document.frm.actor.value.length == 0) {
		alert("배우 이름을 작성해주세요");
		frm.actor.focus();
		return false;
	}
	return true;
}