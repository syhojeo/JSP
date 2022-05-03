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
<c:set var="age" value="30"></c:set>
나이:<c:out value="10"></c:out>
<%-- c:out 으로 변수 출력하는 방법 --%>
나이:<c:out value="${age }"></c:out>

<%-- value 가 아닌 방법으로 변수에 값 넣는법 --%>
<c:set var="age">
	300
</c:set>
<%-- c태그 사이에 값을(1000)을 넣는다고해서 출력이 되지 않는다 --%>
나이:<c:out value="${age }">1000</c:out>

<%-- 변수값이 제거가 되면 c태그 안의값이 출력된다 (1000) --%>
<c:remove var="age"/>
나이:<c:out value="${age }">1000</c:out>

<br><br>
<%-- c:catch를 이용하여 err 메세지 받는법 --%>
<c:catch var="errmsg">
예외 발생 전<br>
	<%=1/0 %>
예외 발생 후<br>
</c:catch>
<c:out value="${errmsg }"></c:out>
</body>
</html>