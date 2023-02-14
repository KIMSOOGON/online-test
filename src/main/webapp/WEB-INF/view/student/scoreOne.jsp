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
</head>
<body>
	<h1>상세</h1>
	<div class="multi">
		<c:forEach var="p" items="${list}">
			<div>
				<!-- 문제 -->
				<c:if test="${p.exampleIdx == 1}">
					<div style="font-weight:bold;">
						${p.questionIdx}. ${p.questionTitle}
					</div>
				</c:if>
				<br>
				<!-- 선택지 -->
				<c:if test="${p.exampleIdx == 1}">
					<div>
						&nbsp;① ${p.exampleTitle}
						<c:if test="${p.exampleOx == '정답'}">
							정답
						</c:if>
					</div>
				</c:if>
				<c:if test="${p.exampleIdx == 2}">
					<div>
						&nbsp;② ${p.exampleTitle}
						<c:if test="${p.exampleOx == '정답'}">
							정답
						</c:if>
					</div>
				</c:if>
				<c:if test="${p.exampleIdx == 3}">
					<div>
						&nbsp;③ ${p.exampleTitle}
						<c:if test="${p.exampleOx == '정답'}">
							정답
						</c:if>
					</div>
				</c:if>
				<c:if test="${p.exampleIdx == 4}">
					<div>
						&nbsp;④ ${p.exampleTitle}
						<c:if test="${p.exampleOx == '정답'}">
							정답
						</c:if>
					</div>
					<br>
				</c:if>
			</div>
		</c:forEach>

	</div>
</body>
</html>