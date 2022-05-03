<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  \을 넣어주면 계산을 진행하여 출력하지 않고 문자 그대로를 출력 -->
\${5+2}:\${5+2}<br>
\${5/2 }:${5/2 }<br>
<!-- div 문자를 사용해도 나누기가 가능하다 -->
<%-- ${5 div 2 }<br> --%>
\${5%2}:${5%2}<br>
\${5 mod 2}: ${5 mod 2 }<br>
\${5>2 }:${5>2 }<br>
\${(5 > 2)? 5:2} : ${(5 > 2)? 5:2}<br>
\${5>2 } || (2<10)}: ${5>2 } || (2<10)}<br>
\${5>2 } && (2<10)}: ${5>2 } && (2<10)}
<%String input = null; %>
\${empty input} : ${empty input} }<br><br> <%-- empty 널 검사 --%>
<%
	if(input == null) {
		out.println("텅 빈 객체(null)입니다." + "<br>");
	}
%>

<%-- JSTL (JSP Standard Tag Library (외부 라이브러리 필요) --%>
<%-- <c:if test=${empty input }> --%>
<!-- 	텅 빈 객체 입니다. -->
</body>
</html>