<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
											<h5 class="m-b-10">사원 목록</h5>
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
                                                <h5>사원 목록</h5>
                                                <a class="ml-3 btn btn-sm btn-outline-dark" href="${pageContext.request.contextPath}/employee/addEmp"><i class="ti-plus"></i> 사원등록</a>
												<!-- 사원검색 -->
												<form method="get" action="${pageContext.request.contextPath}/employee/empList" class="mt-2 text-center form-material">
													<div class="form-group form-primary">
														<select name="rowPerPage">
															<c:if test="${rowPerPage == 5}">
																<option value="5" selected="selected">5</option>
																<option value="10">10</option>
																<option value="20">20</option>
															</c:if>
															<c:if test="${rowPerPage == 10}">
																<option value="5">5</option>
																<option value="10" selected="selected">10</option>
																<option value="20">20</option>
															</c:if>
															<c:if test="${rowPerPage == 20}">
																<option value="5">5</option>
																<option value="10">10</option>
																<option value="20" selected="selected">20</option>
															</c:if>
														</select>
														<input type="text" name="searchWord" placeholder="사원 찾기" value="${searchWord}" style="width:400px; background-color:#FFFFE4;" class="form-control ml-1">			
														<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-search m-r-10"></i></button>
													</div>
													
												</form>
												<c:if test="${searchWord != ''}">
													'<big style="color:#A81919">${searchWord}</big>' 검색결과, 총 '<big style="color:#FFEBFE">${ttlEmpCnt}</big>'건이 검색되었습니다.  
												</c:if>

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
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr style="background-color:#FFFAFF;">
                                                                <th scope="row">사번</th>
																<th>ID</th>
																<th>이름</th>
																<th>삭제</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <!-- 시험목록 출력 -->
															<c:forEach var="e" items="${list}">
																<tr>
																	<td>${e.empNo}</td>
																	<td>${e.empId}</td>
																	<td>${e.empName}</td>
																	<td><a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}"><i class="ti-trash"></i></a></td>
																</tr>
															</c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                       	</div>
										<!-- Hover table card end -->
                               		</div>
								<!-- Page-body end -->
								</div>
							</div>
							<!-- Main-body end -->
								
							<!-- 페이징 -->
							<div class="container text-center">
								<nav>
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}&rowPerPage=${rowPerPage}"><i class="ti-angle-double-left"></i></a></li>
										<c:if test="${currentPage > 10}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/empList?currentPage=${startPage-10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}"><i class="ti-angle-left"></i></a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
											<c:choose>
												<c:when test="${currentPage == i}">
													<li class="page-item"><span style="font-weight:bold; color:orange;"><a class="page-link">${i}</a></span></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&searchWord=${searchWord}&rowPerPage=${rowPerPage}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${(lastPage-startPage) > 10}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/empList?currentPage=${startPage+10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}"><i class="ti-angle-right"></i></a></li>
										</c:if>
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="ti-angle-double-right"></i></a></li>
									</ul>
								</nav>
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