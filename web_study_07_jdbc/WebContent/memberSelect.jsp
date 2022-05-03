<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.daotoex.MemberDAO"%>
<%@page import="com.javalec.daotoex.MemberDTO"%>
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
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> dtos = dao.memberSelect();
	
	out.println("<table border='1' style='text-align:center;'");
	out.println("<tr>");
	out.println("<td>name</td>");
	out.println("<td>id</td>");
	out.println("<td>pw</td>");
	out.println("<td>phone1</td>");
	out.println("<td>phone2</td>");
	out.println("<td>phone3</td>");
	out.println("<td>gender</td>");
	out.println("</tr>");
	for (MemberDTO dto : dtos) {
		out.println("<tr>");
		out.println("<td>" + dto.getName() + "</td>");
		out.println("<td>" + dto.getId() + "</td>");
		out.println("<td>" + dto.getPw() + "</td>");
		out.println("<td>" + dto.getPhone1() + "</td>");
		out.println("<td>" + dto.getPhone2() + "</td>");
		out.println("<td>" + dto.getPhone3() + "</td>");
		out.println("<td>" + dto.getGender() + "</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
</body>
</html>