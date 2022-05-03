<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>클라이언트로 부터 가져온 쿠키 정보</h3>
	<%
		//페이지가 이동되면 쿠키는 헤더에 포함되어 다른 페이지로 이동되며 
		//request객체의 getCookies() 메소드를 이용하여 접근할 수 있다
		int index = 0;
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			//첫번째 인덱스([0])는 JSESSIONID 가 출력된다 
			//JSESSIONID: (request 를 요청받은 쪽에서 한번 요청한 jsp 를 기억하기 위한 고유번호)
			//두번째 인덱스([1]) 부터 response에 add한 cookie 값들이 들어가서 출력된다
			out.println(c.getName() + ":" + c.getValue() + ", index:" + index++ + "<br>");
		}
	%>
</body>
</html>