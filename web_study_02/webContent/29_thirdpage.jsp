<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- firstpage 에서 설정한 page 속성 존재하지 않음 -->
	하나의 페이지 속성: <%=pageContext.getAttribute("name")%>
	<!-- link를 통해 넘어왔고, link는 새로운 요청과 같기 때문에 새로운 request 객체가 생성되고 사용한다-->
	<!-- 때문에 null 이 출력된다 -->
	하나의 요청 속성:<%=request.getAttribute("name")%>
	<!-- seesion, application 객체만 사용가능 -->
	하나의 세션 속성:<%=session.getAttribute("name")%>
	하나의 애플리케이션 속성:<%=application.getAttribute("name")%>
</body>
</html>