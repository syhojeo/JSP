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
	
	for(int i = 0; i < cookies.length; i++) {
		String str = cookies[i].getName();
		
		//구간을 나눠준다
		if(str.equals("cookieName")){
			out.println("cookie[" + i + "]name:" + cookies[i].getName() + "<br>");
			out.println("cookie[" + i + "]value:" + cookies[i].getValue() + "<br>");
			out.println("==========================<br>");
		}
		//출력되는것을 보면 알 수 있듯이 response객체에 add를 한 순서대로 인덱스에 저장되어 출력되는것은 아니다
		else{
			out.println("cookie[" + i + "]name:" + cookies[i].getName() + "<br>");
			out.println("cookie[" + i + "]value:" + cookies[i].getValue() + "<br>");
		} 
	}
%>

<a href="06_cookiedel.jsp">cookie delete</a>
</body>
</html>