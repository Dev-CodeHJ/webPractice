<%@page import="java.net.http.HttpRequest"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%! 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	.center {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	}
</style>
</head>
<body>
<script>
	var msg = "aaaa";
		alert(msg);
		<% response.sendRedirect("emLogin.do"); %>
	</script>
</body>
</html>