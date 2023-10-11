<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="movie" class="com.mission.javabeans.MovieBean"/>
<jsp:setProperty property="*" name="movie"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 처리 페이지</title>
</head>
<body>
	<h2>입력 완료된 정보</h2>
	<table>
		<tr>
			<th>제목</th>
			<td><jsp:getProperty property="title" name="movie"/> </td>
		</tr>
		<tr>
			<th>가격</th>
			<td><jsp:getProperty property="price" name="movie"/> </td>
		</tr>
		<tr>
			<th>감독</th>
			<td><jsp:getProperty property="director" name="movie"/> </td>
		</tr>
		<tr>
			<th>출연배우</th>
			<td><jsp:getProperty property="actor" name="movie"/> </td>
		</tr>
		<tr>
			<th>시놉시스</th>
			<td><textarea name="synopsis" rows="10" cols="40"><jsp:getProperty property="synopsis" name="movie"/></textarea></td>
		</tr>
		<tr>
			<th>장르</th>
			<td><jsp:getProperty property="genre" name="movie"/> </td>
		</tr>
	</table>
</body>
</html>