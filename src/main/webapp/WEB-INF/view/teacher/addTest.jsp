<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>시험등록</h1>
	<form action="${pageContext.request.contextPath}/teacher/addTest" method="post">
		<div>
			<input type="text" name="testTitle" placeholder="등록할 시험을 입력하세요.">
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>