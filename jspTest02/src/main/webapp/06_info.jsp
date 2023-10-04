<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿</title>
<style>
	form {
		width: 300px;
	}
	input {
		float: right;
	}
</style>
</head>
<body>
	<h3> get 방식에서 한글 깨짐 방지 </h3>
	<form method="get" action="InfoServletTest">
		이름 <input type="text" name="name"><br>
		주소 <input type="text" name="addr"><br>
		<input type="submit" value="전송">
	</form>
	<br>
	<h3> post 방식에서 한글 깨짐 방지 </h3>
	<form method="post" action="InfoServletTest">
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="password" name="pw1"><br>
		비밀번호확인 <input type="password" name="pw2"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>