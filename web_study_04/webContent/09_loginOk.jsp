<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String id, pw;
%>
<%
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	
	//html 에서 입력된 아이디 비밀번호가 같을때 cookie에 id값 넣어주기
	if(id.equals("ezen") && pw.equals("1234")) {
		Cookie cookie = new Cookie("id", id);
		cookie.setMaxAge(60 * 60); // 1시간
		response.addCookie(cookie);
		response.sendRedirect("10_welcome.jsp");
	}
	else {
		response.sendRedirect("08_login.html");
	}
%>
</body>
</html>