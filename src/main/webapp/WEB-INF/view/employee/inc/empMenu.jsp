<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/employee/empList">사원관리</a>
	<!-- 등록시 ID체크(employee + teacher + student) -->
	
	<a href="${pageContext.request.contextPath}/employee/teacherList">강사관리</a>
	<!-- 시험등록, 문제등록, 보기등록, 답안지제출 -->
	
	<a href="${pageContext.request.contextPath}/employee/studentList">학생관리</a>
	<!-- 시험보기, 채점,  -->
	
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	<a href="${pageContext.request.contextPath}/employee/modifyEmpPw">비밀번호수정</a>
</div>