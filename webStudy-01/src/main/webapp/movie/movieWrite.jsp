<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
<link rel="stylesheet" type="text/css" href="css/movie.css">
<script type="text/javascript" src="script/movie.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>영화 등록</h1>
		<form method="post" enctype="multipart/form-data" name="frm">
			<table>
				<tr>
					<th> 제 목 </th>
					<td><input type="text" name="title" size="80"></td>
				</tr>
				<tr>
					<th> 가 격 </th>
					<td><input type="text" name="price"> 원</td>
				</tr>
				<tr>
					<th> 감 독 </th>
					<td><input type="text" name="director" size="80"></td>
				</tr>
				<tr>
					<th> 배 우 </th>
					<td><input type="text" name="actor" size="80"></td>
				</tr>
				<tr>
					<th> 설 명 </th>
					<td><textarea cols="80" rows="10" name="synopsis"></textarea></td>
				</tr>
				<tr>
					<th> 사 진 </th>
					<td>
						<input type="file" name="poster"><br>
						(주의사항 : 이미지를 변경하고자 할때만 선택하시오)
					</td>
				</tr>
			</table> <br>
			<input type="submit" value="확인" onclick="return movieCheck()">
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='movieList.do'">
		</form>
	</div>
</body>
</html>