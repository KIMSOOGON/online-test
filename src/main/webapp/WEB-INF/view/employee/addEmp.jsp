<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원추가</h1>
	<form action="${pageContext.request.contextPath}/employee/addEmp" method="post">
		<div><input type="text" name="empId" placeholder="id"></div>
		<div><input type="password" name="empPw" placeholder="password"></div>
		<div><input type="text" name="empName" placeholder="name"></div>
		<div><button type="submit">등록</button></div>
	</form>
</body>
</html>