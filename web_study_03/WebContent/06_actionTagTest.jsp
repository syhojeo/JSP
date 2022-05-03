<%@	page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String loginCheck = request.getParameter("loginCheck");
	
	if(loginCheck.equals("user")) {
%>
	<!-- param과 encode작업을 통해 forward 사용시 request 객체에 값을 넣어서 보낼 수 있다
		param을 이용할 경우 기존의 setAttribute를 통한 getAttribute로 값을 받는것이 아닌
		일반 html 에서 넘겨준 값과 같이 getParameger를 통해서 값을 받는다
	 -->
	<jsp:forward page="07_userMain.jsp">
		<jsp:param value='<%=URLEncoder.encode("전고객", "utf-8") %>' name="userName"></jsp:param>
	</jsp:forward>
<%
	}
	else{
%>
	<jsp:forward page="08_managerMain.jsp">
		<jsp:param value='<%=URLEncoder.encode("성관리", "utf-8") %>' name="userName"></jsp:param>
	</jsp:forward>
<%
	}
%>
</body>
</html>