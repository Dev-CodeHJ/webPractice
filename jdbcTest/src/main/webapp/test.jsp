<%@page import="java.sql.Connection"%>
<%@page import="com.hwijin.dao.MemberDAO"%>
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
MemberDAO member = MemberDAO.getInstance();
Connection con = member.getConnection();
out.println("DBCP success");
%>
</body>
</html>