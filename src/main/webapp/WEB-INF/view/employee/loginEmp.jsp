<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		small {
			color:red;
		}
	</style>
	<title>LOG - IN</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
	<meta name="author" content="Codedthemes" />
	<!-- Favicon icon -->
	
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
	<!-- Google font-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
	<!-- Required Fremwork -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.min.css">
	<!-- waves.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/pages/waves/css/waves.min.css" type="text/css" media="all">
	<!-- themify-icons line icon -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/icon/themify-icons/themify-icons.css">
	<!-- ico font -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/icon/icofont/css/icofont.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/icon/font-awesome/css/font-awesome.min.css">
	<!-- Style.css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- J-Query -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	    $(document).ready(function() {
			// 유효성검사
			$('#loginBtn').click(function(){
				// 아이디 유효성 체크
				if($('#id').val() == '') {
					$('#idMsg').text('아이디를 입력해주세요');
					$('#id').focus();
					return;
				} else {
					$('#idMsg').text('');
				}
				// 패스워드 유효성 체크
				if($('#pw').val() == '') {
					$('#pwMsg').text('패스워드를 입력해주세요');
					$('#pw').focus();
					return;
				} else {
					$('pwMsg').text('');
				}
				
				$('#loginForm').submit();
			});
		});
    </script>
</head>
<body themebg-pattern="theme1">	
	<section class="login-block">
		<!-- Container-fluid starts -->
        <div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->
					<form id="loginForm" action="${pageContext.request.contextPath}/loginEmp" method="post" class="md-float-material form-material">
						<div class="text-center">
						    <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo.png">
						</div>
						<div class="auth-box card">
						    <div class="card-block">
						        <div class="row m-b-20">
						            <div class="col-md-12">
						                <h3 class="text-center">L O G - I N</h3>
						                <p class="text-center text-success">직원 로그인
						                	<a style="float:left; background-color:#FFDEA9;" href="${pageContext.request.contextPath}/loginTeacher" class="btn btn-sm">강사</a>
						                	<a style="float:right; background-color:#FFDEA9;" href="${pageContext.request.contextPath}/loginStudent" class="btn btn-sm">학생</a>
						                </p>
						            </div>
						        </div>		
						        <!-- 아이디 -->				        
						        <div class="form-group form-primary">
						            <input id="id" type="text" name="empId" class="form-control" value="admin1" placeholder="Your Id">
						            <span class="form-bar"></span>
						            <label class="float-label"></label>
						            <small id="idMsg"></small>
						        </div>
						        <!-- 패스워드 -->
						        <div class="form-group form-primary">
						            <input id="pw" type="password" name="empPw" class="form-control" value="1234" placeholder="Password">
						            <span class="form-bar"></span>
						            <label class="float-label"></label>
						            <small id="pwMsg"></small>
						        </div>
						        <!-- 로그인 실패시 문구출력 -->
						        <c:if test="${failLogin == 'failLogin'}">
						        		<small>존재하지않는 아이디이거나 패스워드가 일치하지 않습니다.</small>
						        </c:if>
						        <div class="row m-t-30">
						            <div class="col-md-12">
						                <button id="loginBtn" type="button" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">LOG - IN</button>
						            </div>
						        </div>
						        <hr/>
						        <div class="row">
						            <div class="col-md-10">
						                <p class="text-inverse text-left m-b-0">Thank you.</p>
						                <p class="text-inverse text-left"><a href="${pageContext.request.contextPath}/Home"><b>Back to website</b></a></p>
									</div>
									<div class="col-md-2">
										<img src="${pageContext.request.contextPath}/resources/images/auth/Logo-small-bottom.png" alt="small-logo.png">
									</div>
								</div>
					        </div>
					    </div>
					</form>
                    <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js "></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/popper.js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script src="${pageContext.request.contextPath}/resources/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common-pages.js"></script>
</body>
</html>