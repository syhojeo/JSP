<%@ page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션 값 가져오기</h3>
	<%
		String id = (String)session.getAttribute("id");
		String pwd = (String)session.getAttribute("pwd");
		Integer age = (Integer)session.getAttribute("age");
	%>
	
	id:<%=id %><br>
	pwd:<%=pwd %><br>
	age: <%=age %><br>
	
	<%
		out.println("===============================================" + "<br>");
	%>
	
	<%
		Enumeration<String> names = session.getAttributeNames();
		//hasMoreElements() : 해당 객체에 값이 있는지 없는지 확인
		while(names.hasMoreElements()) {
			//nextElement() 를 통해 객체에서 이름을 꺼내온다
			String name = names.nextElement();
			//String value = (String)session.getAttribute(name); // error : 오직 String 객체만 처리할 수 있기 때문
			//String value = session.getAttribute(name).toString();
			Object value = session.getAttribute(name);
			out.println(name + ":" + value + "<br>");
		}
	%>
</body>
</html>