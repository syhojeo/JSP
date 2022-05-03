<%@	page import="java.net.URLEncoder" %>
<%@	page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
<h3>사용자로 로그인 성공</h3>
<!--
	param을 이용해 넘겨주었기 때문에 
	request.getAttribute가 아닌 request.getParameter로 값을 받는다 
-->
<%=URLDecoder.decode(request.getParameter("userName"), "utf-8") %>
<%=request.getParameter("userId") %>
</body>
</html>