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
	Cookie[] cookies=request.getCookies();
	for(int i=0; i < cookies.length; i++) {
		String str=cookies[i].getName();
		//cookieName 만 삭제
		if(str.equals("cookieName")) {
			out.println("name:" + cookies[i].getName() + "<br>");
			//cookie의 만료시간을 0으로 만들고 response객체에 넣어주면 해당 cookie 객체는 소멸된다
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
%>

<a href="07_cookietest.jsp">쿠키 확인</a>
</body>
</html>