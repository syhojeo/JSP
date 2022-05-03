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
	//response 를 통해 브라우저로 응답이 되지않는 이상 request객체가 살아있기 때문에
	//19_forwardtest 에서 사용한 request 객체를 이 jsp 페이지에서도 사용할 수 있다
	String age = request.getParameter("age");
	//getAttribute는 Object 객체이기 때문에 String으로 강제 형변환이 필요하다
	String name = (String)request.getAttribute("name"); 
%>

forward방식으로 이동된 페이지<br>
나이: <%=age %><br>
이름: <%=name %>
</body>
</html>