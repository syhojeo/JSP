<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- response : 서버가 클라이언트한테 전달-->
<%
	//redirect를 서버가 클라이언트에게 리다이렉트를 요청하여 브라우저가 밑의 주소로 접속하도록 해준다
	response.sendRedirect("http://www.ezenac.co.kr");
%>
</body>
</html>