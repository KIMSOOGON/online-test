<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>강사추가</h1>
	<form action="${pageContext.request.contextPath}/employee/addTeacher" method="post">
		<div><input type="text" name="teacherId" placeholder="id"></div>
		<div><input type="password" name="teacherPw" placeholder="password"></div>
		<div><input type="text" name="teacherName" placeholder="name"></div>
		<div><button type="submit">등록</button></div>
	</form>
</body>
</html>