<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = "gnl";
String pw = "asd";
String name = "휘진";

if(id.equals(request.getParameter("id")) && pw.equals(request.getParameter("pw"))) {
	Cookie c = new Cookie("userName",URLEncoder.encode(name,"UTF-8"));
	c.setMaxAge(365*24*60*60);
	response.addCookie(c);

	/*response.addCookie(new Cookie("userId", id));
	response.addCookie(new Cookie("userPw", pw));
	response.addCookie(new Cookie("userName", name));*/
%>
	<h2> 성공적으로 로그인하셨습니다.</h2>
	<p> <a href="231011_exam0501_main.jsp"> 들어가기 </a>
<% } else { %>
	<h2> 로그인에 실패하셨습니다.</h2>
	<p> <a href="231011_exam0501_loginForm.jsp"> 되돌아가기 </a>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>