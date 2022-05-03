<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<%
	List<String> seasonList=new ArrayList<String>();
	seasonList.add("봄");
	seasonList.add("여름");
	seasonList.add("가을");
	seasonList.add("겨울");
	
	request.setAttribute("list", seasonList);
	
	
%>
	<%-- 자바 코드로 select 의 option 만들기 --%>
	<select>
	<%
		ArrayList<String> list = (ArrayList<String>)request.getAttribute("list");
		for (String season : list) {
			
		
	%>
	
		<option value="season"><%=season %></option>
	<%
		}
	%>
	</select>
	
	<%-- jstl 로 select 의 option 만들기 --%>
	<select>
		<c:forEach var="item" items="${list}" >
			<option value="${item }">${item}</option>
		</c:forEach>
	</select>
	
	
</body>
</html>