function loginCheck(){
	
	if(document.frm.userid.value.length == 0){
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
		alert("아이디를 입력해 주세요.")
		document.frm.userid.focus();
		
		return;
	}
	
	var url="idCheck.do?userid="+document.frm.userid.value;
	window.open(url,"_blank_1","toolbar=no,menubar=no,"+"scrollbars=yes,resizable=no,width=450,height=200");
}

function idok(userid){
	//opener 객체는 open시킨 기존 창의 객체를 참조(같다)한다
	//document.frm.userid.value 는 현재 오픈된 document의 frm 값
	//opner.frm.userid.value 는 현재창을 오픈 시킨 document의 frm 값
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
		alert("아이디 4글자 이상이어야 합니다.");
		document.frm.userid.focus();
	
	return false;
	}
	
	if(document.frm.pwd.value == ""){
		alert("암호는 반드시 입력해야 합니다.");
		document.frm.pwd.focus();
	
		return false;
	}
	
	if(document.frm.pwd.value != document.frm.pwd_check.value){
		alert("암호가 일치하지 않습니다.");
		document.frm.pwd.focus();
	
		return false;
	}
	
	if(document.frm.reid.value.length == 0){
		alert("중복 체크를 하지 않았습니다.");
	    document.frm.userid.focus();
	
	    return false;
	}
	
	return true;
}


/*
웹브라우저에서 새창을 열기 위해서 가장 간단히 사용할 수 있는 방법이  자바스크립트 window 객체의 open() 함수를 사용하는 것입니다.

1. 문법(Syntax)
var ret = window.open(url, name, specs, replace);
 
1.1. 반환값(ret)

새로 만들어진 창 객체가 반환됩니다. 창의 생성에 실패하면 null을 반환합니다. 이 객체를 통해서 새창을 제어할 수 있습니다. 예로 ret.close(); 로 창을 닫을 수 있습니다.

1.2. url

새창에 보여질 주소 입니다. 선택적인 값으로 비워두면 빈창(about:blank)이 보입니다.

 

1.3. name

새로 열릴 참의 속성 또는 창의 이름을 지정합니다. 선택적인 값으로 기본값은 "_blank" 입니다. 사용 가능한 값을 다음과 같습니다.

- _blank : 새 창에 열립니다. 이것이 기본값입니다.

- _parent : 부모 프레임에 열립니다.

- _self : 현재 페이지를 대체합니다.

- _top : 로드된 프레임셋을 대체합니다.

- name(임의의 이름) : 새 창이 열리고 창의 이름을 지정합니다. 동일한 이름에 다시 open() 을 하면 기존의 열린창의 내용이 바뀝니다. 다른 이름을 사용하면 또다른 새창이 열립니다.

 

1.4 specs

선택적인 값으로 창의 크기, 스크롤여부, 리사이즈 가능등의 속성을 지정합니다. 사용가능한 값을 다음과 같습니다.

- channelmode=yes|no|1|0 : 전체화면으로 창이 열립니다. IE에서만 동작합니다.

- directories=yes|no|1|0 : (사용되지 않습니다.) 디렉토리 버튼의 표시여부

- fullscreen=yes|no|1|0 : 전체 화면 모드. IE에서만 동작합니다.

- height=pixels : 창의 높이를 지정합니다.(height=600)

- width=pixels : 창의 너비를 지정합니다.(width=500)

- left=pixels : 창의 화면 왼쪽에서의 위치를 지정합니다. 음수는 사용할 수 없습니다.

- top=pixels : 창의 화면 위쪽에서의 위치를 지정합니다. 음수는 사용할 수 없습니다.

- location=yes|no|1|0 : 주소 표시줄 사용여부를 지정합니다. Opera에서만 동작합니다.

- menubar=yes|no|1|0 : 메뉴바 사용여부를 지정합니다.

- resizable=yes|no|1|0 : 창의 리사이즈 가능 여부를 지정합니다. IE에서만 동작합니다.

- scrollbars=yes|no|1|0 : 스크롤바 사용여부를 지정합니다. IE, Firefox, Opera에서 동작합니다.

- status=yes|no|1|0 : 상태바를 보여줄지 지정합니다.

- titlebar=yes|no|1|0 : 타이틀바를 보여줄지 지정합니다. 호출 응용 프로그램이 HTML 응용 프로그램이거나 신뢰할 수있는 대화 상자가 아니면 무시됩니다.

- toolbar=yes|no|1|0 : 툴바를 보여줄지 지정합니다. IE, Firefox에서 동작합니다.

 
IE11에서 테스트 해본결과 channelmode는 타이틀바가 보이고, fullscreen모드는 타이틀바 없이 창이 떳습니다.


1.5 replace

히스토리 목록에 새 항목을 만들지 현재 항목을 대체할지 지정합니다.

- true : 현재 히스토리를 대체합니다.

- false : 히스토리에 새 항목을 만듭니다.

출처: https://offbyone.tistory.com/312 [쉬고 싶은 개발자]
*/











