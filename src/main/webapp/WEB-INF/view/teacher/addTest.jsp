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
			난이도
			<select name="testLevel">
				<option value="★">★</option>
				<option value="★★">★★</option>
				<option value="★★★">★★★</option>
				<option value="★★★★">★★★★</option>
				<option value="★★★★★">★★★★★</option>
			</select>
		</div>
		<div>
			제한시간
			<select name="testTimer">
				<option value="20">20분</option>
				<option value="30">30분</option>
				<option value="40">40분</option>
				<option value="60">60분</option>
				<option value="90">90분</option>
				<option value="120">120분</option>
			</select>
		</div>
		<div>
			<input type="text" name="testTitle" placeholder="등록할 시험을 입력하세요.">
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>