<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id="gnlwls";
String pw="123";
String name="김휘진";
request.setCharacterEncoding("UTF-8");
if(id.equals(request.getParameter("id")) && pw.equals(request.getParameter("pw")) ) {
	response.sendRedirect("04_main.jsp?name="+URLEncoder.encode(name, "UTF-8"));
} else {
	response.sendRedirect("04_loginForm.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>