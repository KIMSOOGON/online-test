<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>시험목록</h1>
	
	<!--
		강사는 시험등록, 수정, 삭제가능하게끔
		학생은 시험응시 가능하게끔
	 -->
	 
	<a href="${pageContext.request.contextPath}/teacher/addTest">시험등록</a>
	<!-- 시험검색 -->
	<form method="get" action="${pageContext.request.contextPath}/teacher/testList">
		<select name="rowPerPage">
			<c:if test="${rowPerPage == 5}">
				<option value="5" selected="selected">5</option>
				<option value="10">10</option>
				<option value="20">20</option>
			</c:if>
			<c:if test="${rowPerPage == 10}">
				<option value="5">5</option>
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
			</c:if>
			<c:if test="${rowPerPage == 20}">
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="20" selected="selected">20</option>
			</c:if>
		</select>
		<input type="text" name="searchWord" placeholder="시험명을 검색하세요" value="${searchWord}">
		<button type="submit">검색</button>
	</form>
	<table>
		<tr>
			<th>번호</th>
			<th>시험명</th>
			<th>등록날짜</th>
			<th>
				<c:if test=${loginTeacher != null}>
					삭제
				</c:if>
				<c:if test=${loginStudent != null}>
					응시
				</c:if>
			</th>

		</tr>
		<!-- 시험목록 출력 -->
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testNo}</td>
				<td>
					<c:if test=${loginTeacher != null}>
					<a href="">${t.testTitle}</a>
					</c:if>
					<c:if test=${loginTeacher == null}>
					${t.testTitle}
					</c:if>
				</td>
				<td>${t.testDate}</td>
				<td>
					<c:if test=${loginTeacher != null}>
						<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}">삭제</a>
					</c:if>
					<c:if test=${loginStudent != null}>
						<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}">응시하기</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>