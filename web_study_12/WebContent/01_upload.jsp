<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	enctype 속성은 폼 데이터(form data)가 서버로 제출될 때 해당 데이터가 인코딩되는 방법을 명시
	multipart/form-data : 모든 문자를 인코딩하지 않음을 명시함.
	
	C:\study\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\web_study_12\upload
	실제 이미지 저장위치
. -->
	<form action="upload.do" method="post" enctype="multipart/form-data">
		글쓴이:<input type="text" name="name"><br>
		제&nbsp;목:<input type="text" name="title"><br>
		파일 지정하기:<input type="file" name="uploadFile"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>