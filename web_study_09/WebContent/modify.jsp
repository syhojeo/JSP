<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	private Connection connection;
	private Statement stmt;
	private ResultSet resultSet;
	private String name, id, pw, phone1, phone2, phone3, gender;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 회원정보 수정이 잘되지 않는다 에러있음--%>
<%
	id = (String) session.getAttribute("id");
	String query = "select * from memberpe where id='"+id+"'";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "tiger");
	stmt = connection.createStatement();
	resultSet = stmt.executeQuery(query);
	
	while(resultSet.next()) {
		//인덱스가 아닌 이름으로 getString 하기
		name = resultSet.getString("name");
		id = resultSet.getString("id");
		pw = resultSet.getString("pw");
		phone1 = resultSet.getString("phone1");
		phone2 = resultSet.getString("phone2");
		phone3 = resultSet.getString("phone3");
		gender = resultSet.getString("gender");
	}
%>

<form action="ModifyOk">
	이름:<input type="text" name="name" size="10" value="<%=name %>">
	아이디:<%=id %>
	비밀번호:<input type="password" name="pw" size="10"><br>
	전화번호:<select name="phone1">
			<option value="010">010</option>	
		</select>
		<input type="text" name="phone2" size="5" value=<%=phone2 %>>-
		<input type="text" name="phone3" size="5" value=<%=phone3 %>><br>
<%
	if (gender.equals("man")) {	
%>
	성별구분:<input type="radio" name="gender" value="man" checked="checked">남&nbsp;
			<input type="radio" name="gender" value="woman">여<br>
<%
	}
	else {
%>
성별구분:<input type="radio" name="gender" value="man" >남&nbsp;
			<input type="radio" name="gender" value="woman" checked="checked">여<br>
<%
	} 
%>

<input type="hidden" name="id" value="<%=id %>">
<input type="submit" value="정보 수정">
<input type="reset" value="취소">
</form>
</body>
</html>