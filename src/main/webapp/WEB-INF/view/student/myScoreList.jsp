<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>${loginStudent.studentName}님의 응시한 시험 목록 및 채점결과</h1>
	
	<!-- 시험검색 -->
	<form method="get" action="${pageContext.request.contextPath}/student/myScoreList">
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
	
	<!-- 응시한 시험 및 점수 출력 -->
	<table>
		<thead>
			<tr>
				<th>No.</th>
				<th>시험제목</th>
				<th>점수</th>
				<th>응시날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="s" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${s.testTitle}</td>
					<td>${s.score}</td>
					<td>${s.scoreDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>