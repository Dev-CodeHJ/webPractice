<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>설문 조사 결과</title>
	<style type="text/css">
	b {
		font-size: 16pt;
	}
	</style>
</head>
<body>
	<h2>설문 조사 결과</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		out.println("이름 : <b>" + name + "</b><br>");
		
		String gender = request.getParameter("gender");
		out.println("성별 : ");
		out.println("<b>" + gender + "</b><br>");
		
		if(request.getParameterValues("season")!=null){
			String seasonArr[] = request.getParameterValues("season");
			out.println("당신이 좋아하는 계절은 ");
			for(int i=0; i<seasonArr.length; i++) {
				out.println("<b>" + seasonArr[i] + "</b>입니다.");
			}
		} else {
			out.println("당신이 좋아하는 계절은 <b>없습니다.</b>");
		}
	%>
	
	<br>
	<b><a href='javascript:history.go(-1)'>다시</a></b>
</body>
</html>