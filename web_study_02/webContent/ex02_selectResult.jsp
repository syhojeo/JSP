<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
입력하신 정보는 다음과 같습니다.<br>
<%
	request.setCharacterEncoding("utf-8");
	String edu = request.getParameter("edu");
	String na = request.getParameter("na");
	String likes[] = request.getParameterValues("like");
	
	out.print("학력:" + edu + "<br>");
	out.print("소속 국가:" + na + "<br>");
	out.print("관심 분야:");
	
	for(String like : likes) {
		out.print(like + " ");
	}
		
%>
</body>
</html>