<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>DB연동</h4>
<%-- <%
	Context initContext=new InitialContext();
	Context envContext=(Context)initContext.lookup("java:/comp/env");
	DataSource ds=(DataSource)envContext.lookup("jdbc/Oracle11g");
	Connection conn=ds.getConnection();
	out.println("DBCP 연동 성공");
%> --%>

<%
	Context context=null;
	DataSource dataSource=null;
	Connection connection=null;
	
	try{
		context=new InitialContext();
		dataSource=(DataSource)context.lookup("java:/comp/emv/jdbc/Oracle11g");
		Connection conn=dataSource.getConnection();
	}catch(Exception e){
		e.printStackTrace();
	}
	out.println("DBCP 연동 성공");
%>
</body>
</html>