<%@page import="java.util.Date"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Timestamp"%>
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
	%>
	<jsp:useBean id="dto" class="com.javalec.ex.MemberDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	//JSP 에서 java.lang.system 을 로드해올 수없는 에러 발생 밑의 코드로 대체
	//java 17 과 tomcat8.5v 사이의 문제인걸로 추측된다
  	  	//dto.setrDate(new Timestamp(System.currentTimeMillis()));
 		dto.setrDate(new Timestamp(new Date().getTime()));
		MemberDao dao=MemberDao.getInstance();
		
		if(dao.confirmId(dto.getId())==MemberDao.MEMBER_EXISTENT){
	%>
		<script type="text/javascript">
			alert("이미 존재하는 아이디 입니다.");
			history.go(-1);
		</script>
	<%
		}else{
			int ri=dao.insertMember(dto);
			if(ri==MemberDao.MEMBER_JOIN_SUCCESS){
				session.setAttribute("id", dto.getId());
	%>
			<script type="text/javascript">
				alert("회원 가입을 축하합니다!");
				document.location=href="login.jsp";
			</script>
	<%
			}else{
	%>
			<script type="text/javascript">
				alert("회원 가입에 실패했습니다.");
				document.location=href="login.jsp";
			</script>
	<%			
			}
		}
	%>
</body>
</html>