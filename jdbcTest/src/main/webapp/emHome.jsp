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
				<td class="login"> <a name="login" href="emLogin.do" style="text-decoration: none;">�α���</a></td>
		        <td style="width:250px">��� ���<br>
		        <span style="color:red">(�����ڷ� �α��� �� ��� ����)</span></td>
		        <td>����������<br>
		        <span style="color:red">(�α��� �� ��� ����)</span></td>
	        </tr>
        </c:if>
        <c:if test="${!empty loginEm.name}">
	    	<tr>
		        <td> ${loginEm.name}�� �ݰ����ϴ�.</td>
		        <td> ���� : ${loginEm.level}</td>
		        <td class="login"> <a href="emLogout.do" style="text-decoration: none;">�α׾ƿ�</a></td>
	        	<c:choose>
			        <c:when test="${loginEm.level=='A'}">
			        <td class="login"> <a href="emRegister.do" style="text-decoration: none;">��� ���</a></td>
			        </c:when>
			        <c:when test="${loginEm.level=='B'}">
			        <td style="width:300px">��� ���<br>
			        <span style="color:red">(�����ڷ� �α��� �� ��� ����)</span></td>
			        </c:when>
	        	</c:choose>
	        	<td class="login">
		        <a href="emMypage.do" style="text-decoration: none;">����������</a>
		        </td>
	        </tr>      
	   </c:if>
   </table>
	<h3 style="text-align:center">ȸ�� ���� ������</h3>
	<div>
	   <center><img style="width:400px;"src="resources/img/kim.jpg"></center>
	</div>
</body>
</html>