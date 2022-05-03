<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
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

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	MemberDao dao = MemberDao.getInstance();
	//유저 맞는지 채크
	int num = dao.userCheck(id, pw);
	
	if (num == -1) {
%>
	<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<%
	}else if (num == 0) {
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>		
<%
	//정상적인 회원가입 후 정보 읽어오기
	} else if (num == 1) {	
		MemberDto dto = dao.getMember(id);	
		
		if (dto == null) {
			
%>
	<script type="text/javascript">
		alert("존재하지 않는 회원입니다.");
		history.go(-1);
	</script>
<%
		}else {
			//세션에 값을 저장하여 나중에 현재 로그인된 id나 name을 가지고 member값을 가져와서 사용할 수 있다
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");
			response.sendRedirect("main.jsp");
		}
	}
%>
</body>
</html>