<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- model2 방식 : jsp + sevelet -->
<%
	int num1 = (Integer)request.getAttribute("num1");
	int num2 = (Integer)request.getAttribute("num2");
%>

	<%=num1%> + <%=num2%> = <%=num1 + num2 %><hr>
</body>
</html>