<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=(String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=name %>님 안녕하세요.</h1>
	<form action="logout.jsp">
		<input type="submit" value="로그 아웃">&nbsp;&nbsp;
		<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">
	</form>
</body>
</html>