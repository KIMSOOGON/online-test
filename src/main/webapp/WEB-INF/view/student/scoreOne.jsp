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
	.self_check {
		display: block;
		padding: 5px;
		position: relative;
		padding-left: 20px;
		cursor:pointer;
	}
	.self_check input {
		display: none;
	}
	.self_check span {
		border: 1px solid #ccc;
		width: 15px; height: 15px;
		position: absolute;
		overflow: hidden; line-height: 1;
		text-align: center;
		border-radius: 100%;
		font-size: 10pt;
		left: 0;
		top: 50%;
		margin-top: -7.5px;
	}
	.self_check input:checked + span {
		background: #f8415c;
		border-color: #f8415c;
		color: #ffffff;
	}
	label {
		font-size: 15px;
	}
	</style>
</head>
<body>
	<h1>${scoreOne.testTitle}</h1>
	<p>
		응시날짜 : ${scoreOne.scoreDate} <br>
		응시자 : ${scoreOne.studentName} <br>
		시험난이도 : ${scoreOne.testLevel} <br>
		내 점수 : ${scoreOne.score} / 100
	</p>
	<div class="multi">
		<c:forEach var="p" items="${list}">
			<div>
				<!-- 문제 -->
				<c:if test="${p.exampleIdx == 1}">
					<c:if test="${p.answerOx == '정답'}">
						<div style="position: relative">
							<img class="d-flex align-self-center img-radius" src="${pageContext.request.contextPath}/resources/images/correct1.png" alt="Generic placeholder image">
						</div>
					</c:if>
					
					<c:if test="${p.answerOx == '오답'}">
						<div style="position:relative">
							<img class="d-flex align-self-center img-radius" src="${pageContext.request.contextPath}/resources/images/incorrect.png" alt="Generic placeholder image">
							<span style="position: relative; left: 60px; color: red;">내가 선택한 답 : ${p.answer}</span>
						</div>
					</c:if>
					
					<div style="font-weight:bold; position: relative; left:30px; top: -80px;">
						${p.questionIdx}. ${p.questionTitle}
					</div>
				</c:if>
				
				<!-- 선택지 -->
				<c:if test="${p.exampleIdx == 1}">
					<div style="margin-left:15px;">
						<c:if test="${p.exampleOx == '정답'}">
							<label class="self_check">
								<input type="radio" checked="checked">
								<span>1</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
						<c:if test="${p.exampleOx == '오답'}">
							<label class="self_check">
								<input type="radio" disabled="disabled">
								<span>1</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
					</div>
				</c:if>
				<c:if test="${p.exampleIdx == 2}">
					<div style="margin-left:15px;">
						<c:if test="${p.exampleOx == '정답'}">
							<label class="self_check">
								<input type="radio" checked="checked">
								<span>2</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
						<c:if test="${p.exampleOx == '오답'}">
							<label class="self_check">
								<input type="radio" disabled="disabled">
								<span>2</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
					</div>
				</c:if>
				<c:if test="${p.exampleIdx == 3}">
					<div style="margin-left:15px;">
						<c:if test="${p.exampleOx == '정답'}">
							<label class="self_check">
								<input type="radio" checked="checked">
								<span>3</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
						<c:if test="${p.exampleOx == '오답'}">
							<label class="self_check">
								<input type="radio" disabled="disabled">
								<span>3</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
					</div>
				</c:if>
				<c:if test="${p.exampleIdx == 4}">
					<div style="margin-left:15px;">
						<c:if test="${p.exampleOx == '정답'}">
							<label class="self_check">
								<input type="radio" checked="checked">
								<span>4</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
						<c:if test="${p.exampleOx == '오답'}">
							<label class="self_check">
								<input type="radio" disabled="disabled">
								<span>4</span>
								&nbsp; ${p.exampleTitle}
							</label>
						</c:if>
					</div>
					<br>
				</c:if>
			</div>
		</c:forEach>

	</div>
</body>
</html>