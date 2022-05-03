<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h2>application 예제</h2>
	<hr>
	username에 설정된 값은:<%=application.getAttribute("username") %>
	<%
		//getAttribute 의 리턴값은 Object 객체이기 때문에 Integer 로 형변환해줘야한다
		Integer count=(Integer)application.getAttribute("count");
		//count는 Integer 객체이기 때문에 intValue()를 통해 int형 값으로 변환해줘야한다
		int cnt = count.intValue() + 1;
		//application 객체는 어플리케이션 객체가 종료할때 까지 계속 살아있기 때문에 
		//새로고침할때 마다 초기화 되지 않고 cnt+1 된값이 출력된다
		application.setAttribute("count", cnt);
	%>
	count : <%=cnt %>
</div>
</body>
</html>