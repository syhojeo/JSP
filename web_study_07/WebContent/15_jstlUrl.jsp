<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- c:url 를 이용하여 jpg 이미지 파일을 변수로 받아 올 수 있다 --%>
<c:url value="images/pic.jpg" var="data"></c:url>
<%-- image 이름 출력 --%>
<h3>${data }</h3>

<%-- html img 태그를 이용하여 img 출력하기 --%>
<img src="${data }" width="150" height="150">
<h3>${data }</h3>

<img src="${data }" width="250" height="250">
<h3>${data }</h3>
</body>
</html>