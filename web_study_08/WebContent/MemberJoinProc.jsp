<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String[] hobby=request.getParameterValues("hobby");
	
	String texthobby="";
	for(int i=0;i<hobby.length;i++){
		texthobby+=hobby[i]+" ";
	}
%>

<%--useBean 액션태그를  사용하여 객체 생성,id="mbean",setProperty 액션 태그를 사용하여 데이터의 값을 설정 --%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"></jsp:setProperty>
	</jsp:useBean>
	
<%
	mbean.setHobby(texthobby);
	MemberDAO mdao=new MemberDAO();
	mdao.insertMember(mbean);
	
	// 회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동
	
	response.sendRedirect("MemberList.jsp");//
%>
	OK MemberJoinProc!!
</body>
</html>













