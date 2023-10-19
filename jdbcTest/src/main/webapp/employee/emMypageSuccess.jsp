<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>로그인</title>
	<style type="text/css">
	table.main {
		width: 500px;
		margin: auto; 
	}
	th, td {
		border: 1px solid black;
	    width: 200px;
	    text-align: center;
	}
	table.top td.login:HOVER{
    	background-color: pink;
 	}
	</style>
<script type="text/javascript" src="script/employee.js"></script>
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
        <c:if test="${!empty loginEm}">
        	<tr>
		        <td> ${loginEm.name}님 반갑습니다.</td>
		        <td> 레벨 : ${loginEm.level}</td>
		        <td class="login"> <a href="emLogout.do" style="text-decoration: none;">로그아웃</a></td>
	        	<c:choose>
			        <c:when test="${loginEm.level=='A'}">
			        <td class="login"> <a href="emRegister.do" style="text-decoration: none;">사원 등록</a></td>
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
		   <table class="main">
				<tr>
					<td colspan="2">
						<h2>사원 정보</h2>
						<p style="color: grey;">${msg}</p>
					</td>
				</tr>
				
				<c:if test="${result == 1}">
					<tr>
						<td style="width: 50%;">아이디</td>
						<td>${loginEm.id}</td>
					</tr>
					<tr>
						<td style="width: 50%;">비밀번호</td>
						<td>${loginEm.pw}</td>
					</tr>
					<tr>
						<td style="width: 50%;">이름</td>
						<td>${loginEm.name}</td>
					</tr>
					<tr>
						<td style="width: 50%;">레벨</td>
						<td>
							<c:if test="${loginEm.level == 'A'}">운영자</c:if>
							<c:if test="${loginEm.level == 'B'}">일반회원</c:if>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">성별</td>
						<td>
							<c:if test="${loginEm.gender == 1}">남자</c:if>
							<c:if test="${loginEm.gender == 2}">여자</c:if>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">전화번호</td>
						<td>${loginEm.phone}</td>
					</tr>
				</c:if>
					<tr>
						<td colspan="2">
							<input type="button" value="메인 페이지로 이동" onclick="location.href='emLogin.do'">
						</td>
					</tr>
			</table>
		</c:if>
    </table>
</body>
</html>