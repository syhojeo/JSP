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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //action의 method에 아무것도 안적혀있을 경우 오게되는 default method (get방식)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setCharacterEncoding("utf-8");
		//response.setContentType("text/html;charset=utf-8");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//로그인 되어있지 않은경우 로그인페이지로 이동하게끔 하는 default값
		String url="member/login.jsp";
		HttpSession session=request.getSession();
		
		//로그인되어 있는 경우 (로그인할때 session.setAttribute("loginUser", mvo)를 하기때문에)
		if(session.getAttribute("loginUser") != null) {
			//main 페이지로(로그인 전용페이지)
			url="main.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String url="member/login.jsp";
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		
		MemberDAO mdao=MemberDAO.getInstance();
		int result=mdao.userCheck(userid, pwd);
		
		if(result == 1) {
			MemberVO mvo=mdao.getMember(userid);
			
			HttpSession session=request.getSession();
			session.setAttribute("loginUser", mvo);
			//다시 로그인페이지로 돌아갔을때 뜨게 하는 메시지
			request.setAttribute("message","회원 가입에 성공했습니다.");
			url="main.jsp";
		}else if(result == 0) {
			request.setAttribute("message","비밀 번호가 맞지 않습니다.");
		}else if(result == -1) {
			request.setAttribute("message","존재하지 않는 회원입니다.");
		}
		
		 RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		 dispatcher.forward(request, response);
	}

}








