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
	<c:if test="${loginStudent == null}">
		<h1>학생로그인</h1>
		<a href="${pageContext.request.contextPath}/loginEmp">직원</a>
		<a href="${pageContext.request.contextPath}/loginTeacher">강사</a>
		<form action="${pageContext.request.contextPath}/loginEmp" method="post">
			<table>
				<tr>
					<td><input type="text" name="studentId" placeholder="id"></td>
				</tr>
				<tr>
					<td><input type="password" name="studentPw" placeholder="password"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	
	<!-- 이미 로그인한 경우 -->
	<c:if test="${loginStudent != null}">
		${loginStudent.studentName}님 반갑습니다
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
	
</body>
</html>