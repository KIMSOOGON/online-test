<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>${thisTest.testTitle}</h1>
	<p>${thisTest.testDate}</p>
	
	<!-- 문제추가 (모달로 교체예정) -->
	<form>
		<table>
			<!-- 문제 -->
			<tr>
				<th>문제</th>
				<td>
					<input type="text" name="questionTitle">
					<input type="text" name="questionIdx" value="${ttlQstCnt+1}">
				</td>
			</tr>
			<!-- 선택지 항목 -->
			<tr>
				<th>①</th>
				<td>
					
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 문제목록 (5,10,20 문항 한정 추후 구현예정) -->
	<c:forEach var="q" items="${list}">
		<!-- 문제 -->
		<c:if test="${q.exampleIdx == 1}">
			<div style="font-weight:bold;">
				${q.questionIdx}. ${q.questionTitle}
			</div>
		</c:if>
		<br>
		<!-- 선택지 -->
		<c:if test="${q.exampleIdx == 1}">
			<div>
				&nbsp;① ${q.exampleTitle}
			</div>
		</c:if>
		<c:if test="${q.exampleIdx == 2}">
			<div>
				&nbsp;② ${q.exampleTitle}
			</div>
		</c:if>
		<c:if test="${q.exampleIdx == 3}">
			<div>
				&nbsp;③ ${q.exampleTitle}
			</div>
		</c:if>
		<c:if test="${q.exampleIdx == 4}">
			<div>
				&nbsp;④ ${q.exampleTitle}
			</div>
			<br>
		</c:if>
	</c:forEach>
	
</body>
</html>