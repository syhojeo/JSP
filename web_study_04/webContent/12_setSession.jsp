<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  
		세션을 통해 특정 권한을 주고 사용할 수 있게 해준다 
		주로 로그인등을 성공했을때 권한을 줘서 특정 페이지에 접근할 수 있도록
		해줄때 사용된다 
	-->
	<h3>세션 설정</h3>
	<%
		session.setAttribute("id", "pinksun");
		session.setAttribute("pwd", "test1234");
		session.setAttribute("age", 20);
	%>
</body>
</html>