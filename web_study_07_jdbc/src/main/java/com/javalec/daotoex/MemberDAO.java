package com.javalec.daotoex;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
// Data Access Object
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "tiger";
	
	public MemberDAO() {
		try {
			//생성자에서 드라이버 가져오기
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> memberSelect(){
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//DriverManager 로 연결 요청하기
			conn = DriverManager.getConnection(url, uid, pass);
			//stmt생성
			stmt = conn.createStatement();
			//결과 받아올 변수값
			rs = stmt.executeQuery("select * from m_member");
			
			//DTO 에 저장
			while(rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				//MemberDTO 객체 만들기
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
				//ArrayList에 추가하기
				dtos.add(dto);
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
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
}
