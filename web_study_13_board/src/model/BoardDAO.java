package model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	/*
	 3가지 변수에 대해서 사용후 close를 해줘야 하는 이유
	 1. Statement를 닫지 않을 경우, 생성된 Statement의 개수가 증가하여 더 이상 Statement를 생성할 수 없게 된다.
	 2. close() 하지 않으므로 불필요한 자원(네트워크 및 메모리)을 낭비하게 된다.
	 3. 커넥션 풀을 사용하지 않는 상황에서 Connection을 닫지 않으면 결국엔 DBMS에 연결된 새로운 Connection을 생성할 수 없게 된다.
	 */
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		
		try {
			Context initctx=new InitialContext();
			DataSource ds=(DataSource)initctx.lookup("java:/comp/env/jdbc/Oracle11g");
			//Context envctx=(Context)initctx.lookup("java:comp/env");
			//DataSource ds=(DataSource)envctx.lookup("jdbc/Orcale11g");
			conn=ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				//rs.close();
				//pstmt.close();
				//conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 하나의 새로운 게시글이 넘어와서 DB에 저장되는 메서드
	public void insertBoard(BoardBean bean) {
		getCon();
		
		int ref = 0;
		//댓글이 아닌 글이기 때문에 re_step과 re_level은 고정이다
		int re_step = 1;
		int re_level = 1;
		
		try {
			//max(ref) : ref 값중에 가장 큰값(가장 최신글)을 가져온다
			String refsql = "select max(ref) from board";
			pstmt = conn.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				//한가지 값만 가져오기 때문에 index 1값만 가져오면 된다
				ref = rs.getInt(1) + 1; // + 1 로 가장 최신글+1 의 ref를 만들어준다
			}
			//매개변수로 가져온 bean값을 pstmt에 넣고 sql로 insert하기
			//sysdate:현재시간 날짜
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			//sql 실행
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 모든 게시글을 리턴해 주는 메서드
	public Vector<BoardBean> getAllBoard(int start,int end){
		Vector<BoardBean> vec = new Vector<>();
		getCon();
		
		try {
			//
			String sql = "select * from(select A.*, Rownum Rnum from(select * from board order by ref desc, re_level asc)A)"+"where Rnum >= ? and Rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				vec.add(bean);
			}
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vec;
	}
	
	// BoardInfo 일 때:하나의 게시글을 리턴하는 메서드
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		
		try {
			//조회수 증가 쿼리 (글을 리턴한다는것을 글을 읽는 다는뜻이기 때문에 조회수를 증가시켜줘야한다
			//update를 통해 기존 DB의 readcount를 증가시켜준다
			String readsqpl = "update board set readcount = readcount + 1 where num=?";
			pstmt = conn.prepareStatement(readsqpl);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			// 하나의 게시글 정보(BoardBean)을 DB에서 가져와 클래스에 저장
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	// 답변글이 저장되는 메서드
	public void reWriteBoard(BoardBean bean) {
		//부모의 ref, ref_step, re_level 값
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getCon();
		
		try {
			//해당 조건이 만족하면 레벨증가
			String levelsql="update board set re_level=re_level+1 where ref=? and re_level > ?";
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			//답글이 달리면 무조건 부모의 re_step값 + 1
			pstmt.setInt(6, re_step+1);
			//답글이 달리면 무조건 부모의 re_level값 + 1
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Boardupdate용 하나의 게시글을 리턴
	// Boardupdate용 delete시 하나의 게시글을 리턴
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		
		try {
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	// update와 delete시 필요한 패스워드 값을 리턴해 주는 메서드
	public String getPass(int num) {
		String pass="";
		getCon();
		
		try {
			// 쿼리 준비
			String sql="select password from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return pass;
	}
	
	// 하나의 게시글을 수정하는 메서드 (제목과 글 내용을 수정)
	public void updateBoard(BoardBean bean) {
		getCon();
		
		try {
			String sql = "update board set subject=?, content=? where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  bean.getSubject());
			pstmt.setString(2,  bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 하나의 게시글을 삭제하는 메서드 (게시글을 삭제하면 댓글들은?)
	public void deleteBoard(int num) {
		getCon();
		
		try {
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 전체글의 개수를 리턴하는 메서드
	public int getAllCount() {
		getCon();
		int count = 0;
		
		//count() 함수를 이용하여 board 테이블의 멤버 개수를 센다
		String sql = "select count(*) from board";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}

			rs.close();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
}














