<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="exam07_loginAction.jsp">
		<label for="userid">아이디 : </label>
		<input type="text" name="id" id="userid"><br>
		
		<label for="userpw">암 &nbsp; 호 : </label>
		<input type="password" name="pw" id="userpw"><br>
		
		<input type="radio" name="mode" value="user" checked="checked"> 사용자
		<input type="radio" name="mode" value="admin"> 관리자<br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>