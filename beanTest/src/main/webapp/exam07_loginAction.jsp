<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${param.id}
님 
<c:choose>
	<c:when test="${param.mode == 'user'}">
		<span style="color: green;">사용자로</span>
	</c:when>
	<c:otherwise>
		<span style="color: red">관리자로</span>
	</c:otherwise>
</c:choose>
로그인하셨습니다.
</body>
</html>
