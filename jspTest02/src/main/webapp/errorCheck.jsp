<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	0으로 나누는 것은 불능입니다
	<%
	try{
        /* int로 형변환이 안되는 문자열을 넣어 강제로 Exception 발생 */
            //String product = "사과";
            //int productCnt = Integer.valueOf(product);
            out.print(2/0);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
	%>
</body>
</html>