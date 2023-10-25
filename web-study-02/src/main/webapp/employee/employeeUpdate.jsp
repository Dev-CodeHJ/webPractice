<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript" src="script/employee.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>정보 수정</h1>
		<form action="EmployeeServlet" name="frm" method="post">
			<input type="hidden" name="command" value="employee_update">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" size="12" name="id" value="${emp.id}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" value="${emp.pw}"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${emp.name}"></td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<select name="level">
							<c:choose>
								<c:when test="${emp.level == 'A'}">
									<option value="A" selected="selected">운영자</option>
									<option value="B">일반사원</option>
								</c:when>
								<c:otherwise>
									<option value="A">운영자</option>
									<option value="B" selected="selected">일반사원</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender">
							<c:choose>
								<c:when test="${emp.gender == '1'}">
									<option value="1" selected="selected">남자</option>
									<option value="2">여자</option>
								</c:when>
								<c:otherwise>
									<option value="1">남자</option>
									<option value="2" selected="selected">여자</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value="${emp.phone}"></td>
				</tr>
			</table><br><br>
			<input type="submit" value="확인" onclick="return employeeCheck()">
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='EmployeeServlet?command=employee_list'">
		</form>
	</div>
</body>
</html>