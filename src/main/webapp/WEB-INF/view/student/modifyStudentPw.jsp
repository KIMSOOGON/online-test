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
    <!-- J-Query -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	    $(document).ready(function() {
	    	// 비밀번호 정규식
	    	let reg_pw = /(?=.*[a-zA-ZS])(?=.*?[0-9])(?=.*?[~!@#$%^&*_-]).{8,16}$/;
	    	
			// 유효성검사
			$('#modifyBtn').click(function(){
				// 기존 비밀번호 유효성 체크
				if($('#oldPw').val() == '') {
					$('#oldPwMsg').text('기존 비밀번호를 입력하세요');
					$('#oldPw').focus();
					return;
				} else {
					$('#oldPwMsg').text('');
				}
				
				// 패스워드 유효성 체크
				if(!reg_pw.test($('#newPw').val())) {
					$('#newPwMsg').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
					$('#newPw').focus();
					return;
				} else {
					$('newPwMsg').text('');
				}
				
				// 패스워드확인 유효성 검사
				if($('#newPwCk').val() != $('#newPw').val()) {
					$('#newPwCkMsg').text('새 비밀번호가 일치하지 않습니다.');
					return;
				} else {
					$('#newPwCkMsg').text('');
					pwCkCk = true;
				}
				
				$('#modifyForm').submit();
			});
		});
    </script>
    <style>
		small {
			color:red;
			margin-left:20px;
		}
	</style>
</head>
<body>
	<!-- 기존비밀번호 오입력일경우, alert문구출력 -->
	<c:if test="${wrongStuPw eq 'wrongPw'}">
		<script>
			alert('기존 비밀번호가 일치하지 않습니다.');
		</script>
	</c:if>
	
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
											<h5 class="m-b-10">${loginStudent.studentName}님 비밀번호 수정</h5>
											<p class="m-b-0">
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
						
						<!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
                                    <div class="page-body">
                                        <!-- Hover table card start -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h5>${loginStudent.studentName}님 비밀번호 수정</h5>
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
													<form id="modifyForm" action="${pageContext.request.contextPath}/student/modifyStudentPw" method="post">
														<table class="table table-hover">
															<tr>
																<td>기존 비밀번호</td>
																<td>
																	<input id="oldPw" type="password" name="oldPw">
																	<small id="oldPwMsg"></small>
																</td>
															</tr>
															<tr>
																<td>새로운 비밀번호</td>
																<td>
																	<input id="newPw" type="password" name="newPw">
																	<small id="newPwMsg"></small>
																</td>
															</tr>
															<tr>
																<td>새로운 비밀번호 확인</td>
																<td>
																	<input id="newPwCk" type="password">
																	<small id="newPwCkMsg"></small>
																</td>
															</tr>
														</table>
														<div class="text-center mt-4">
															<button type="button" id="modifyBtn" class="btn btn-sm" style="background-color:#CEF279">수정</button>
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