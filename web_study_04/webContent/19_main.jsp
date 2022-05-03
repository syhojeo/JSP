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
	//문제가 생겨서 세션에 값이 제대로 안들어왔을때
	if (session.getAttribute("loginUser") == null) {
		response.sendRedirect("17_loginFor.html");
	}
	else {
%>
	<%=session.getAttribute("loginUser") %> 님 안녕하세요!<br>
	저희 홈페이지에 방문해 주셔서 감사합니다.<br>
	즐거운 시간 되세요...<br>
	<form action="20_logout.jsp" method="post">
		<input type="submit" value = "로그 아웃">
	</form>
<%
			
	}
%>
</body>
</html>