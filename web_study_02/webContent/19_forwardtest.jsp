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
	int age = Integer.parseInt(request.getParameter("age"));
	
	if(age < 19) {
	
%>
<script type = "text/javascript">
	alert("19세 미만은 입장 불가능");
	history.go(-1);
</script>

<%
	}
	else{
		//name 특성 값 "홍길동" 보내기
		request.setAttribute("name", "홍길동");
		//20_forwardresult.jsp 페이지로 보내는 dispatcher 객체 만들기
		RequestDispatcher dispatcher = request.getRequestDispatcher("20_forwardresult.jsp");
		//dispatcher를 이용하여 값 보내기
		dispatcher.forward(request, response);
	}
%>
</body>
</html>