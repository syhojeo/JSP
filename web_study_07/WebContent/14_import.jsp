<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="http://localhost:8080/web_study_07/13_forTokens.jsp" var="data"></c:import>
<%-- 다른페이지의 값을 var 에 담아올 수 있다 --%>
${data }
</body>
</html>