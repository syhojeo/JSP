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
	<%--
		forTokens: 문자열을 분리자(delims)를 사용해서 분리해서 출력할 수 있다
		delims의 값을 기준으로 분리해준다 
	--%>
	<c:forTokens var="city" items="서울.인천, 대구.부산" delims=",">
		${city }<br>
	</c:forTokens>
	<c:forTokens var="city" items="서울.인천, 대구.부산" delims=",.">
		${city }<br>
	</c:forTokens>
</body>
</html>