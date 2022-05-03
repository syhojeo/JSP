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
<%--  var = 변수, value = 변수값 --%>
<c:set var="msg" value="Hello"></c:set>
\${msg} = ${msg } 

<%--  value 를 이용하지 않고 값 넣기 --%>
<c:set var="age">30</c:set>
\${age } = ${age }<br><br>

<c:set var="member" value="<%=new com.saeyan.javabeans.MemberBean() %>"></c:set>
<c:set target="${member }" property="name" value="홍길동"></c:set>
<c:set target="${member }" property="userid" value="hong"></c:set>

\${member } = ${member }<br><br>

\${member} = ${member.name }<br>
\${member } = ${member.userid }<br>

<c:set var="add" value="${10+5 }"></c:set>
\${add } = ${add }<br>

<c:set var="flag" value="${10 > 5 }"></c:set>
\${flag}=${flag } <br>
</body>
</html>