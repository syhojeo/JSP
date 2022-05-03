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

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	private String name, id, pw, phone1, phone2, phone3, gender;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet");
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
	
	//회원 가입 하는 actinoDo 메소드
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		String query="insert into memberpe values('"+name+"', '"+id+"', '"+pw+"', '"+phone1+"', '"+phone2+"', '"+phone3+"', '"+gender+"')";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "tiger");
			stmt=connection.createStatement();
			//업데이트에 성공했다면 1을 리턴받는다
			int i = stmt.executeUpdate(query);
	
			if (i == 1) {
				System.out.println("insert sucess");
				//성공하면 회원가입 결과화면으로
				response.sendRedirect("joinResult.jsp");
			}
			else {
				System.out.println("insert fail");
				//실패시 다시 회원가입 화면으로
				response.sendRedirect("join.html");
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
}
