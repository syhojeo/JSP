<%@page import="com.javalec.ex.MemberDao"%>
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
	<jsp:setProperty property="*" name="dto"></jsp:setProperty>
	
	<%
// 		dto.setrDate(new Timestamp(System.currentTimeMillis()));
		MemberDao dao=MemberDao.getInstance();
		
		if (dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) {
	%>
		<script type="text/javascript">
			alert("이미 존재하는 아이디입니다.");
		</script>
	<%
		//기존 회원이 아니기 때문에 DB에 저장하기
		}else {
			int ri = dao.insertMember(dto);
			//제대로 DB에 저장되었을 경우
			if (ri == MemberDao.MEMBER_JOIN_SUCESS) {
				//session 에 id값 저장
				session.setAttribute("id", dto.getId());
	%>
		<script type="text/javascript">
			alert("회원 가입을 축하합니다!");
			document.location.href="login.jsp";
		</script>
	<%
			}else {
	%>
			<script type="text/javascript">
				alert("회원가입에 실패했습니다.")
				document.location.href="login.jsp";
			</script>
	<%
			}
		}
	%>
</body>
</html>