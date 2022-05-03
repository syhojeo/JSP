<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//DB 접속하기 위한 3요소
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "tiger";
	//sql문
	String sql = "select * from item";
	
	//오라클 드라이버 구동
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	//DriverManager 로 연결 요청하기
	conn = DriverManager.getConnection(url, uid, pass);
	System.out.println("연결 성공");
	//stmt생성
	stmt = conn.createStatement();
	//결과 받아올 변수값
	rs = stmt.executeQuery(sql);
%>
<%
	try{
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<td>name</td>");
		out.println("<td>price</td>");
		out.println("<td>description</td>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString("name") + "</td>");
			out.println("<td>" + rs.getString("price") + "</td>");
			out.println("<td>" + rs.getString("description") + "</td>");
			out.println("</tr");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	out.println("</table>");
%>
	
</body>
</html>