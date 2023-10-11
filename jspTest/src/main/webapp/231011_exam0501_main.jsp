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
Cookie[] cookies = null;
cookies = request.getCookies();
if(cookies != null) {
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("userName")) { %>
			<%=cookies[i].getValue() %>님 안녕하세요!<br>
			저희 홈페이지에 방문해 주셔서 감사합니다.<br>
			즐거운 시간 되세요....<br>
			<form method="post" action="231011_exam0501_logout.jsp">
				<input type="submit" value="로그아웃">
			</form>
		<% }
	}
} else { %>
	<h2> 로그인에 실패하셨습니다. </h2>
	<p> <a href="231011_exam0501_loginForm.jsp"> 되돌아가기 </a>
<% } %>
</body>
</html>