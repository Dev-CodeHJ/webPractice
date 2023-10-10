<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*String mail = request.getParameter("mail");
	request.setCharacterEncoding("UTF-8");
	
	switch(mail) {
	case "naver":
		response.sendRedirect("https://www.naver.com/");
		break;
	case "daum":
		response.sendRedirect("https://www.daum.net/");
		break;
	case "nate":
		response.sendRedirect("https://www.nate.com/");
		break;
	case "google":
		response.sendRedirect("https://www.google.com/");
		break;
	}*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% response.sendRedirect(request.getParameter("mail")); %>
</body>
</html>