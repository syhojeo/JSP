function loginCheck(){
	
	if(document.frm.usrid.value.length == 0){
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		
		return false;
	}
	
	if(document.frm.pwd.value == ""){
		alert("패스워드는 반드시 입력해야 합니다.")
		document.frm.pwd.focus();
		
		return false;
	}
	
	return true;
}

function idCheck(){
	
	if(document.frm.userid.value == ""){
		alert("아이디를 입력해 주세요.");
		document.frm.userid.focus();
		
		return;
	}
	
	var url="idChek.do?userid="+document.frm.userid.value;
	window.open(url,"_blank_1","toolbar=no,menubar=no,"+"scrollbars=yes,resizable=no,width=450,height=200");
}

function idok(userid){
	opener.frm.userid.value=document.frm.userid.value;
	opener.frm.reid.value=document.frm.userid.value;
	self.close();
}

function joinCheck(){
	
	if(document.frm.name.value.length == 0){
		alert("이름을 써 주세요.");
		document.frm.name.focus();
		
		return false;
	}
	
	if(document.frm.userid.value.length == 0){
		alert("아이디 써 주세요.");
		document.frm.userid.focus();
		
		return false;
	}
	
	if(document.frm.userid.value.length < 4){
		alert("아이디  4글자 이상이어야 합니다.");
		document.frm.userid.focus();
		
		return false;
	}
	
	if(document.frm.pwd.value == ""){
		alert("암호는 반드시 입력해야합니다.");
		document.frm.pw.focus();
		
		return false;
	}
	
	if(document.frm.pwd.value != document.frm.pwd_check.value){
		alert("암호가 일치하지 않습니다.")
		document.frm.pwd.focus();
		
		return false;
	}
	
	//만약 중복채크 버튼이 눌렸다면 reid 의 길이는 0이 아니다
	if(document.frm.reid.value.length == 0){
		alert("중복 체크를 하지 않았습니다.");
		documet.frm.userid.focus();
		
		return false;
	}
	
	return true;
}









