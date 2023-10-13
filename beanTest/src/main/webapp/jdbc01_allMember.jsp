<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost/nscott";
	String uid = "root";
	String pass = "ezen1234";
	String sql = "select * from member";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width='800' border='1'>
		<tr>
			<th>이름</th><th>아이디</th><th>암호</th>
			<th>이메일</th><th>전화번호</th><th>권한(1:관리자, 0:일반회원)</th>
		</tr>
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, pass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				out.print("<tr>");
				out.print("<td>" + rs.getString("name") + "</td>");
				out.print("<td>" + rs.getString("id") + "</td>");
				out.print("<td>" + rs.getString("pw") + "</td>");
				out.print("<td>" + rs.getString("email") + "</td>");
				out.print("<td>" + rs.getString("phone") + "</td>");
				out.print("<td>" + rs.getString("admin") + "</td>");
				out.print("</tr>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		%>
	</table>
</body>
</html>