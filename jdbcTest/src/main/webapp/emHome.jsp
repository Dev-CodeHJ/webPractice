<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 td{
    border: 1px solid black;
    width: 200px;
    text-align: center;
 }
 table.mainmenu td.login:HOVER{
    background-color: pink;
 }
 
</style>
</head>
<body>
	<table class="top" align="center">
		<c:if test="${empty loginEm}">
			<tr>
				<td></td><td></td>
				<td class="login"> <a name="login" href="emLogin.do" style="text-decoration: none;">로그인</a></td>
		        <td style="width:250px">사원 등록<br>
		        <span style="color:red">(관리자로 로그인 후 사용 가능)</span></td>
		        <td>마이페이지<br>
		        <span style="color:red">(로그인 후 사용 가능)</span></td>
	        </tr>
        </c:if>
        <c:if test="${!empty loginEm.name}">
	    	<tr>
		        <td> ${loginEm.name}님 반갑습니다.</td>
		        <td> 레벨 : ${loginEm.level}</td>
		        <td class="login"> <a href="emLogout.do" style="text-decoration: none;">로그아웃</a></td>
	        	<c:choose>
			        <c:when test="${loginEm.level=='A'}">
			        <td class="login"> <a href="emCustom.do" style="text-decoration: none;">사원 등록</a></td>
			        </c:when>
			        <c:when test="${loginEm.level=='B'}">
			        <td style="width:300px">사원 등록<br>
			        <span style="color:red">(관리자로 로그인 후 사용 가능)</span></td>
			        </c:when>
	        	</c:choose>
	        	<td class="login">
		        <a href="emMypage.do" style="text-decoration: none;">마이페이지</a>
		        </td>
	        </tr>      
	   </c:if>
	   </table>
   <h1>회원 전용 페이지</h1>
   <img src="resources/img/kim.jpg">
</body>
</html>