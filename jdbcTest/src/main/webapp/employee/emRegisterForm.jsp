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
        <c:if test="${loginEm.level == 'A'}">
	    	<tr>
		        <td> ${loginEm.name}님 반갑습니다.</td>
		        <td> 레벨 : ${loginEm.level}</td>
		        <td class="login"> <a href="emLogout.do" style="text-decoration: none;">로그아웃</a></td>
		        <td class="login"> <a href="emRegister.do" style="text-decoration: none;">사원 등록</a></td>
	        	<td class="login">
		        <a href="emMypage.do" style="text-decoration: none;">마이페이지</a>
		        </td>
	        </tr>
	        <form action="emRegister.do" method="post" name="frm">
			   <table class="main">
					<tr>
						<td colspan="2">사원등록</td>
					</tr>
					<tr>
						<td style="width: 50%;">아이디</td>
						<td>
							<input type="text" name="id">
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">비밀번호</td>
						<td>
							<input type="password" name="pw">
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">이름</td>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">레벨</td>
						<td>
							<select name="level">
								<option value="B">일반회원</option>
								<option value="A">운영자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">성별</td>
						<td>
							<select name="gender">
								<option value="1">남자</option>
								<option value="2">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">전화번호</td>
						<td>
							<input type="text" name="phone">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" onclick="return registerCheck()">
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