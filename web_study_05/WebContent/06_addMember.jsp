<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>입력된 회원 정보</h2>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"></jsp:useBean>
	<!-- property="*"을 사용하면 html에서 입력한 값들이 자동으로 set이 된다-->
	<jsp:setProperty name="member" property="*"></jsp:setProperty>
	
	<table>
		<tr>
			<td>이름</td>
			<% //jsp 명령 끝에 / 를 붙이면 닫는 태그 (</jsp:getProperty를 사용하지 않아도된다%>
			<td><jsp:getProperty property="name" name="member"/></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty property="userid" name="member"/></td>
		</tr>
		<tr>
			<td>별명</td>
			<td><jsp:getProperty property="nickname" name="member"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty property="pwd" name="member"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="member"/></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td><jsp:getProperty property="phone" name="member"/></td>
		</tr>
	</table>
</body>
</html>