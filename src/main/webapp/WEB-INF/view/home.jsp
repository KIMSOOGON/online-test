<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>세상에 존재하는 모든 시험기출문제 모음 사이트</h1>
	<c:if test="${loginTeacher == null && loginEmployee == null && loginStudent == null}">
		<div>
			<a href="${pageContext.request.contextPath}/employee/login">관리자접근</a>
			<a href="${pageContext.request.contextPath}/teacher/login">강사</a>
			<a href="${pageContext.request.contextPath}/student/login">학생</a>
		</div>
	</c:if>
	
	<!-- teacherMenu include (강사로그인시에만 출력)-->
	<c:if test="${loginTeacher != null}">
		<div>
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</div>
	</c:if>
	
	<!-- teacherMenu include (직원로그인시에만 출력)-->
	<c:if test="${loginEmployee != null}">
		<div>
			<c:import url="/WEB-INF/view/employee/inc/employeeMenu.jsp"></c:import>
		</div>
	</c:if>
	
	<!-- teacherMenu include (학생로그인시에만 출력)-->
	<c:if test="${loginStudent != null}">
		<div>
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		</div>
	</c:if>
</body>
</html>