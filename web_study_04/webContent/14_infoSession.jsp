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
	String id_str = session.getId();
	long lasttime = session.getLastAccessedTime();
	long createtime = session.getCreationTime();
	long time_used = (lasttime - createtime) / 60000;
	
	//세션의 유효시간 받기
	int inactive = session.getMaxInactiveInterval() / 60;
	boolean b_new = session.isNew();
%>

[1]세션 ID는 [<%=session.getId() %>] 입니다.<br>
[2]당신이 웹 사이트에 머문 시간은 <%=time_used %>분 입니다.<br>
[3]세션의 유효 시간은 <%=inactive %>분 입니다.<br>
[4]세션이 새로 만들어 졌나요?

<%
	if(b_new)
		out.print("예! 새로운 세션을 만들었습니다.");
	else
		out.print("아니오! 새로운 세션을 만들지 않았습니다.");
%>
</body>
</html>