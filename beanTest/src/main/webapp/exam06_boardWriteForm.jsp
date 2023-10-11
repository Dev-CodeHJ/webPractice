<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
	<style>
	form{
		float: left;
	}
	</style>
</head>
<body>
	<h3>게시판 글쓰기</h3>
	<form method="post" action="exam06_boardWrite.jsp">
		<table>
			<tr>
				<th> 작성자 </th>
				<td> <input type="text" name="name" size="15"></td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td> <input type="password" name="pw" size="15"> (게시물 수정 삭제시 필요합니다.)</td>
			</tr>
			<tr>
				<th> 이메일 </th>
				<td> <input type="text" name="email" size="40"></td>
			</tr>
			<tr>
				<th> 글제목 </th>
				<td> <input type="text" name="title" size="60"></td>
			</tr>
			<tr>
				<th> 글 내용 </th>
				<td> <textarea name="content" rows="10" cols="65"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="등록">
		<input type="reset" value="다시 작성">
	</form>
</body>
</html>