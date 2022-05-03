package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {

	public static Connection getConnection() {
		Connection conn=null;
		
		try {
			Context initContext=new InitialContext();
			Context envContext=(Context)initContext.lookup("java:/comp/env");
			DataSource ds=(DataSource)envContext.lookup("jdbc/Oracle11g");
			conn=ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// select을 수행한 후 리소스 해제를 위한 메서드
	public static void close(Connection conn,Statement pstmt,ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// insert,update,delete
	public static void close(Connection conn,Statement pstmt) {
		try {
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
