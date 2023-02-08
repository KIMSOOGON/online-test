<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- nav bar -->
<nav class="navbar header-navbar pcoded-header">
    <div class="navbar-wrapper">
        <div class="navbar-logo">
            <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                <i class="ti-menu"></i>
            </a>
            <div class="mobile-search waves-effect waves-light">
                <div class="header-search">
                    <div class="main-search morphsearch-search">
                        <div class="input-group">
                            <span class="input-group-prepend search-close"><i class="ti-close input-group-text"></i></span>
                            <input type="text" class="form-control" placeholder="Enter Keyword">
                            <span class="input-group-append search-btn"><i class="ti-search input-group-text"></i></span>
                        </div>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/Home">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="(VVIP) 1급기밀 문제지 저장소" />
            </a>
            <a class="mobile-options waves-effect waves-light">
                <i class="ti-more"></i>
            </a>
        </div>
        <div class="navbar-container container-fluid">
            <ul class="nav-left">
                <li>
                    <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                </li>
                <li>
                    <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                        <i class="ti-fullscreen"></i>
                    </a>
                </li>
            </ul>
            <ul class="nav-right">
            	
            	<!-- 알림창 -->
                <li class="header-notification">
                    <a href="#!" class="waves-effect waves-light">
                        <i class="ti-bell"></i>
                        <span class="badge bg-c-red"></span>
                    </a>
                    <ul class="show-notification">
                        <li>
                            <h6>Notifications</h6>
                            <label class="label label-danger">New</label>
                        </li>
                        <li class="waves-effect waves-light">
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">John Doe</h5>
                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                    <span class="notification-time">30 minutes ago</span>
                                </div>
                            </div>
                        </li>
                        <li class="waves-effect waves-light">
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">Joseph William</h5>
                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                    <span class="notification-time">30 minutes ago</span>
                                </div>
                            </div>
                        </li>
                        <li class="waves-effect waves-light">
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">Sara Soudein</h5>
                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                    <span class="notification-time">30 minutes ago</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                
                <!-- 로그인창 -->
                <!-- 비로그인시 -->
                <c:if test="${loginTeacher == null && loginEmp == null && loginStudent == null}">
                	<li class="user-profile header-notification">
                    <a href="#!" class="waves-effect waves-light">
                        <span>로그인</span>
                        <i class="ti-angle-down"></i>
                    </a>
                    <ul class="show-notification profile-notification">
                        <li class="waves-effect waves-light">
                            <a href="${pageContext.request.contextPath}/loginEmp">
                                <i class="ti-settings"></i> 관리자 로그인
                            </a>
                        </li>
                        <li class="waves-effect waves-light">
                            <a href="${pageContext.request.contextPath}/loginTeacher">
                                <i class="ti-user"></i> 강사 로그인
                            </a>
                        </li>
                        <li class="waves-effect waves-light">
                            <a href="${pageContext.request.contextPath}/loginStudent">
                                <i class="ti-user"></i> 학생 로그인
                            </a>
                        </li>
                    </ul>
                </li>
                </c:if>
                
                <!-- 직원 로그인 시 -->
                <c:if test="${loginEmp != null}">
                	<li class="user-profile header-notification">
                     <a href="#!" class="waves-effect waves-light">
                         <span>${loginEmp.empName}</span>
                         <i class="ti-angle-down"></i>
                     </a>
                     <ul class="show-notification profile-notification">
                         <li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/employee/modifyEmpPw">
                                 <i class="ti-lock"></i> 비밀번호 수정
                             </a>
                         </li>
                         <li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/logout">
                                 <i class="ti-layout-sidebar-left"></i> Logout
                             </a>
                         </li>
                     </ul>
                 </li>
                </c:if>
                
                <!-- 강사 로그인 시 -->
                <c:if test="${loginTeacher != null}">
                 <li class="user-profile header-notification">
                     <a href="#!" class="waves-effect waves-light">
                         <span>${loginTeacher.teacherName}</span>
                         <i class="ti-angle-down"></i>
                     </a>
                     <ul class="show-notification profile-notification">
                         <li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">
                                 <i class="ti-lock"></i> 비밀번호 수정
                             </a>
                         </li>
                         <li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/logout">
                                 <i class="ti-layout-sidebar-left"></i> Logout
                             </a>
                         </li>
                     </ul>
                 </li>
                </c:if>
                
                <!-- 학생 로그인 시 -->
                <c:if test="${loginStudent != null}">
                 <li class="user-profile header-notification">
                     <a href="#!" class="waves-effect waves-light">
                         <span>${loginStudent.studentName}</span>
                         <i class="ti-angle-down"></i>
                     </a>
                     <ul class="show-notification profile-notification">
                     	<li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/student/myScoreList">
                                 <i class="fas fa-trophy mat-icon f-24"></i> 내 성적조회
                             </a>
                         </li>
                         <li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/student/modifyStudentPw">
                                 <i class="ti-lock"></i> 비밀번호 수정
                             </a>
                         </li>
                         <li class="waves-effect waves-light">
                             <a href="${pageContext.request.contextPath}/logout">
                                 <i class="ti-layout-sidebar-left"></i> Logout
                             </a>
                         </li>
                     </ul>
                 </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>        