<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>홈화면입니다</h1>
	
	<!-- teacherMenu include (강사로그인시에만 출력)-->
	<c:if test="${loginTeacher != null}">
		<div>
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</div>
	</c:if>
	
	<!-- teacherMenu include (강사로그인시에만 출력)-->
	<c:if test="${loginEmployee != null}">
		<div>
			<c:import url="/WEB-INF/view/employee/inc/employeeMenu.jsp"></c:import>
		</div>
	</c:if>
	
	<!-- teacherMenu include (강사로그인시에만 출력)-->
	<c:if test="${loginStudent != null}">
		<div>
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		</div>
	</c:if>
</body>
</html>