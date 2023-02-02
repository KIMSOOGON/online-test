<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 화면 (로그인 전) -->
	<c:if test="${loginEmp == null}">
		<h1>직원로그인</h1>
		<form action="${pageContext.request.contextPath}/loginEmp" method="post">
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
	</c:if>
	
	<!-- 이미 로그인한 경우 -->
	<c:if test="${loginEmp != null}">
		${loginEmp.empName}님 반갑습니다
		<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
	</c:if>
	
</body>
</html>