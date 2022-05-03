<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"></jsp:useBean>
	<!-- jsp:getProperty를 이용한 값 가져오기 -->
	1. 자바 빈 객체 생성 후 저장된 정보 출력하기 <br><br>
	<%-- 이름:<%=member.getName()%><br> --%>
	이름:<jsp:getProperty name="member" property="name"></jsp:getProperty>
	<%-- 아이디: <%=member.getUserid()%> --%>
	아이디:<jsp:getProperty name="member" property="userid"></jsp:getProperty>
	<hr>
	2.정보 변경한 후 변경된 정보 출력하기<br><br>
	<%-- <%
		member.setName("홍길동");
		member.setUserid("hong");
	%> --%>
	<!-- jsp:setProperty를 이용한 값 저장하기 -->
	<jsp:setProperty name="member" property="name" value="홍길동"></jsp:setProperty>
	<jsp:setProperty name="member" property="userid" value="hong"></jsp:setProperty>
	
	이름:<%=member.getName() %><br>
	아이디:<%=member.getUserid() %>
</body>
</html>