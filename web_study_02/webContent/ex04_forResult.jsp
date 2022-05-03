<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 함수 사용문단 (out.print) 와 같은 내장객체는 사용 불가능하다 (함수에서는 객체 생성이 안되기 때문 -->
<%!
	public int sum(int a) {
		int result = 0;
	
		for(int i = 1; i <= a; i++) {
			result += i;
		}
		return result;
	}
%>
<h1>계산 결과</h1>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	for(int i = 1; i < num; i++) {
		out.print(i + "+");
	}
	out.print(num + "=" + sum(num));
%>
</body>
</html>