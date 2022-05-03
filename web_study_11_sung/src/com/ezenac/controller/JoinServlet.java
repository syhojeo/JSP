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
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
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
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//회원가입 정보를 받아서 보낸곳
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		//보내진 request객체의 값을 꺼낸다
		String  name=request.getParameter("name");
		String  userid=request.getParameter("userid");
		String  pwd=request.getParameter("pwd");
		String  email=request.getParameter("email");
		String  phone=request.getParameter("phone");
		String  admin=request.getParameter("admin");
		
		System.out.println(name);
		//꺼낸 값을 Member객체에 넣는다
		MemberVO mvo=new MemberVO();
		mvo.setName(name);
		mvo.setUserid(userid);
		mvo.setPwd(pwd);
		mvo.setEmail(email);
		mvo.setPhone(phone);
		mvo.setAdmin(Integer.parseInt(admin));
		//DAO객체를 생성후
		MemberDAO mdao=MemberDAO.getInstance();
		//DAO의 insertMember메소드를 사용하여 query문을 실행한다
		int result=mdao.insertMember(mvo);
		
		HttpSession session=request.getSession();
		//정상적으로 query문이 동작했다면
		if(result == 1) {
			//table에 추가된 멤버의 아이디를 session에 저장한다
			session.setAttribute("userid",mvo.getUserid());
			request.setAttribute("message","회원 가입에 성공했습니다.");
		}else {
			request.setAttribute("message","회원 가입에 실패했습니다.");
		}
		//login페이지로 request객체를 보낸다
		RequestDispatcher dispatcher=request.getRequestDispatcher("member/login.jsp");
		 dispatcher.forward(request, response);
	}

}
