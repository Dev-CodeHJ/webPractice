<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost/nscott";
	String uid = "root";
	String pass = "ezen1234";
	String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String admin = request.getParameter("admin");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, pass);
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, pw);
	pstmt.setString(4, email);
	pstmt.setString(5, phone);
	pstmt.setInt(6, Integer.parseInt(admin));
	
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
<h3> 회원 가입 성공 </h3>
<a href="jdbc01_allMember.jsp"> 회원 전체 목록 보기 </a>
</body>
</html>