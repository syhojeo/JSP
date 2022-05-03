<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript src="script/product.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>정보 등록</h1>
			<form action="moviewrite.do" method="post" enctype="multipart/form-data" name="frm">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" size="60"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" size="60">원</td>
					</tr>
					<tr>
						<th>감독</th>
						<td><input type="text" name="director" size="60"></td>
					</tr>
					<tr>
						<th>배우</th>
						<td><input type="text" name="actor" size="60"></td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea cols="70" rows="10" name="synopsis"></textarea></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="poster"><br></td>
					</tr>
				</table><br>
				
				<input type="submit" value="확인" onclick="return productCheck()">
				<input type="reset" value="취소">
				<%-- 
					첫 페이지를 movieWrite.jsp 실행후 목록을 클릭했을때 문제가 발생하는것이 이해가 가지않는다 
					그러나 첫페이지를 servlet으로 실행시 에러가 발생하지 않는다
					이페이지에서 목록을 클랙해서 movielist.do 로 가던지 movielist.do를 바로 실행하던지
					결국 똑같지 않은가?
					여기서 button을 누른다는것은 서버에게 요청하는것이 아니기 때문에 request객체가 없어서
					생기는 에러인가?
					바로 servlet을 실행도 request받은건 없지않나?
				--%>
				<input type="button" value="목록" onclick="location.href='movielist.do'">
			</form>
	</div>
</body>
</html>