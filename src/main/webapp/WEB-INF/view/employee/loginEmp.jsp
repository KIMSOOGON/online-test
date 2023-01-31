<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<h1>사원추가</h1>
	<form action="${pageContext.request.contextPath}/employee/loginEmp" method="post">
		<table>
			<tr>
				<td><input type="text" name="empId" placeholder="id"></td>
			</tr>
			<tr>
				<td><input type="password" name="empPw" placeholder="password"></td>
			</tr>
		</table>
		<button type="submit">로그인</button>
	</form>
</body>
</html>