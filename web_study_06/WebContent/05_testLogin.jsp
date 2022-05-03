<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
당신이 입력한 정보입니다.(request 방식) <br>
아이디:<%=request.getParameter("id") %>
비밀 번호:<%=request.getParameter("pwd") %> <br><br>

당신이 입력한 정보입니다.(EL방식)
<!-- experience Language의 param을 통해 값을 가져올 수 있다 -->
아이디:${param.id }<br>
비밀 번호:${param.pwd }<br>
</body>
</html>