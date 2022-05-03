<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<h2>아이디 중복 확인</h2>
<form action="idCheck.do" method="get" name="frm">
	아이디<input type="text" name="userid" value="${userid}">
	    <input type="submit" value="중복 체크"><br>
	    
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			opener.document.frm.userid.value="";
			/*opener 객체는 자기 자신을 오프한 기존 창의 window 객체를 참조한다. */
			//즉 opener.document.frm은 기존 창의 document.frm 과 같다
			//때문에 opener.document.frm.userid.value 값을 설정하면
			//기존 창의 값이 변경된다
		</script>
		${userid}는 이미 사용 중인 아이디입니다.
	</c:if>
	<c:if test="${result == -1 }">
		${userid}는 사용 가능한 아이디입니다.
		<input type="button" value="사용" onclick="idok('${userid}')">
	</c:if>
</form>
</body>
</html>