<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- firstpage 가 종료 되었기 때문에 firstpage에서 설정한 "name" attribute는 존재하지 않는다 (null)-->
	하나의 페이지 속성: <%=pageContext.getAttribute("name")%>
	<!-- firstpage로 부터 dispatcher를 통해 request 객체를 받아서 사용가능하다 -->
	하나의 요청 속성:<%=request.getAttribute("name")%>
	하나의 세션 속성:<%=session.getAttribute("name")%>
	하나의 애플리케이션 속성:<%=application.getAttribute("name")%>
	
	<a href= "29_thirdpage.jsp">thirdpage로 이동하기</a>
</body>
</html>