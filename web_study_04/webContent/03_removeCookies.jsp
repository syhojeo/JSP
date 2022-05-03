<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//기존에 name으로 id, pwd, age를 가지던 쿠키객체들에 
	//만료기간 0으로 설정한 새로운 객체로 덮어씌움으로써 쿠키를 삭제 시키는방법
	//06_cookiedel -> 다른방법
	Cookie cookie1 = new Cookie("id", "");
 	cookie1.setMaxAge(0); //쿠키 자체가 사라져버림
	response.addCookie(cookie1);
	
	Cookie cookie2 = new Cookie("pwd", "");
 	cookie2.setMaxAge(0);
	response.addCookie(cookie2);
	
	Cookie cookie3 = new Cookie("age", "");
 	cookie3.setMaxAge(0);
	response.addCookie(cookie3);	
%>
	<h3>쿠키가 삭제되었습니다.</h3>
	<a href="02_getCookies.jsp">쿠키 삭제를 확인하려면 클릭하세요</a>
	쿠키 삭제를 확인하려면 클릭하세요
</body>
</html>