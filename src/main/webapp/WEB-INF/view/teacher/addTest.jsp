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
			// 유효성검사
			$('#addBtn').click(function(){
				// 아이디 유효성 체크
				if($('#title').val() == '') {
					$('#titleMsg').text('시험명을 입력해주세요.');
					$('#title').focus();
					return;
				} else {
					$('#titleMsg').text('');
				}				
				$('#addForm').submit();
			});
		});
    </script>
    <style>
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
											<h5 class="m-b-10">강사 목록</h5>
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
                                                <h5>시험 등록</h5>
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
                                                <form id="addForm" action="${pageContext.request.contextPath}/teacher/addTest" method="post">
													<div>
														난이도
														<select name="testLevel" class="my-2 ml-2">
															<option value="★">★</option>
															<option value="★★">★★</option>
															<option value="★★★">★★★</option>
															<option value="★★★★">★★★★</option>
															<option value="★★★★★">★★★★★</option>
														</select>
													</div>
													<div>
														제한시간
														<select name="testTimer" class="my-2 ml-2">
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="60">60분</option>
															<option value="90">90분</option>
															<option value="120">120분</option>
														</select>
													</div>
													<div>
														시험제목
														<input class="my-2 ml-2" id="title" type="text" name="testTitle" placeholder="등록할 시험을 입력하세요." style="width:400px;">
														<small id="titleMsg"></small>														
													</div>
													<br>
													<div class="text-center">
														<button id="addBtn" type="button" class="ml-2 btn btn-sm" style="background-color:#FFCCDD">등록</button>
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