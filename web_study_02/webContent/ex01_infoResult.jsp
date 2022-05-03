<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
입력한 정보는 다음과 같습니다.
<%request.setCharacterEncoding("utf-8"); %>
ID:<%=request.getParameter("id") %> <br>
Password: <%=request.getParameter("pw") %><br>
자기소개:<%=request.getParameter("desc") %><br>
</body>
</html>