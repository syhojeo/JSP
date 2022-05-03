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
	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
%>
	forwardTo_eun.jsp페이지입니다.<br>
	forwardTo_eun.jsp 페이지 또는 포워드 페이지로<br>
	forwardForm_eun.jsp페이지와 같은 request객체를 공유합니다.<br>
	
	이메일:
	<b><%=id %></b><br>
	이름:
	<b><%=name %></b>
</body>
</html>