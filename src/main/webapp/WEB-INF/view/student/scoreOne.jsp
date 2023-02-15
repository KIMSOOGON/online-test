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
                                            <h5 class="m-b-10">${scoreOne.testTitle}</h5>
                                            <p class="m-b-0">
												응시날짜 : ${scoreOne.scoreDate} / 
												응시자 : ${scoreOne.studentName}<br>
												시험난이도 : ${scoreOne.testLevel}<br>
												내 점수 : ${scoreOne.score} / 100
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
						
						<!-- 채점확인 -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
										<!-- 문제목록 출력 -->
										<div class="card">
											<div class="card-header">
												<h5>${scoreOne.testTitle}</h5>
												<div class="text-center">
												<span>내 점수 : <big style="color:red; font-size:30px; margin-left:10px;">${scoreOne.score}</big> / 100</span>
												</div>
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
																			<span style="position: relative; left: 60px; color: #003399;">나의 답 : <big style="font-size:20px; color:red;">${p.answer}</big></span>
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