<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">학생 비밀번호수정</a>
	
	<!-- 
		지나간 시험 리스트 + 점수 - 점수확인버튼 - 제출답안지확인(O/X)
		오늘날짜 시험 리스트 응시버튼 -> 해당회차 시험지 출력(table : question X example) - 답안지제출버튼(table: paper) 
	-->
	<a href="${pageContext.request.contextPath}/testList">시험목록</a>
	<a href="${pageContext.request.contextPath}/student/studentPage">내 정보</a>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	
</div>