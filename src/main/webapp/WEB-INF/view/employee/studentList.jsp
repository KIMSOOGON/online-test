<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	
	<h1>Student List</h1>
	<a href="${pageContext.request.contextPath}/employee/addStudent">학생등록</a>
	<!-- 학생검색 -->
	<form method="get" action="${pageContext.request.contextPath}/employee/studentList">
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
		<input type="text" name="searchWord" placeholder="학생 이름을 검색하세요" value="${searchWord}">
		<button type="submit">검색</button>
	</form>
	<c:if test="${searchWord != ''}">
		'<span style="color:#A81919">${searchWord}</span>' 검색결과, 총 '<span style="color:#A81919">${ttlStuCnt}</span>'건이 검색되었습니다. 
	</c:if>
	<table border="1">
		<tr>
			<th>학생ID</th>
			<th>학생이름</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.studentId}</td>
				<td>${s.studentName}</td>
				<td><a href="${pageContext.request.contextPath}/employee/removeStudent?studentNo=${s.studentNo}">X</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=1&searchWord=${searchWord}&rowPerPage=${rowPerPage}">&#x23EA</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${startPage-10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">◀</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:choose>
				<c:when test="${currentPage == i}">
					<span style="font-weight:bold; color:orange;">${i}</span>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${i}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${(lastPage-startPage) > 10}">
			<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${startPage+10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">▶</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${lastPage}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">&#x23E9</a>
	</div>
</body>
</html>