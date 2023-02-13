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
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			// 문제수정시, 유효성체크
			$('#modifyBtn').click(function() {				
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
				
				$('#modifyForm').submit();	
			});
		});
	</script>
    
    <style>
    	textarea {
    		margin-left:25px;
    	}
    	input {
    		margin-left:25px;
    		margin-right:25px;
    	}
    	small {
    		color:red;
    	}
    </style>
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
                                            <h5 class="m-b-10">문제 수정</h5>
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
                                    	<!-- 문제수정하기 -->
                                        <div class="card">
                                            <div class="card-header">
												<h5>문제 수정</h5>
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
													<form id="modifyForm" action="${pageContext.request.contextPath}/teacher/modifyQuestion" method="post">
														<c:forEach var="q" items="${list}">
															<c:if test="${q.exampleIdx == 1}">
																<div>
																	${q.questionIdx}.
																	<textarea id="questionTitle" rows="5" cols="80" name="questionTitle">${q.questionTitle}</textarea>
																 	<small id="questionTitleMsg"></small>
																 	<input type="hidden" name="questionNo" value="${q.questionNo}">
																 	<input type="hidden" name="testNo" value="${q.testNo}">
																 </div>
															</c:if>
															<br>
															<!-- 선택지 -->
															<c:if test="${q.exampleIdx == 1}">
																<div>
																	&nbsp;① 
																	<input id="example1" type="text" name="exampleTitle" value="${q.exampleTitle}">
																	<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																	<c:if test="${q.exampleOx == '정답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="1" checked>
																	</c:if>
																	<c:if test="${q.exampleOx == '오답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="1">
																	</c:if>
																	<small id="example1Msg"></small>
																</div>
															</c:if>
															<c:if test="${q.exampleIdx == 2}">
																<div>
																	&nbsp;②
																	<input id="example2" type="text" name="exampleTitle" value="${q.exampleTitle}">
																	<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																	<c:if test="${q.exampleOx == '정답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="2" checked>
																	</c:if>
																	<c:if test="${q.exampleOx == '오답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="2">
																	</c:if>
																	<small id="example2Msg"></small>
																</div>
															</c:if>
															<c:if test="${q.exampleIdx == 3}">
																<div>
																	&nbsp;③ 
																	<input id="example3" type="text" name="exampleTitle" value="${q.exampleTitle}">
																	<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																	<c:if test="${q.exampleOx == '정답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="3" checked>
																	</c:if>
																	<c:if test="${q.exampleOx == '오답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="3">
																	</c:if>
																	<small id="example3Msg"></small>
																</div>
															</c:if>
															<c:if test="${q.exampleIdx == 4}">
																<div>
																	&nbsp;④ 
																	<input id="example4" type="text" name="exampleTitle" value="${q.exampleTitle}">
																	<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																	<c:if test="${q.exampleOx == '정답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="4" checked>
																	</c:if>
																	<c:if test="${q.exampleOx == '오답'}">
																		<input class="exampleOx" type="radio" name="exampleOx" value="4">
																	</c:if>
																	<small id="example4Msg"></small>
																</div>
																<br>
															</c:if>
														</c:forEach>
														<small id="exampleOxMsg"></small>
														<button id="modifyBtn" type="button" class="btn btn-sm btn-warning text-dark"><i class="ti-marker-alt"></i>수정</button>
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