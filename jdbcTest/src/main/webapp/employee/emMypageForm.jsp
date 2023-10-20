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
	        <form action="emMypage.do" method="post" name="frm">
			    <table class="main">
					<tr>
						<td colspan="2">마이페이지</td>
					</tr>
					<tr>
						<td style="width: 50%;">아이디</td>
						<td>
							<input type="text" name="id" value="${loginEm.id}" readonly>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">비밀번호</td>
						<td>
							<input type="password" name="pw" value="${loginEm.pw}">
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">이름</td>
						<td>
							<input type="text" name="name" value="${loginEm.name}">
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">권한</td>
						<td>
							<select name="level">
								<c:if test="${loginEm.level=='A'}">
									<option value="A" selected="selected">운영자</option>
									<option value="B">일반회원</option>
								</c:if>
								<c:if test="${loginEm.level=='B'}">
									<option value="A">운영자</option>
									<option value="B" selected="selected">일반회원</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">성별</td>
						<td>
							<select name="gender">
								<c:if test="${loginEm.gender==1}">
									<option value=1 selected="selected">남자</option>
									<option value=2>여자</option>
								</c:if>
								<c:if test="${loginEm.gender==2}">
									<option value=1>남자</option>
									<option value=2 selected="selected">여자</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">전화번호</td>
						<td>
							<input type="text" name="phone" value="${loginEm.phone}">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" onclick="return registerCheck()">
							<input type="reset" value="취소">
							<input type="button" value="메인 페이지로 이동" onclick="location.href='emLogin.do'">
						</td>
					</tr>
				</table>
			</form>
	    </c:if>
    </table>
</body>
</html>