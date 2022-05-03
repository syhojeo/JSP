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
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "tiger";
	String sql = "select * from employee";
%>

<%
		//jdbc 시작
			try{
				//1. 오라클 드라이버 가져오기
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//url, uid, pass 넣어서 연결하기
				conn = DriverManager.getConnection(url, uid, pass);
				//질의 생성 등등 sql을 실행할 statement 만들기
				stmt = conn.createStatement();
				//ResultSet을 이용한결과 받기
				rs = stmt.executeQuery(sql);
				//executeUpdate(sql) //insert, update, delete문과 sql문
				
				out.println("<table border = 1>");
				out.println("<tr><td>이름</td><td>주소</td><td>전화번호</td></tr");
				while(rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("address") + "</td>");
					out.println("<td>" + rs.getString("ssn") + "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					//프로그램이 종료되어야 하기 때문에 각 객체의 값이 null 이어야하는데
					//아닐경우 직접 객체의 인스턴스를 close()함수를 통해 소멸시켜준다
					if(rs != null)
						rs.close();
					if(stmt != null)
						stmt.close();
					if(conn != null)
						conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
%>
</body>
</html>