<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- request 에서 보내준 url로 redirect 하기 -->
	
<%
	response.sendRedirect(request.getParameter("url"));
%>
</body>
</html>
