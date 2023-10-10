<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = "asdf";
String pw = "1234";
String name = "김휘진";

if(id.equals(request.getParameter("id")) && pw.equals(request.getParameter("pw"))) {
	session.setAttribute("loginUser", name);
	response.sendRedirect("10_sessionMain.jsp");
} else {
	response.sendRedirect("10_sessionLoginForm.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>