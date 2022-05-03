//ORA-00957: duplicate column name코드 에러있음

package kr.co.ezenac;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyOk
 */
@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	private String name, id, pw, phone1, phone2, phone3, gender;
	HttpSession session;
    
	/**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		actionDo(request, response);
	}
	
	//update동작을 하는 actionDO 메소드
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		session = request.getSession();
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");	
		
		//비밀번호를 제대로 입력했는지 확인 (보안성 강화를 위해)
		if (pwConfirm()) {
			System.out.println("Ok");
			String query="update memberpe set name='"+name+"', phone1='"+phone1+"', phone2='"+phone2+"', phone3='"+phone3+"', gender='"+gender+"' where id='"+id+"'";
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "tiger");
				stmt=connection.createStatement();
				//업데이트에 성공했다면 1을 리턴받는다
				int i = stmt.executeUpdate(query);
		
				if (i == 1) {
					System.out.println("update sucess");
					//이름이 변경 되었을 수 있으니 session의 name값 저장
					session.setAttribute("name", name);
					//성공했으니 modifyResult 화면으로
					response.sendRedirect("modifyResult.jsp");
				}
				else {
					System.out.println("update fail");
					//실패했으니 수정하는 modify 화면으로
					response.sendRedirect("modify.jsp");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if (stmt != null)
						stmt.close();
					if (connection != null)
						connection.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		else {
			System.out.println("NG");
		}
	}
	
	//비밀번호를 제대로 입력했는지 확인 (보안성 강화를 위해)
	private boolean pwConfirm() {
		boolean rs;
		String sessionPw= (String)session.getAttribute("pw");
		
		if (sessionPw.equals(pw)) {
			rs = true;
		}
		else
			rs = false;
		
		return rs;
	}
	
}
