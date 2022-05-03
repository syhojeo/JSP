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
	request.setAttribute("id", "kingdora@kings.com");
	request.setAttribute("name", "김계동");
%>

	forwardForm_eun.jsp입니다.<br>
	화면에 절대로 표시되지 않습니다.
	
	<jsp:forward page="04_forwardTo_eun.jsp"></jsp:forward>
</body>
</html>