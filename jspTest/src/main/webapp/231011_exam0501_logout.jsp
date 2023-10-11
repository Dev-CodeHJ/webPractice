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
Cookie[] ck = request.getCookies();
for(Cookie c:ck) {
	c.setMaxAge(0);
	response.addCookie(c);
}
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	location.href="231011_exam0501_loginForm.jsp";
</script>
</body>
</html>