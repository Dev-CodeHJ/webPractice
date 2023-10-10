<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int sum = 0;
%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1부터 <%= num %>까지 자연수 합 구하기</h1>
	<% for(int i=1; i<=num; i++) {
			sum += i;
			if(i != num) {
				out.print(i + "+");
			} else {
				out.print(num + " = " + sum);
			}
	}
	%>
</body>
</html>