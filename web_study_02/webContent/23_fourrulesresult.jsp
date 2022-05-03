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
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	
	Integer sum = (Integer)request.getAttribute("sum");
	Integer difference = (Integer)request.getAttribute("difference");
	Integer product = (Integer)request.getAttribute("product");
	Integer quotient = (Integer) request.getAttribute("quotient");
%>

입력된수:<%=num1%>, <%=num2 %> <br>
덧셈의 결과는?<%=sum %> <br>
뺄셈의 결과는?<%=difference %> <br>
곱셈의 결과는?<%=product %> <br>
나눗셈의 결과는?<%=quotient %> <br>

</body>
</html>