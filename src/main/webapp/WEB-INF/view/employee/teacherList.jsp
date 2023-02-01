<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>Teacher List</h1>
	<a href="${pageContext.request.contextPath}/employee/addTeacher">강사등록</a>
	<table border="1">
		<tr>
			<th>강사ID</th>
			<th>강사이름</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.teacherId}</td>
				<td>${t.teacherName}</td>
				<td><a href="${pageContext.request.contextPath}/employee/removeTeacher?teacherNo=${t.teacherNo}">X</a></td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${currentPage>1}">
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}">이전</a>
		</c:if> 
		${currentPage}
		<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}">다음</a>
	</div>
</body>
</html>