<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script type="text/javascript">
		if(window.name == "update") {
			window.opener.parent.location.href="EmployeeServlet?command=employee_update_form&id=${param.id}";
		} else if(window.name == 'delete') {
			alert('삭제되었습니다.');
			window.opener.parent.location.href="EmployeeServlet?command=employee_delete&id=${param.id}";
		}
		window.close();
	</script>
</body>
</html>