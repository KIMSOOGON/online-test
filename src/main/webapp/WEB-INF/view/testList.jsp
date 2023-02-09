<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let thisTestLevel = $('#thisTestLevel').val();
		console.log(thisTestLevel);
		$('#testLevel').val(thisTestLevel).prop("selected",true);
	});
</script>
</head>
<body>
	<input type="hidden" id="thisTestLevel" value="${thisTestLevel}">
	
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
		<select id="testLevel" name="testLevel">
			<option value="" disabled selected>난이도</option>
			<option value="★">★</option>
			<option value="★★">★★</option>
			<option value="★★★">★★★</option>
			<option value="★★★★">★★★★</option>
			<option value="★★★★★">★★★★★</option>
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
				<script>
					$(document).ready(function(){
						$modal${t.testNo} = $('.modal${t.testNo}');
						$modal${t.testNo}.hide();
						$('.modal--open${t.testNo}').click(function(){
						  $modal${t.testNo}.show();
						  return false;
						});
						$('.modal--close${t.testNo}').click(function(){
						  $modal${t.testNo}.hide();
						});
					});
				</script>
					<td>
						<div class="container">
						  <button type="button" value="open" class="btn modal--open${t.testNo}">응시</button>
						</div>
				<div class="modal${t.testNo}">
				  <div class="screen">
				    <div class="layerpop">
				      <p class="layerpop__container">
				      난이도 : ${t.testLevel}<br>
						20문항 / 제한시간 : ${t.testTimer}분<br>
						<a href="${pageContext.request.contextPath}/student/examTest?testNo=${t.testNo}">문제풀기</a>
				      </p>
				      <button type="button" value="close" class="btn modal--close${t.testNo}">Close</button>
				    </div>
				  </div>
				</div>
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