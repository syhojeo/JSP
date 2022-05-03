<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설문 조사 결과</h2>
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		out.println("이름:<b>" + name + "</b><br>");
		String gender=request.getParameter("gender");
		out.println("성별");
		
		if(gender.equals("male")){
			out.println("<b>남자</b><br>");
		}
		else{
			out.println("<b>여자</b><br>");
		}
		
		//여러개의 check박스 값 가져오기
		String seasonArr[] = request.getParameterValues("season");
		out.print("당신이 좋아하는 계절은");
		for(String season : seasonArr){
			if(season.equals("1")){
				out.print(" 봄");
			}
			else if(season.equals("2")){
				out.print(" 여름");
			}

			else if(season.equals("3")){
				out.print(" 가을");
			}

			else if(season.equals("4")){
				out.print(" 겨울");
			}
		}
		out.print(" 입니다");
	%>
	<br>
	<b><a href='javascript:history.go(-1)'>다시 작성</a></b>
</body>
</html>