<%@page import="java.util.Enumeration" %>
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
	session.setAttribute("s_name1", "저는 세션에 저장된 첫 번째 값이예요");
	session.setAttribute("s_name2", "저는 세션에 저장된 두 번째 값이예요");
	session.setAttribute("s_name3", "저는 세션에 저장된 세 번째 값이예요");

	out.print("<h3>==세션값을 삭제하기 전==<h3>");
	Enumeration<String> names;
	//한번에 모든 Attribute를 가져오기 위해 Enumeration으로 선언된 변수에 AttributeName들을 저장한다
	names = session.getAttributeNames();
	
	while(names.hasMoreElements()){
		String name = names.nextElement();
		//toString() 함수를 이용해서 세션의 리턴값인 Object형 객체를 String객체로 넣어주기
		String value = session.getAttribute(name).toString();
		out.println(name + ":" + value + "<br>");
	}
	
	//invalidate: 해당 세션 관련된 값들을 삭제한다
	session.invalidate();

	out.print("<h3>==세션값을 삭제한 후==<h3>");
	out.print("Q:과연 세션 아이디가 유효 할까요?");
	
	if(request.isRequestedSessionIdValid() == true) {
		out.print("A:세션 아이디가 유효합니다.");
	}
	else {
		out.print("A:세션 아이디가 유효하지 않습니다.");
	}
	
%>
</body>
</html>