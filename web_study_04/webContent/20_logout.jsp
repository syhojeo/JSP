<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그아웃 했으므로 session 삭제하기 -->
<%
	session.invalidate();
%>
<script type="text/javascript">
	alert("로그 아웃 되었습니다.");
	//location.href 를 이용해서 원하는 html페이지로 링크될 수 있다
	location.href="17_loginform.html";
</script>
</body>
</html>