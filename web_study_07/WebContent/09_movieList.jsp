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

	<ul>
		<c:forEach var="movie" items="${movieList }" varStatus="status">
			<c:choose>
			<%-- status.first => 첫번째 인덱스일 경우 --%>
				<c:when test="${status.first }"> <%-- status.last 존재 --%>
					<li style="font-weight:bold; color: red;">${movie }</li>
				</c:when>
				
				<c:otherwise>
					<li>${movie}</li>	
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
</body>
</html>