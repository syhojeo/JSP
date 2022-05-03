<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 설정</h3>
	<%
		//쿠키 객체 생성
		//Cookie(name, value)
		Cookie c = new Cookie("id", "pinksung");
		//컴퓨터에 쿠키가 유지되는 시간 1년
		c.setMaxAge(365*24*60*60);
		response.addCookie(c);
		response.addCookie(new Cookie("pwd", "test1234"));
		response.addCookie(new Cookie("age", "20"));
	%>
	
	<a href="02_getCookies.jsp">생성된 쿠키값 출력하기</a>
</body>
</html>