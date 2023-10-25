<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript" src="script/employee.js"></script>
</head>
<body>
	<div align="center">
		<h1>비밀번호 확인</h1>
		<form action="EmployeeServlet" name="frm" method="get">
			<input type="hidden" name="command" value="employee_check_pw">
			<input type="hidden" name="id" value="${param.id}">
			<table style="width: 80%">
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pw" size="20">
					</td>
				</tr>
			</table><br>
			<input type="submit" value="확 인" onclick="return pwCheck()">
			<br><br>${msg}
		</form>
	</div>
</body>
</html>