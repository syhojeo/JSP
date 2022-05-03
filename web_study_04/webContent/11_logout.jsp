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
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0 ; i < cookies.length; i++) {
			if(cookies[i].getValue().equals("ezen")) {
				//ezen id에 대해서 쿠키 소멸
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}
	response.sendRedirect("07_cookietest.jsp");
%>
</body>
</html>