<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.multi{
		column-count:2;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
	$(document).ready(function(){
		let thisTestLevel = $('#thisTestLevel').val();
		console.log(thisTestLevel);
		$('#testLevel').val(thisTestLevel).prop("selected",true);
		let thisTestTimer = $('#thisTestTimer').val();
		console.log(thisTestTimer);
		$('#testTimer').val(thisTestTimer).prop("selected",true);
	});
</script>
</head>
<body>
	<c:if test="${loginTeacher != null}">
		<div>
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</div>
	</c:if>
	<input type="hidden" id="thisTestLevel" value="${thisTest.testLevel}">
	<input type="hidden" id="thisTestTimer" value="${thisTest.testTimer}">
	
	<!-- test 제목/난이도/제한시간 수정 모달창 -->
	<div id="ex1" class="modal">
	<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
	  <p>수정
	  	<input type="hidden" name="testNo" value="${thisTest.testNo}">
	  	<input type="text" name="testTitle" value="${thisTest.testTitle}"><br>
	  	<div>
			난이도
			<select id="testLevel" name="testLevel">
				<option value="★">★</option>
				<option value="★★">★★</option>
				<option value="★★★">★★★</option>
				<option value="★★★★">★★★★</option>
				<option value="★★★★★">★★★★★</option>
			</select>
		</div>
		<div>
			제한시간
			<select id="testTimer" name="testTimer">
				<option value="20">20분</option>
				<option value="30">30분</option>
				<option value="40">40분</option>
				<option value="60">60분</option>
				<option value="90">90분</option>
				<option value="120">120분</option>
			</select>
		</div>
	  </p>
	  <button type="submit">수정</button>
  </form>
  <a href="#" rel="modal:close">닫기</a>
</div>

	<h1>${thisTest.testTitle}</h1>
	<p>
		난이도 : ${thisTest.testLevel} / 
		제한시간 : ${thisTest.testTimer}
		<br>${thisTest.testDate}
		<br><a href="#ex1" rel="modal:open">수정</a>
	</p>
	
	<!-- 문제추가 (모달로 교체예정) -->
	<form action="${pageContext.request.contextPath}/teacher/addQuestionExample" method="post">
		<h5>====문제추가====</h5>
		<table>
			<!-- 문제 -->
			<tr>
				<th>Question Number.</th>
				<td><input type="number" name="questionIdx"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="5" cols="50" name="questionTitle" placeholder="문제를 입력하세요"></textarea>
				</td>
			</tr>
		</table>
		<!-- 선택지 항목 -->
		<table>
			<tr>
				<th>①</th>
				<td>
					<input type="text" class="exampleTitle" name="exampleTitle" style="width:350px" placeholder="답을 입력하세요">
					<input type="hidden" class="exampleIdx" name="exampleIdx" value="1">
					<input type="radio" class="exampleOx" name="exampleOx" value="1"> 
				</td>
			</tr>
			<tr>
				<th>②</th>
				<td>
					<input type="text" class="exampleTitle" name="exampleTitle" style="width:350px" placeholder="답을 입력하세요">
					<input type="hidden" class="exampleIdx" name="exampleIdx" value="2">
					<input type="radio" class="exampleOx" name="exampleOx" value="2">
				</td>
			</tr>
			<tr>
				<th>③</th>
				<td>
					<input type="text" class="exampleTitle" name="exampleTitle" style="width:350px" placeholder="답을 입력하세요">
					<input type="hidden" class="exampleIdx" name="exampleIdx" value="3">
					<input type="radio" class="exampleOx" name="exampleOx" value="3">
				</td>
			</tr>
			<tr>
				<th>④</th>
				<td>
					<input type="text" class="exampleTitle" name="exampleTitle" style="width:350px" placeholder="답을 입력하세요">
					<input type="hidden" class="exampleIdx" name="exampleIdx" value="4">
					<input type="radio" class="exampleOx" name="exampleOx" value="4">
				</td>
			</tr>
		</table>
		<input type="hidden" name="testNo" value="${thisTest.testNo}">
		<button type="submit">등록</button>
	</form>
	<hr>
	<!-- 문제목록 (5,10,20 문항 한정 추후 구현예정) -->
	<h5>======문제목록=========</h5>
	<div class="multi">
		<c:forEach var="q" items="${list}">
			<div>
				<!-- 문제 -->
				<c:if test="${q.exampleIdx == 1}">
					<div style="font-weight:bold;">
						${q.questionIdx}. ${q.questionTitle}
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/teacher/modifyQuestion?questionNo=${q.questionNo}&testNo=${thisTest.testNo}">수정</a>
						<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${q.questionNo}&testNo=${thisTest.testNo}">삭제</a>
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
			</div>
		</c:forEach>
	</div>
	<!-- 문제 답지 하단에 출력 -->
	<h5>=========답지===========</h5>
	<c:forEach var="a" items="${answerList}">
		<span>${a.questionIdx}) </span>
		<span style="font-weight:bold; color:red;">${a.exampleIdx}</span>
	</c:forEach>
</body>
</html>