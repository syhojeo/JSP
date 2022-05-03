<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 인코딩 안깨지고 가져오는법 --%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%=request.getParameter("name") %>
</body>
</html>