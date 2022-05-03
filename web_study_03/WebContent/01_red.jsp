<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
	이 파일은 01_red.jsp입니다.<br>
	브라우저에 배경색이 빨간색으로 나타 날까요?<br>
	노란색으로 나타 날까요?<hr>
	forward액션 태그가 실행되면 이페이즈의 내용은 출력되지 않습니다.
	
	<!-- forward를 통해 dispatcher 없이 페이지 이동-->
	<jsp:forward page="02_yellow.jsp"></jsp:forward>
</body>
</html>