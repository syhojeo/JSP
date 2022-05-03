<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
자바 코드<br>
== 연산자 사용 결과
<!-- 단순 오브젝트 주소 비교 때문에 false가 나온다 -->
<%=request.getParameter("id")  == "pinksung" %><br>

equals() 사용 결과
<!-- 주소창에 ?id=pinksung 하면 값 확인할 수 있다 -->
<!-- 아마 id값이 없는데 접근해서 "pinksung"의 문자열과 비교하려했기 때문에 널포인터가 뜨는거 같다 -->
<%-- <%=request.getParameter("id").equals("pinksung")%><br> --%>
</body>
</html>