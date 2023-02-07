<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
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
	
	<h1>시험목록</h1>
	<a href="${pageContext.request.contextPath}/Home">HOME</a>
	<!--
		강사는 시험등록, 수정, 삭제가능하게끔
		학생은 시험응시 가능하게끔
	 -->
	<c:if test="${loginTeacher != null && loginStudent == null}">
		<a href="${pageContext.request.contextPath}/teacher/addTest">시험등록</a>
	</c:if>
	<!-- 시험검색 -->
	<form method="get" action="${pageContext.request.contextPath}/testList">
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
			<th>No.</th>
			<th>Test</th>
			<th>release date</th>
			<c:if test="${loginStudent != null && loginTeacher == null}">
				<th>Try</th>
			</c:if>
			<c:if test="${loginTeacher != null && loginStudent == null}">
				<th>Delete</th>
			</c:if>
		</tr>
		<!-- 시험목록 출력 -->
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testNo}</td>
				<c:choose>
					<c:when test="${loginTeacher != null}">
						<td>
							<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							${t.testTitle}
						</td>
					</c:otherwise>
				</c:choose>
				<td>${t.testDate}</td>
				<c:if test="${loginStudent != null && loginTeacher == null}">
					<td>
						<a href="${pageContext.request.contextPath}/student/examTest?testNo=${t.testNo}">응시</a>
					</td>
				</c:if>
				<c:if test="${loginTeacher != null && loginStudent == null}">
					
					<td>
						<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}">삭제</a>
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/testList?currentPage=1&searchWord=${searchWord}&rowPerPage=${rowPerPage}">&#x23EA</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/testList?currentPage=${startPage-10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">◀</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:choose>
				<c:when test="${currentPage == i}">
					<span style="font-weight:bold; color:orange;">${i}</span>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/testList?currentPage=${i}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${(lastPage-startPage) > 10}">
			<a href="${pageContext.request.contextPath}/testList?currentPage=${startPage+10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">▶</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/testList?currentPage=${lastPage}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">&#x23E9</a>
	</div>

</body>
</html>