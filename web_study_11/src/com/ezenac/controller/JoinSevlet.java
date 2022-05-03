package com.ezenac.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ezenac.dao.MemberDAO;
import com.ezenac.dto.MemberVO;

/**
 * Servlet implementation class JoinSevlet
 */
@WebServlet("/join.do")
public class JoinSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		

		RequestDispatcher dispatcher=request.getRequestDispatcher("member/join.jsp");
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		
		//join.jsp 에서 넘어온 request객체의 값을 꺼내온다
		String name=request.getParameter("name");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String admin=request.getParameter("admin");
		
		System.out.println(name);
		
		//꺼내온 값을 Member객체에 모두 담는다
		MemberVO mvo=new MemberVO();
		mvo.setName(name);
		mvo.setUserid(userid);
		mvo.setPwd(pwd);
		mvo.setEmail(email);
		mvo.setPhone(phone);
		mvo.setAdmin(Integer.parseInt(admin));
		
		//DAO 객체를 생성후
		MemberDAO mdao=MemberDAO.getInstance();
		//DAO 객체의 insertMember 메소드를 이용하여 query 문을 실행한다
		int result=mdao.insertMember(mvo);
		
		HttpSession session=request.getSession();
		
		//query문이 성공적으로 실행되었다면 해당 멤버의 아이디를 session에 넣는다
		if(result == 1) {
			session.setAttribute("userid",mvo.getUserid());
			request.setAttribute("message","회원 가입에 성공했습니다.");
		}else {
			request.setAttribute("message","회원 가입에 실패했습니다.");
		}
		
		//dispatcher를 이용하여 member폴더의 login.jsp로 request객체를 보낸다
		RequestDispatcher dispatcher=request.getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request,response);
	}

}











