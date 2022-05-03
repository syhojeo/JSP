<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%!
	Connection conn = null;
	//바인딩 변수를 사용하기위해 PreparedStatement를 사용해아한다
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "system";
	String pass = "oracle";
	//insert into member values('이소미', 'somi', '1234', 'gmd@naver.com', '010-2362-5157', 0);
	String sql ="insert into member values(?,?,?,?,?,?)"; //여러값을 넣는 바인딩 변수
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String admin = request.getParameter("admin");
		try {
			//1. 오라클 드라이버 가져오기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//url, uid, pass 넣어서 db와 연결하기
			conn = DriverManager.getConnection(url, uid, pass);
			
			//PreparedStatement 객체 사용법
			//1. conn 객체를 이용하여 prepareStatement 객체 만들기
			pstmt = conn.prepareStatement(sql);
			//2. setString을 이용하여 각 변수의 번호대로 값을 넣기
			pstmt.setString(1, name);
			pstmt.setString(2, userid);
			pstmt.setString(3, pwd);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setInt(6, Integer.parseInt(admin));
			pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>