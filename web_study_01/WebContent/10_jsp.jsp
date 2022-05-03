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
	int count = 0;
	out.print("count"); 
	out.print(++count+"<br>"); //1
	out.print("count"+(count++)+"<br>"); // 1
	out.print("count"+count);  //2
%>
</body>
</html>