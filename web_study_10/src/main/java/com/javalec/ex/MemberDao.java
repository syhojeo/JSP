package com.javalec.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private static MemberDao instance = new MemberDao();
	
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	public int insertMember(MemberDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into members values(?, ?, ?, ?, ?, ?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setTimestamp(5, dto.getrDate());
			pstmt.setString(6, dto.getAddress());
			
			pstmt.executeUpdate();
			
			ri = MemberDao.MEMBER_JOIN_SUCESS;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	public int confirmId(String id) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		
		String query="select id from members where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if (set.next()) {
				ri = MemberDao.MEMBER_EXISTENT;
			}
			else {
				ri = MemberDao.MEMBER_NONEXISTENT;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (set != null)
					set.close();
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int userCheck(String id, String pw) {
		int ri = 0;
		String abPw;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		
		String query="select pw from members where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if (set.next()) {
				abPw = set.getString("pw");
				//비밀번호가 같다면
				if (abPw.equals(pw)) {
					ri = MemberDao.MEMBER_LOGIN_SUCESS; //로그인 OK 1
				}
				else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD; //비밀번호 틀림 0
				}
			}
			else {
				ri = MemberDao.MEMBER_NONEXISTENT; //회원 없음 -1
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (set != null)
					set.close();
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ri;
	}
	
	//매개변수로 들어오는 아이디에 대한 정보를 리턴하는 메소드
	public MemberDto getMember(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		MemberDto dto = null;
		
		String query = "select * members where id=?";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if (set.next()) {
				dto = new MemberDto();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.setEmail(set.getString("email"));
				dto.setrDate(set.getTimestamp("rDate"));
				dto.setAddress(set.getString("address"));
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (set != null)
					set.close();
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int updateMember(MemberDto dto) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		int ri = 0;
		
		String query = "update members set pw=?, email=?, address=? where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			
			ri = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	// DB와 연결할 수 있는 여건을 미리 만들어놓는 방식인 connection pool을 사용한다
	// DB의 부하를 줄인다
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
}
