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
	String id = "pinksung";
	String pwd = "1234";
	String name = "이순신";
	
	if(request.getParameter("id").equals(id) 
			&& request.getParameter("pwd").equals(pwd)) {
		session.setAttribute("loginUser", name);
		response.sendRedirect("19_main.jsp");
	}
	else {
		response.sendRedirect("17_loginform.html");
	}
%>
</body>
</html>