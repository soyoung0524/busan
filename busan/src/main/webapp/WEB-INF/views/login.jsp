<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath }/resources/css/login.css"></link>
</head>

<body style="width: 100%; height: 100%">
	<form method="POST" class="loginForm">
		<h2>LOG IN</h2>
		<div class="idForm">
			<input type="text" id="userid" class="id1" name="id" placeholder="아이디"  maxlength="20" autofocus required style="text-transform: lowercase;">
		</div>
		<div class="passForm">
			<input type="password" id="userpw" class="pw1" name="pw" placeholder="비밀번호" required disabled>
        </div>
		<input type="submit" id="joinBtn" class="btn" value="로그인" disabled>
		<div class="join">
			<a href="${cpath }/join">회원가입</a>
		</div>
		<div class="join-back">
			<a href="javascript:window.history.back();">뒤로가기</a>
		</div>
		
		
	</form>
	
</body>

<script>
	const join = document.querySelector('.join');
	

	const userpw = document.getElementById('userpw');
	const joinBtn = document.getElementById('joinBtn');
	// id 입력
	document.getElementById('userid').onkeyup = function(e){
		var userid = this.value;
		this.value = userid.replace(/[^a-z0-9]/gi,'');
		
		if(userid != ''){
			userpw.disabled = false;
		}else{
			userpw.disabled = true;
		}
	}
	
	// pw입력
	userpw.onkeyup = function(e){
		var userpw = this.value;
		this.value = userpw.replace(/[^a-z0-9]/gi,'');
		if(userpw != ''){
			joinBtn.disabled = false;
		}else{
			joinBtn.disabled = true;
		}
	}
	
	
</script>
</html>