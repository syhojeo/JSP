<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 표현언어 $ -->
<%="Hello" %><br> <%-- expression --%>
<% out.println("Hello");%><br> <%--scriptlet --%>
${"Hello" } <%-- Expression Language --%>
</body>
</html>