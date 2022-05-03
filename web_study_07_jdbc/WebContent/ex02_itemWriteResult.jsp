<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
		PreparedStatement pstmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String uid = "scott";
		String pass = "tiger";
		String sql = "insert into item values(?, ?, ?)";
	%>
	
	<%
		try{
			//드라이버 객체 가져오기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//url, uid, pass 이용하여 데이터베이스 연결
			conn = DriverManager.getConnection(url, uid, pass);
			//데이터베이스에 sql 문을 보낼 객체 만들기
			pstmt = conn.prepareStatement(sql);
			
			request.setCharacterEncoding("utf-8");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String description = request.getParameter("description");
			
			//preparedStatement 객체에 값 넣어주기
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(price));
			pstmt.setString(3, description);
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<h2>레코드가 추가 되었습니다.</h2>
	<a href="ex02_itemWrite.jsp">결과 보기</a>
</body>
</html>