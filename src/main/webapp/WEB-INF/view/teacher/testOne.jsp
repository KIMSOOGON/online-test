<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
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
		small {
			color:red;
			margin-left:20px;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			// test수정시, 난이도 및 풀이시간 동적처리
			let thisTestLevel = $('#thisTestLevel').val();
			console.log(thisTestLevel);
			$('#testLevel').val(thisTestLevel).prop("selected",true);
			let thisTestTimer = $('#thisTestTimer').val();
			console.log(thisTestTimer);
			$('#testTimer').val(thisTestTimer).prop("selected",true);
			
			// 문제추가시, 유효성체크
			$('#addBtn').click(function() {
				// 문제번호 유효성 체크
				if($('#questionNo').val() == '') {
					$('#questionNoMsg').text('문제번호를 입력하세요');
					$('#questionNo').focus();
					return;
				} else {
					$('#questionNoMsg').text('');
				}
				
				// 문제제목 유효성 체크
				if($('#questionTitle').val() == '') {
					$('#questionTitleMsg').text('문제내용을 입력하세요');
					$('#questionTitle').focus();
					return;
				} else {
					$('#questionTitleMsg').text('');
				}
				
				// 선택지 유효성 체크
				if($('#example1').val() == '') {
					$('#example1Msg').text('1번 보기를 입력하세요');
					$('#example1').focus();
					return;
				} else {
					$('#example1Msg').text('');
				}
				if($('#example2').val() == '') {
					$('#example2Msg').text('2번 보기를 입력하세요');
					$('#example2').focus();
					return;
				} else {
					$('#example2Msg').text('');
				}
				if($('#example3').val() == '') {
					$('#example3Msg').text('3번 보기를 입력하세요');
					$('#example3').focus();
					return;
				} else {
					$('#example3Msg').text('');
				}
				if($('#example4').val() == '') {
					$('#example4Msg').text('4번 보기를 입력하세요');
					$('#example4').focus();
					return;
				} else {
					$('#example4Msg').text('');
				}
				
				// 정답체크 radio 유효성
				if($('.exampleOx:checked').length < 1) {
					$('#exampleOxMsg').text('정답을 선택해주세요');
					return;
				} else {
					$('#exampleOxMsg').text('');
				}
				
				$('#addForm').submit();	
			});
		});
	</script>
</head>
<body>

	<input type="hidden" id="thisTestLevel" value="${thisTest.testLevel}">
	<input type="hidden" id="thisTestTimer" value="${thisTest.testTimer}">
	
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
												<br><a href="#ex1" rel="modal:open" class="btn btn-sm btn-warning text-dark mt-3">수정</a>
                                            </p>
                                        </div>
                                        <!-- test 제목/난이도/제한시간 수정 모달창 -->
										<div id="ex1" class="modal">
											<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
												<p>
													제목
													<input type="hidden" name="testNo" value="${thisTest.testNo}">
													<input type="text" name="testTitle" value="${thisTest.testTitle}" class="mt-4">
													<br>
													<div>
														출제날짜
														<input type="date" name="testDate" value="${thisTest.testDate}" class="my-2 ml-2">
													</div>
												 	<div>
														난이도
														<select id="testLevel" name="testLevel" class="mt-1 ml-2">
															<option value="★">★</option>
															<option value="★★">★★</option>
															<option value="★★★">★★★</option>
															<option value="★★★★">★★★★</option>
															<option value="★★★★★">★★★★★</option>
														</select>
													</div>
													<br>
													<div>
														제한시간
														<select id="testTimer" name="testTimer" class="mt-1 ml-2">
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="60">60분</option>
															<option value="90">90분</option>
															<option value="120">120분</option>
														</select>
													</div>
												</p>
												<button type="submit" class="mt-1 ml-2 btn btn-sm btn-warning text-dark">수정</button>
											</form>
											<a href="#" rel="modal:close" class="btn btn-sm btn-outline-dark" style="float:right">닫기</a>
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
												<h5>문제 추가</h5>
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
													<form id="addForm" action="${pageContext.request.contextPath}/teacher/addQuestionExample" method="post">
														<table class="table table-hover">
															<!-- 문제 -->
															<tr>
																<th style="width:100px;">문제번호</th>
																<td>
																	<c:if test="${latestQuestionNo != null}">
																		<input id="questionNo" style="width:70px;"type="number" name="questionIdx" value="${latestQuestionNo}">
																	</c:if>
																	<c:if test="${latestQuestionNo == null}">
																		<input id="questionNo" style="width:70px;"type="number" name="questionIdx">
																	</c:if>
																	<small id="questionNoMsg"></small>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<textarea id="questionTitle" rows="5" cols="80" name="questionTitle" placeholder="문제를 입력하세요"></textarea>
																	<small id="questionTitleMsg"></small>
																</td>
															</tr>
														</table>
														<!-- 선택지 항목 -->
														<table class="table table-hover">
															<tr>
																<th style="width:35px;">①</th>
																<td>
																	<input id="example1" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="1번 선택지 답을 입력하세요">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="1">
																	<input type="radio" class="exampleOx" name="exampleOx" value="1">
																	<small id="example1Msg"></small> 
																</td>
															</tr>
															<tr>
																<th>②</th>
																<td>
																	<input id="example2" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="2번 선택지 답을 입력하세요">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="2">
																	<input type="radio" class="exampleOx" name="exampleOx" value="2">
																	<small id="example2Msg"></small>
																</td>
															</tr>
															<tr>
																<th>③</th>
																<td>
																	<input id="example3" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="3번 선택지 답을 입력하세요">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="3">
																	<input type="radio" class="exampleOx" name="exampleOx" value="3">
																	<small id="example3Msg"></small>
																</td>
															</tr>
															<tr>
																<th>④</th>
																<td>
																	<input id="example4" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="4번 선택지 답을 입력하세요">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="4">
																	<input type="radio" class="exampleOx" name="exampleOx" value="4">
																	<small id="example4Msg"></small>
																</td>
															</tr>
														</table>
														<small id="exampleOxMsg"></small>
														<input type="hidden" name="testNo" value="${thisTest.testNo}">
														<div class="text-center">
															<button id="addBtn" type="button" class="btn btn-sm btn-outline-primary mt-3">등록</button>
														</div>
													</form>
												</div>
											</div>
										</div>
											
										<!-- 문제목록 출력 -->
										<div class="card">
											<div class="card-header">
												<h5>문제 목록</h5>
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
													<div class="multi">
														<c:forEach var="q" items="${list}">
															<div>
																<!-- 문제 -->
																<c:if test="${q.exampleIdx == 1}">
																	<div style="font-weight:bold; white-space:pre-line;">
																		${q.questionIdx}. ${q.questionTitle}
																	</div>
																	<div class="my-2 btn-group">
																		<small><a href="${pageContext.request.contextPath}/teacher/modifyQuestion?questionNo=${q.questionNo}&testNo=${thisTest.testNo}" class="btn btn-sm btn-outline-dark"><i class="ti-marker-alt"></i></a></small>
																		<small><a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${q.questionNo}&testNo=${thisTest.testNo}" class="btn btn-sm btn-outline-danger"><i class="ti-trash"></i></a></small>
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
														<c:if test="${answerList != '[]'}">
															<h4 class="text-center">< 정답지 ></h4>
														</c:if>
														<c:forEach var="a" items="${answerList}">
															<small class="text-dark">${a.questionIdx}) </small>&nbsp;
															<big style="font-weight:bold; color:red;">${a.exampleIdx}</big>
															&nbsp;&nbsp;&nbsp;
														</c:forEach>
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