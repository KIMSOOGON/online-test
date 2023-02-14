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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			let thisTestLevel = $('#thisTestLevel').val();
			console.log(thisTestLevel);
			$('#testLevel').val(thisTestLevel).prop("selected",true);
		});
	</script>
</head>
<body>
	<input type="hidden" id="thisTestLevel" value="${thisTestLevel}">
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
                                            <h5 class="m-b-10">시험 목록</h5>
                                            <p class="m-b-0">모든 시험은 철저한 보안으로 관리되고 있습니다.
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
                                                <h5>시험 목록</h5>
                                                <c:if test="${loginTeacher != null && loginStudent == null}">
													<a class="ml-2 btn btn-sm btn-secondary" href="${pageContext.request.contextPath}/teacher/addTest"><i class="ti-plus"></i> 시험등록</a>
												</c:if>
												<!-- 시험검색 -->
												<form method="get" action="${pageContext.request.contextPath}/testList" class="mt-2 text-center form-material">
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
														<select id="testLevel" name="testLevel">
															<option value="" disabled selected>난이도</option>
															<option value="">전체</option>
															<option value="★">★</option>
															<option value="★★">★★</option>
															<option value="★★★">★★★</option>
															<option value="★★★★">★★★★</option>
															<option value="★★★★★">★★★★★</option>
														</select>
														<input type="text" name="searchWord" placeholder="시험명을 검색하세요" value="${searchWord}" style="width:400px; background-color:#FFFFE4;" class="form-control ml-1">			
														<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-search m-r-10"></i></button>
													</div>
												</form>

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
                                                            <tr>
                                                                <th scope="row">No.</th>
																<th>시험</th>
																<th>출제날짜</th>
																<c:if test="${loginStudent != null && loginTeacher == null}">
																	<th>응시하기</th>
																</c:if>
																<c:if test="${loginTeacher != null && loginStudent == null}">
																	<th>삭제</th>
																</c:if>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <!-- 시험목록 출력 -->
															<c:forEach var="t" items="${list}">
																<tr>
																	<td>${t.testNo}</td>
																	<c:choose>
																		<c:when test="${loginTeacher != null}">
																			<td>
																				<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a>
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td>
																				${t.testTitle}
																			</td>
																		</c:otherwise>
																	</c:choose>
																	<td>${t.testDate}</td>
																	<c:if test="${loginStudent != null && loginTeacher == null}">
																		<script>
																			$(document).ready(function(){
																				$modal${t.testNo} = $('.modal${t.testNo}');
																				$modal${t.testNo}.hide();
																				$('.modal--open${t.testNo}').click(function(){
																				  $modal${t.testNo}.show();
																				  return false;
																				});
																				$('.modal--close${t.testNo}').click(function(){
																				  $modal${t.testNo}.hide();
																				});
																			});
																		</script>
																		<td>
																			<div class="container">
																				<button type="button" value="open" class="btn btn-sm btn-dark modal--open${t.testNo}">응시</button>
																			</div>
																			<div class="modal${t.testNo}">
																				<div class="screen">
																					<div class="layerpop">
																						<p class="layerpop__container">
																							<br>난이도 : ${t.testLevel}<br>
																							${t.questionCnt}문항 / 제한시간 : ${t.testTimer}분<br><br>
																							<a class="btn btn-sm btn-info" href="${pageContext.request.contextPath}/student/examTest?testNo=${t.testNo}">문제풀기</a>
																						</p>
																						<button type="button" value="close" class="btn btn-sm btn-danger modal--close${t.testNo}">Close</button>
																					</div>
																				</div>
																			</div>
																		</td>
																	</c:if>
																	<c:if test="${loginTeacher != null && loginStudent == null}">
																		
																		<td>
																			<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}"><i class="ti-trash"></i></a>
																		</td>
																	</c:if>
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
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/testList?currentPage=1&searchWord=${searchWord}&rowPerPage=${rowPerPage}&testLevel=${thisTestLevel}"><i class="ti-angle-double-left"></i></a></li>
										<c:if test="${currentPage > 10}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/testList?currentPage=${startPage-10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}&testLevel=${thisTestLevel}"><i class="ti-angle-left"></i></a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
											<c:choose>
												<c:when test="${currentPage == i}">
													<li class="page-item"><span style="font-weight:bold; color:orange;"><a class="page-link">${i}</a></span></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/testList?currentPage=${i}&searchWord=${searchWord}&rowPerPage=${rowPerPage}&testLevel=${thisTestLevel}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${(lastPage-startPage) > 10}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/testList?currentPage=${startPage+10}&searchWord=${searchWord}&rowPerPage=${rowPerPage}&testLevel=${thisTestLevel}"><i class="ti-angle-right"></i></a></li>
										</c:if>
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/testList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="ti-angle-double-right"></i></a></li>
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