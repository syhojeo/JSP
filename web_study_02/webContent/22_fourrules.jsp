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
	String str1 = request.getParameter("num1"); //10
	String str2 = request.getParameter("num2"); //20
	
	int num1 = Integer.parseInt(str1);
	int num2 = Integer.parseInt(str2);
	
	//request.setAttribute를 통해 request 객체에 추가 값 넣어주기
	//서버에서의 데이터 이동은 모두 객체여야한다
	//wrapper 가 생략되어 있다 num1 + num2 = new Integer(num1+num2)
	//request.setAttribute("sum". new Integer(num1 + num2));
	request.setAttribute("sum", num1+num2);
	request.setAttribute("difference", num1-num2);
	request.setAttribute("product", num1*num2);
	request.setAttribute("quotient", num1/num2);

	//다른 jsp 페이지로 넘겨주기
	RequestDispatcher dispatcher = request.getRequestDispatcher("23_fourrulesresult.jsp");
	//forward 페이지이동 다만 서버내에서 이동했기 때문에 클라이언트에서는 이동했는지 알수없다
	dispatcher.forward(request, response);
%>
</body>
</html>