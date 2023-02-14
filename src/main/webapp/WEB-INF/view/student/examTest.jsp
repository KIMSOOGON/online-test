<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${thisTest.testTitle}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.min.css">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<c:forEach var="q" items="${list}">
	<c:if test="${q.exampleIdx == 1}">
		<script>
			$(document).ready(function(){
				$('#examBtn').click(function() {
					// input answer value에 checked된 value값 대입하여 배열로 넘겨주기
					if($('input[name=answer${q.questionIdx}]').is(':checked')) {
						let exampleAnswer = $('input[name=answer${q.questionIdx}]:checked').val();
						// alert(exampleAnswer);
						// console.log(exampleAnswer);
						$('#answer${q.questionIdx}').val(exampleAnswer);
						
					}
					$('#examForm').submit();
				});
			});
		
		</script>
	</c:if>
</c:forEach>
</head>
<body>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<!-- Top Menu Bar include -->
			<div>
				<c:import url="/WEB-INF/view/inc/topMenu.jsp"></c:import>
			</div>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper"> 
					<!-- Side Menu Bar include -->
					<div>
						<c:import url="/WEB-INF/view/inc/sideMenu.jsp"></c:import>
					</div>
					
					<!-- 메인화면 -->
                    <div class="pcoded-content">
                        <!-- Page-header start -->
                        <div class="page-header">
                            <div class="page-block">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <div class="page-header-title">
                                            <h5 class="m-b-10">${thisTest.testTitle}</h5>
                                            <p class="m-b-0">
												난이도 : ${thisTest.testLevel} / 
												제한시간 : ${thisTest.testTimer}
												<br>${thisTest.testDate}
                                            </p>
										</div>
									</div>
									<div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="index.html"> <i class="fa fa-home"></i> </a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">Home</a>
                                            </li>
                                        </ul>
                                    </div>
								</div>
							</div>
						</div>
						
						<!-- 문제추가 -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                    
                                        <!-- 문제추가하기 -->
                                        <div class="card">
                                            <div class="card-header">
												<h5>${thisTest.testTitle}</h5>
												<div class="card-header-right">
                                                    <ul class="list-unstyled card-option">
                                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                        <li><i class="fa fa-window-maximize full-card"></i></li>
                                                        <li><i class="fa fa-minus minimize-card"></i></li>
                                                        <li><i class="fa fa-refresh reload-card"></i></li>
                                                        <li><i class="fa fa-trash close-card"></i></li>
                                                    </ul>
                                                </div>
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<!-- 시험지 -->
													<form id="examForm" action="${pageContext.request.contextPath}/student/addPaper" method="post">
														<div class="multi">
															<input type="hidden" name="testNo" value="${thisTest.testNo}"> <!-- 응시시험번호 -->
															<input type="hidden" name="studentNo" value="${loginStudent.studentNo}"> <!-- 응시학생번호 -->
															<c:forEach var="q" items="${list}">
																<div>
																	<!-- 문제 -->
																	<c:if test="${q.exampleIdx == 1}">
																		<div style="font-weight:bold; font-size:18px;">
																			${q.questionIdx}. ${q.questionTitle}
																		</div>
																		<!-- 문제 고유번호(questionNo) + 선택한 답안(answer) 히든처리하여 컨트롤러로 넘겨주기  -->
																		<input type="hidden" name="questionNo" value="${q.questionNo}">
																		<!-- 정답 미선택 제출시, value 0 오답처리 -->
																		<input type="hidden" id="answer${q.questionIdx}" name="answer" value="0">
																	</c:if>
																	<br>
																	<!-- 선택지 -->
																	<c:if test="${q.exampleIdx == 1}">
																		<div>
																		<label class="self_check">
																			<input type="radio" class="answer${q.questionIdx}" name="answer${q.questionIdx}" value="1">
																			<span>1</span>
																			&nbsp; ${q.exampleTitle}
																		</label>
																		</div>
																	</c:if>
																	<c:if test="${q.exampleIdx == 2}">
																		<div>
																		<label class="self_check">
																			<input type="radio" class="answer${q.questionIdx}" name="answer${q.questionIdx}" value="2">
																			<span>2</span>
																			&nbsp; ${q.exampleTitle}
																		</label>
																		</div>
																		
																	</c:if>
																	<c:if test="${q.exampleIdx == 3}">
																		<div>
																		<label class="self_check">
																			<input type="radio" class="answer${q.questionIdx}" name="answer${q.questionIdx}" value="3">
																			<span>3</span>
																			&nbsp; ${q.exampleTitle}
																		</label>
																		</div>
																	</c:if>
																	<c:if test="${q.exampleIdx == 4}">
																		<div>
																		<label class="self_check">
																			<input type="radio" class="answer${q.questionIdx}" name="answer${q.questionIdx}" value="4">
																			<span>4</span>
																			&nbsp; ${q.exampleTitle}
																		</label>
																		</div>
																		<br><br>
																	</c:if>
																</div>
																
															</c:forEach>
														</div>
														<div class="text-right mr-5">
															<button class="btn mr-5 border-secondary" style="background-color:#CEFBC9;" type="button" id="examBtn">제출하기</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Required Jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="${pageContext.request.contextPath}/resources/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- slimscroll js -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.mCustomScrollbar.concat.min.js "></script>

    <!-- menu js -->
    <script src="${pageContext.request.contextPath}/resources/js/pcoded.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vertical/vertical-layout.min.js "></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/script.js "></script>
</body>
</html>