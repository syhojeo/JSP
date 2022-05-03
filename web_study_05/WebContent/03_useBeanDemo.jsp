<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- MemberBean을 member로 객체 생성 class 값으로 경로 명시 해줬기 때문에 따로 import 해줄 필요 없음-->
	<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"></jsp:useBean>
	1. 자바 빈 객체 생성 후 저장된 정보 출력하기<br><br>
	이름: <%=member.getName() %>
	아이디: <%=member.getUserid() %>
	2. 정보 변경한 후 변경된 정보 출력하기<br><br>
	<hr>
	member.setName("홍길동");
	member.setUserid("hong");
	<%
		member.setName("홍길동");
		member.setUserid("hong");
	%>
</body>
</html>