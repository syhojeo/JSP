package com.saeyan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		//서버가 클라이언트에게 응답해주는 Content type 설정
		response.setContentType("text/html;charset=utf-8");
		//PrintWriter 객체 만들기 (out.println을 사용하기 위한 출력스트림)
		PrintWriter out=response.getWriter();
		//저장 경로 설정
		String savePath="upload";
		//업로드 사이즈 한계 설정
		int uploadFileSizeLimit=5*1024*1024;
		//인코딩 타입 설정
		String encType="utf-8";
		/*
		 	servletContext
		 	1. http 에서 클라이언트의 상태정보를 유지하기 위한 기능
		 	2. 서블릿, 서블릿 컨테이너간 통신기능
		 */
		ServletContext context=getServletContext();
		//위에서 선언한 context를 이용하여 실제 savePath를 만들어준다
		//C:\study\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\web_study_12/upload
		//마지막 업로드 부분의 / 만 \로 바꿔줄것
		String uploadFilePath=context.getRealPath(savePath);
		//이 위치에 업로드한 파일이 저장된다(이클립스 워크스페이스가 아닌 서버내부)
		System.out.println("서버상의 실제 디렉토리:");
		System.out.println(uploadFilePath);
			
		//multipartRequest를 이용한 파일 처리
		try {
			//request 객체, 파일경로, 업로드파일 사이즈 제한, 인코딩타입, 
			//FileRenamePolicy (파일이름이 중복될경우 어떻게 rename을 할것인지)
			MultipartRequest multi=new MultipartRequest(request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					//DefaultFileRenamePolicy()메서드는 파일이름이 중복될경우
					//test1과 같이 파일 이름을 rename하는 기능을한다
					new DefaultFileRenamePolicy());
			//getFilesystemName(parameter name => input 의 name)
			String fileName=multi.getFilesystemName("uploadFile");
			
			if(fileName == null) {
				System.out.print("파일 업로드 되지 않았음");
			}else {
				//MultipartRequest를 사용하면 reqeust 객체를 사용할 수 없으며
				//MultipartRequest를 request 객체 처럼 사용해주면 된다
				out.println("<br>글쓴이:"+multi.getParameter("name"));
				out.println("<br>제 &nbsp;목:"+multi.getParameter("title"));
				out.println("<br>파일명:"+fileName);
			}
		}catch(Exception e) {
			System.out.println("예외 발생:" + e);
		}
		
	}

}
