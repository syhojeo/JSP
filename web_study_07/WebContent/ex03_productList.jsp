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
	scope="session" : 링크에 의해 이동하는 page모두에 적용
	추가로 page, request, application 이 있다
 --%>
<jsp:useBean id="product" class="com.saeyan.javabeans.Product" scope="session"></jsp:useBean>
	<select>
		<c:forEach items="${product.productList }" var="item">
			<option>${item}</option>
		</c:forEach>
	</select>
</body>
</html>