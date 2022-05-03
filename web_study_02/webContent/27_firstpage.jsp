<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.PrintStream"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	pageContext.setAttribute("name", "page man");
	request.setAttribute("name", "request man");
	session.setAttribute("name", "session man");
	application.setAttribute("name", "application man");
	
	//왜그런지 모르겠지만 java의 System.out.println 함수가 제대로 실행되지 않는다
	//import="java.io.PrintStream를 추가해도 오류가 해결되지 않았다
// 	System.out.println("27_firstpage.jsp");
// 	System.out.println("하나의 페이지 속성:" + pageContext.getAttribute("name"));
// 	System.out.println("하나의 요청 속성:" + request.getAttribute("name"));
// 	System.out.println("하나의 세션 속성:" + session.getAttribute("name"));
// 	System.out.println("하나의 에플리케이션 속성:" + application.getAttribute("name"));
	
	//Dispatcher 의 forward 메소드를 이용해 다른 페이지로 request를 넘겨준다
	request.getRequestDispatcher("28_secondpage.jsp").forward(request, response);
	
%>
</body>
</html>