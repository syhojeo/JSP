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
	String[] movieList={"타이타닉", "시네마 천국", "혹성 탈출", "킹콩"};
	pageContext.setAttribute("movieList", movieList);
%>
	<table border="1" style="width:100%; text-align: center;">
		<tr>
			<th>index</th>
			<th>count</th>
			<th>title</th>
		</tr>
		<%-- 
			status를 이용하여  몇번 반복했는지 확인할 수 있다 for문의 i같은 변수
			status.index : i가 몇인지 (1부터 시작했는지 5부터 시작했는지 시작하는곳에 따라 달라짐)
			status.count : 실제	반복문을 몇번 반복했는지
		--%>
		
		<c:forEach var="movie" items="${movieList }" varStatus="status">
			<tr>
				<td>${status.index }</td>
				<td>${status.count}</td>
				<%-- moiveList로 부터 하나씩 꺼내오는 movie 변수 --%>
				<td>${movie }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>