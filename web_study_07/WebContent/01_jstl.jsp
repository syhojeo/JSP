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
	custom tag, core(jstl의 기본기능) 
	prefix = "c" 이기 때문에 jstl/core 기본관련된 값을 사용한다 
	때문에 태그를 실행할때도 <c:>를 붙여서 사용한다
--%>
<c:out value="Hello World!"></c:out>
</body>
</html>