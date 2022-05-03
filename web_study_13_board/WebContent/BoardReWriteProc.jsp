<%@page import="model.BoardDAO"%>
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
%>
<!-- 
		데이터를 한번에 받아오는 빈클래스 사용 
		부모값 저장 (게시날짜, 조회수는 들어있지 않음)
-->
<jsp:useBean id="boardBean" class="model.BoardBean">
	<jsp:setProperty  name="boardBean" property="*"></jsp:setProperty>
</jsp:useBean>

<%
	BoardDAO bdao=new BoardDAO();
	bdao.reWriteBoard(boardBean);
	
	// 게시글 저장 후 전체 게시글 보기
	response.sendRedirect("BoardList.jsp");
%>
</body>
</html>