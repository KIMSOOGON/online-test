<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	small {
		color:red;
	}
	
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h1>강사추가</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/employee/addTeacher" method="post">
		<div><!-- 아이디 -->
			<!-- 아이디 중복확인 modal -->
			<div id="ex1" class="modal">
				<div>
					<input type="text" id="checkId" placeholder="id">
					<button type="button" id="ckBtn">중복확인</button>
					<a href="#" rel="modal:close" id="modalClose">닫기</a>
				</div>
				<div>
					<small id="checkIdMsg"></small>
				</div>
			</div>
			<input type="text" name="teacherId" id="id" readonly="readonly" placeholder="id">
			<a href="#ex1" rel="modal:open">중복확인</a>
		</div>
		<div><!-- 패스워드 -->
			<input type="password" id="pw" name="teacherPw" placeholder="password">
			<small id="pwMsg"></small>
		</div>
		<div><!-- 패스워드 확인 -->
			<input type="password" id="pwCk" placeholder="password check">
			<small id="pwCkMsg"></small>
		</div>
		<div><!-- 이름 -->
			<input type="text" id="name" name="teacherName" placeholder="name">
			<small id="nameMsg"></small>
		</div>
		<div>
			<button type="button" id="addBtn">등록</button>
		</div>
	</form>
</body>
<script>
	//정규식
	let reg_id = /^[a-z0-9]{4,12}$/;
	let reg_pw = /(?=.*[a-zA-ZS])(?=.*?[0-9])(?=.*?[~!@#$%^&*_-]).{8,16}$/;
	let reg_name = /^[가-힣a-zA-Z]{1,15}$/;
	
	let idCk = false;
	let pwCk = false;
	let pwCkCk = false;
	let nameCk = false;
	
	// 아이디 유효성 검사 (중복확인 포함)
	$('#ckBtn').click(function(){
		if(!reg_id.test($('#checkId').val())) {
			$('#checkIdMsg').text('아이디는 영문소문자와 숫자 4~12자리로 입력하세요.');
		} else {
			$('#checkIdMsg').text('');
			$.ajax({
				url:'idCheck'
				, type: 'get'
				, data: {id:$('#checkId').val()}
				, success:function(model){ // model : 'YES' / 'NO'
					if(model=='YES') {
						// 사용가능 아이디
						alert('사용가능한 아이디입니다.');
						idCk = true;
						$('#id').val($('#checkId').val());
						$('#modalClose').get(0).click();
					} else {
						// 사용불가 아이디 (사용중)
						alert('이미 탈퇴했거나 사용중인 아이디입니다.');
						$('#id').val('');
						$('#modalClose').get(0).click();
					}
				}
			});
		}
	});
	
	// 패스워드 유효성 검사
	$('#pw').blur(function() {
		if(!reg_pw.test($('#pw').val())) {
			$('#pwMsg').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
		} else {
			$('#pwMsg').text('');
			pwCk = true;
		}
	});
	
	// 패스워드확인 유효성 검사
	$('#pwCk').blur(function(){
		if($('#pwCk').val() != $('#pw').val()) {
			$('#pwCkMsg').text('비밀번호가 일치하지 않습니다.');
		} else {
			$('#pwCkMsg').text('');
			pwCkCk = true;
		}
	});
	
	// 이름 유효성 검사
	$('#name').blur(function() {
		if(!reg_name.test($('#name').val())) {
			console.log($('#name').val());
			$('#nameMsg').text('이름은 한글과 영어대소문자 15자리 이하로 입력하세요');
		} else {
			$('#nameMsg').text('');
			nameCk = true;
		}
	});
	
	// 최종 버튼으로 등록하기 -> form 실행
	$('#addBtn').click(function(){
		if(idCk && pwCk && pwCkCk && nameCk) {
			$('#addForm').submit();
		} else {
			alert('모든 항목을 채워주세요.');
			return;
		}
	});
	
	$('#addBtn').click(function(){
		// 유효성 검사
		
		
	});
</script>
</html>