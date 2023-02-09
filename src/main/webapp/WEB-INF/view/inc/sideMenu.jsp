<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="pcoded-navbar">
   <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
   <div class="pcoded-inner-navbar main-menu">
       <div class="">
           <div class="main-menu-header">
               <img class="img-80 img-radius" src="${pageContext.request.contextPath}/resources/images/김수곤.jpg" alt="User-Profile-Image">
               <div class="user-details">
                   <span id="more-details">developer KIM SOO GON<i class="fa fa-caret-down"></i></span>
               </div>
           </div>
           <div class="main-menu-content">
               <ul>
                   <li class="more-details">
                       <a href="user-profile.html"><i class="ti-user"></i>구디아카데미 58기</a>
                       <a href="#!"><i class="ti-settings"></i>깃허브 : </a>
                   </li>
               </ul>
           </div>
       </div>
       <div class="p-15 p-b-0">
           <form class="form-material" method="get" action="${pageContext.request.contextPath}/testList">
               <div class="form-group form-primary">
                   <input type="text" name="searchWord" class="form-control">
                   <span class="form-bar"></span>
                   <label class="float-label"><i class="fa fa-search m-r-10"></i>시험을 검색해보세요</label>
               </div>
           </form>
       </div>
       <div class="pcoded-navigation-label">Menu</div>
       <ul class="pcoded-item pcoded-left-item">
           <li>
               <a href="${pageContext.request.contextPath}/Home" class="waves-effect waves-dark">
                   <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                   <span class="pcoded-mtext">Home</span>
                   <span class="pcoded-mcaret"></span>
               </a>
           </li>
       </ul>
       
       <!-- 관리자페이지 -->
       
        <div class="pcoded-navigation-label">Administrator (관리자 외 접근불가)</div>
        <ul class="pcoded-item pcoded-left-item">
            <li class="pcoded-hasmenu">
                <a href="javascript:void(0)" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>BC</b></span>
                    <span class="pcoded-mtext">관리자 페이지</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <c:if test="${loginEmp == null}">
                <ul class="pcoded-submenu">
                    <li class=" ">
                    	<a class="waves-effect waves-dark">
	                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                        <span class="pcoded-mtext">제한된 접근입니다</span>
	                        <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                </ul>
                </c:if>
                <c:if test="${loginEmp != null}">
	                <ul class="pcoded-submenu">
	                    <li class=" ">
	                        <a href="${pageContext.request.contextPath}/employee/empList" class="waves-effect waves-dark">
	                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                            <span class="pcoded-mtext">직원목록</span>
	                            <span class="pcoded-mcaret"></span>
	                        </a>
	                    </li>
	                    <li class=" ">
	                        <a href="${pageContext.request.contextPath}/employee/addEmp" class="waves-effect waves-dark">
	                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                            <span class="pcoded-mtext">직원등록</span>
	                            <span class="pcoded-mcaret"></span>
	                        </a>
	                    </li>
	                    <li class=" ">
	                        <a href="${pageContext.request.contextPath}/employee/teacherList" class="waves-effect waves-dark">
	                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                            <span class="pcoded-mtext">강사목록</span>
	                            <span class="pcoded-mcaret"></span>
	                        </a>
	                    </li>
	                    <li class=" ">
	                        <a href="${pageContext.request.contextPath}/employee/addTeacher" class="waves-effect waves-dark">
	                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                            <span class="pcoded-mtext">강사등록</span>
	                            <span class="pcoded-mcaret"></span>
	                        </a>
	                    </li>
	                    <li class="">
	                        <a href="${pageContext.request.contextPath}/employee/studentList" class="waves-effect waves-dark">
	                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                            <span class="pcoded-mtext">학생목록</span>
	                            <span class="pcoded-mcaret"></span>
	                        </a>
	                    </li>
	                    <li class=" ">
	                        <a href="${pageContext.request.contextPath}/employee/addStudent" class="waves-effect waves-dark">
	                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                            <span class="pcoded-mtext">학생등록</span>
	                            <span class="pcoded-mcaret"></span>
	                        </a>
	                    </li>
	                </ul>
                </c:if>
            </li>
        </ul>
       
       <div class="pcoded-navigation-label">Exam</div>
       <ul class="pcoded-item pcoded-left-item">
           <li class="">
               <a href="${pageContext.request.contextPath}/testList" class="waves-effect waves-dark">
                   <span class="pcoded-micon"><i class="ti-receipt"></i><b>B</b></span>
                   <span class="pcoded-mtext">1급기밀 시험목록</span>
                   <span class="pcoded-mcaret"></span>
               </a>
           </li>
       </ul>
       
       <div class="pcoded-navigation-label">Teacher</div>
       <ul class="pcoded-item pcoded-left-item">
           <li class="">
               <a href="${pageContext.request.contextPath}/teacher/addTest" class="waves-effect waves-dark">
                   <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                   <span class="pcoded-mtext">시험 등록</span>
                   <span class="pcoded-mcaret"></span>
               </a>
           </li>
       </ul>
       
       <!-- 내 점수 조회 (로그인한 학생만 가능) -->
       <div class="pcoded-navigation-label">Student</div>
       <ul class="pcoded-item pcoded-left-item">
           <li class="">
               <a href="${pageContext.request.contextPath}/student/myScoreList" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-bar-chart-alt"></i><b>C</b></span>
                    <span class="pcoded-mtext">내 점수 조회</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- nav bar 끝 -->