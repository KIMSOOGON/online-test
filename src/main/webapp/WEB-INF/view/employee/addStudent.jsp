<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Student</title>
	<style>
		small {
			color:red;
		}
	</style>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body themebg-pattern="theme1">
	<section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
			<div class="row">
                <div class="col-sm-12">
                    <form id="addForm" action="${pageContext.request.contextPath}/employee/addStudent" method="post" class="md-float-material form-material">
                        <div class="text-center">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo.png">
                        </div>
                        <div class="auth-box card">
							<div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Add Student</h3>
                                    </div>
                                </div>
                                
                                <!-- ????????? -->
								<div class="row">
									<div class="col-sm-9">
										<div class="form-group form-primary">
		                                    <input type="text" name="studentId" id="id" class="form-control" readonly="readonly" placeholder="Choose Employee Id">
		                                    <span class="form-bar"></span>
										</div>
									</div>
	                                <!-- ???????????? -->
                                    <div class="col-sm-3">
                                    	<div class="form-group form-primary">
                                  		  <a href="#ex1" rel="modal:open" class="btn btn-sm btn-outline-success">????????????</a>
		                                    
										</div>
									</div>
                                </div>
								<!-- modal -->
								<div id="ex1" class="modal">
									<div class="form-group form-primary">
										<input type="text" id="checkId" placeholder="id" class="form-control" style="width:300px">
										<button class="mt-3 btn btn-sm btn-outline-primary" type="button" id="ckBtn">????????????</button>
										<a class="ml-3 mt-3 btn btn-outline-danger btn-sm" style="float:right" href="#" rel="modal:close" id="modalClose">??????</a>
									</div>
									<div>
										<small id="checkIdMsg"></small>
									</div>
								</div>
								
								<!-- ?????? -->
                                <div class="form-group form-primary">
                                    <input type="text" id="name" name="studentName" class="form-control">
                                    <span class="form-bar"></span>
                                    <label class="float-label">Student Name</label>
                                    <small id="nameMsg"></small>
                                </div>
                                
                                <!-- ???????????? -->
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" id="pw" name="studentPw" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">Password</label>
                                            <small id="pwMsg"></small>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" id="pwCk" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">Confirm Password</label>
                                            <small id="pwCkMsg"></small>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- ?????? -->
                                <div class="row m-t-25 text-left">
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" id="agreeBox">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">????????? ????????????.</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- ?????? -->
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button id="addBtn" type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Register</button>
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
<script>
	//?????????
	let reg_id = /^[a-z0-9]{4,12}$/;
	let reg_pw = /(?=.*[a-zA-ZS])(?=.*?[0-9])(?=.*?[~!@#$%^&*_-]).{8,16}$/;
	let reg_name = /^[???-???a-zA-Z]{1,15}$/;
	
	let idCk = false;
	let pwCk = false;
	let pwCkCk = false;
	let nameCk = false;
	
	// ????????? ????????? ?????? (???????????? ??????)
	$('#ckBtn').click(function(){
		if(!reg_id.test($('#checkId').val())) {
			$('#checkIdMsg').text('???????????? ?????????????????? ?????? 4~12????????? ???????????????.');
		} else {
			$('#checkIdMsg').text('');
			$.ajax({
				url:'idCheck'
				, type: 'get'
				, data: {id:$('#checkId').val()}
				, success:function(model){ // model : 'YES' / 'NO'
					if(model=='YES') {
						// ???????????? ?????????
						alert('??????????????? ??????????????????.');
						idCk = true;
						$('#id').val($('#checkId').val());
						$('#modalClose').get(0).click();
					} else {
						// ???????????? ????????? (?????????)
						alert('?????? ??????????????? ???????????? ??????????????????.');
						$('#id').val('');
						$('#modalClose').get(0).click();
					}
				}
			});
		}
	});
	
	// ???????????? ????????? ??????
	$('#pw').blur(function() {
		if(!reg_pw.test($('#pw').val())) {
			$('#pwMsg').text('8~16??? ?????? ??? ?????????, ??????, ??????????????? ???????????????.');
		} else {
			$('#pwMsg').text('');
			pwCk = true;
		}
	});
	
	// ?????????????????? ????????? ??????
	$('#pwCk').blur(function(){
		if($('#pwCk').val() != $('#pw').val()) {
			$('#pwCkMsg').text('??????????????? ???????????? ????????????.');
		} else {
			$('#pwCkMsg').text('');
			pwCkCk = true;
		}
	});
	
	// ?????? ????????? ??????
	$('#name').blur(function() {
		if(!reg_name.test($('#name').val())) {
			console.log($('#name').val());
			$('#nameMsg').text('????????? ????????? ?????????????????? 15?????? ????????? ???????????????');
		} else {
			$('#nameMsg').text('');
			nameCk = true;
		}
	});
	
	// ?????? ???????????? ???????????? -> form ??????
	$('#addBtn').click(function(){
		if(idCk && pwCk && pwCkCk && nameCk) {
			if($('#agreeBox:checked').length < 1) {
				alert('????????? ??????????????????');
				return;
			} else {
				$('#addForm').submit();	
			}
		} else {
			alert('?????? ????????? ???????????????.');
			return;
		}
	});
</script>
</html>