<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String id = request.getParameter("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="grey">
<% request.setCharacterEncoding("UTF-8"); %>
	<p><%= request.getParameter("id") %>님 ${id} 관리자로 로그인하셨습니다.</p>
	<c:out value="${param.id}"></c:out>
</body>
</html>