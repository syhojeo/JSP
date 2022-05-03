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
%>
<jsp:useBean id="dto" class="com.javalec.ex.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	dto.setId(id);
	dto.setName(name);
	
	MemberDao dao = MemberDao.getInstance();
	//dto 객체를 이용하여 update
	int ri = dao.updateMember(dto);
	
	if (ri == 1){
%>
	<script type="text/javascript">
		alert("정보가 성공적으로 수정되었습니다.);
		document.location.href="main.jsp";
	</script>
<%
	}else {
%>
	<script type="text/javascript">
		alert("정보 수정에 실패했습니다.");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>