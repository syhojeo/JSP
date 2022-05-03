<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 이방식을 jstl 로 바꿔보기
<%
	request.setCharacterEncoding("utf-8");
%>

<%=request.getParameter("name") %>

--%>
<fmt:requestEncoding value="UTF-8"/>
이름: <c:out value="${param.name }"></c:out>
</body>
</html>