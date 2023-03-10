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
			// test?????????, ????????? ??? ???????????? ????????????
			let thisTestLevel = $('#thisTestLevel').val();
			console.log(thisTestLevel);
			$('#testLevel').val(thisTestLevel).prop("selected",true);
			let thisTestTimer = $('#thisTestTimer').val();
			console.log(thisTestTimer);
			$('#testTimer').val(thisTestTimer).prop("selected",true);
			
			// ???????????????, ???????????????
			$('#addBtn').click(function() {
				// ???????????? ????????? ??????
				if($('#questionNo').val() == '') {
					$('#questionNoMsg').text('??????????????? ???????????????');
					$('#questionNo').focus();
					return;
				} else {
					$('#questionNoMsg').text('');
				}
				
				// ???????????? ????????? ??????
				if($('#questionTitle').val() == '') {
					$('#questionTitleMsg').text('??????????????? ???????????????');
					$('#questionTitle').focus();
					return;
				} else {
					$('#questionTitleMsg').text('');
				}
				
				// ????????? ????????? ??????
				if($('#example1').val() == '') {
					$('#example1Msg').text('1??? ????????? ???????????????');
					$('#example1').focus();
					return;
				} else {
					$('#example1Msg').text('');
				}
				if($('#example2').val() == '') {
					$('#example2Msg').text('2??? ????????? ???????????????');
					$('#example2').focus();
					return;
				} else {
					$('#example2Msg').text('');
				}
				if($('#example3').val() == '') {
					$('#example3Msg').text('3??? ????????? ???????????????');
					$('#example3').focus();
					return;
				} else {
					$('#example3Msg').text('');
				}
				if($('#example4').val() == '') {
					$('#example4Msg').text('4??? ????????? ???????????????');
					$('#example4').focus();
					return;
				} else {
					$('#example4Msg').text('');
				}
				
				// ???????????? radio ?????????
				if($('.exampleOx:checked').length < 1) {
					$('#exampleOxMsg').text('????????? ??????????????????');
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
					
					<!-- ???????????? -->
                    <div class="pcoded-content">
                        <!-- Page-header start -->
                        <div class="page-header">
                            <div class="page-block">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <div class="page-header-title">
                                            <h5 class="m-b-10">${thisTest.testTitle}</h5>
                                            <p class="m-b-0">
												????????? : ${thisTest.testLevel} / 
												???????????? : ${thisTest.testTimer}
												<br>${thisTest.testDate}
												<br><a href="#ex1" rel="modal:open" class="btn btn-sm btn-warning text-dark mt-3">??????</a>
                                            </p>
                                        </div>
                                        <!-- test ??????/?????????/???????????? ?????? ????????? -->
										<div id="ex1" class="modal">
											<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
												<p>
													??????
													<input type="hidden" name="testNo" value="${thisTest.testNo}">
													<input type="text" name="testTitle" value="${thisTest.testTitle}" class="mt-4">
													<br>
													<div>
														????????????
														<input type="date" name="testDate" value="${thisTest.testDate}" class="my-2 ml-2">
													</div>
												 	<div>
														?????????
														<select id="testLevel" name="testLevel" class="mt-1 ml-2">
															<option value="???">???</option>
															<option value="??????">??????</option>
															<option value="?????????">?????????</option>
															<option value="????????????">????????????</option>
															<option value="???????????????">???????????????</option>
														</select>
													</div>
													<br>
													<div>
														????????????
														<select id="testTimer" name="testTimer" class="mt-1 ml-2">
															<option value="20">20???</option>
															<option value="30">30???</option>
															<option value="40">40???</option>
															<option value="60">60???</option>
															<option value="90">90???</option>
															<option value="120">120???</option>
														</select>
													</div>
												</p>
												<button type="submit" class="mt-1 ml-2 btn btn-sm btn-warning text-dark">??????</button>
											</form>
											<a href="#" rel="modal:close" class="btn btn-sm btn-outline-dark" style="float:right">??????</a>
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
                        
						<!-- ???????????? -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                    
                                        <!-- ?????????????????? -->
                                        <div class="card">
                                            <div class="card-header">
												<h5>?????? ??????</h5>
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
															<!-- ?????? -->
															<tr>
																<th style="width:100px;">????????????</th>
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
																	<textarea id="questionTitle" rows="5" cols="80" name="questionTitle" placeholder="????????? ???????????????"></textarea>
																	<small id="questionTitleMsg"></small>
																</td>
															</tr>
														</table>
														<!-- ????????? ?????? -->
														<table class="table table-hover">
															<tr>
																<th style="width:35px;">???</th>
																<td>
																	<input id="example1" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="1??? ????????? ?????? ???????????????">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="1">
																	<input type="radio" class="exampleOx" name="exampleOx" value="1">
																	<small id="example1Msg"></small> 
																</td>
															</tr>
															<tr>
																<th>???</th>
																<td>
																	<input id="example2" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="2??? ????????? ?????? ???????????????">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="2">
																	<input type="radio" class="exampleOx" name="exampleOx" value="2">
																	<small id="example2Msg"></small>
																</td>
															</tr>
															<tr>
																<th>???</th>
																<td>
																	<input id="example3" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="3??? ????????? ?????? ???????????????">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="3">
																	<input type="radio" class="exampleOx" name="exampleOx" value="3">
																	<small id="example3Msg"></small>
																</td>
															</tr>
															<tr>
																<th>???</th>
																<td>
																	<input id="example4" type="text" class="exampleTitle" name="exampleTitle" style="width:350px; margin-right:20px;" placeholder="4??? ????????? ?????? ???????????????">
																	<input type="hidden" class="exampleIdx" name="exampleIdx" value="4">
																	<input type="radio" class="exampleOx" name="exampleOx" value="4">
																	<small id="example4Msg"></small>
																</td>
															</tr>
														</table>
														<small id="exampleOxMsg"></small>
														<input type="hidden" name="testNo" value="${thisTest.testNo}">
														<div class="text-center">
															<button id="addBtn" type="button" class="btn btn-sm btn-outline-primary mt-3">??????</button>
														</div>
													</form>
												</div>
											</div>
										</div>
											
										<!-- ???????????? ?????? -->
										<div class="card">
											<div class="card-header">
												<h5>?????? ??????</h5>
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
																<!-- ?????? -->
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
																<!-- ????????? -->
																<c:if test="${q.exampleIdx == 1}">
																	<div>
																		&nbsp;??? ${q.exampleTitle}
																	</div>
																</c:if>
																<c:if test="${q.exampleIdx == 2}">
																	<div>
																		&nbsp;??? ${q.exampleTitle}
																	</div>
																</c:if>
																<c:if test="${q.exampleIdx == 3}">
																	<div>
																		&nbsp;??? ${q.exampleTitle}
																	</div>
																</c:if>
																<c:if test="${q.exampleIdx == 4}">
																	<div>
																		&nbsp;??? ${q.exampleTitle}
																	</div>
																	<br>
																</c:if>
															</div>
														</c:forEach>
														<c:if test="${answerList != '[]'}">
															<h4 class="text-center">< ????????? ></h4>
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