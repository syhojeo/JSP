<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//사용하는 오라클 지정
	String url="jdbc:oracle:thin:@localhost:1521:XE";//1521: port , XE: SID
	String uid="system";
	String pass="oracle";
	String sql="select * from member";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 테이블 출력</title>
</head>
<body>
	<table width="800" border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>암호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한(0:관리자, 1:일반회원)</th>
		</tr>
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
				
				while(rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("userid") + "</td>");
					out.println("<td>" + rs.getString("pwd") + "</td>");
					out.println("<td>" + rs.getString("email") + "</td>");
					out.println("<td>" + rs.getString("phone") + "</td>");
					out.println("<td>" + rs.getInt("admin") + "</td>");
					out.println("</tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
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
	</table>
</body>
</html>