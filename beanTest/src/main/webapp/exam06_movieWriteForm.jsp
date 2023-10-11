<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 입력 폼</title>
</head>
<body>
	<h1>정보 등록</h1>
	<form method="post" action="exam06_movieWrite.jsp">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="20"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" size="20">원</td>
			</tr>
			<tr>
				<th>감독</th>
				<td><input type="text" name="director" size="20"></td>
			</tr>
			<tr>
				<th>출연배우</th>
				<td><input type="text" name="actor" size="20"></td>
			</tr>
			<tr>
				<th>시놉시스</th>
				<td><textarea name="synopsis" rows="10" cols="40"></textarea> </td>
			</tr>
			<tr>
				<th>장르</th>
				<td>
					<select name="genre">
						<option value="로맨스">로맨스</option>
						<option value="스릴러">스릴러</option>
						<option value="미스터리">미스터리</option>
						<option value="액션">액션</option>
						<option value="코미디">코미디</option>
						<option value="애니메이션">애니메이션</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</form>
</body>
</html>