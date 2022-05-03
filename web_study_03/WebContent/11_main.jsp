<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp:include : 이자리에 jsp 페이지를 포함시켜라 -->
<jsp:include page="09_header.jsp"></jsp:include>
	메인 화면입니다.<br>
	<a href="12_sub.jsp">서브 페이지로 이동</a>
<jsp:include page="10_footer.jsp"></jsp:include>
</body>
</html>