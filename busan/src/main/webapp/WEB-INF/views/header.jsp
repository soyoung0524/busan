<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
	<link rel="stylesheet" href="${cpath }/resources/css/header.css"></link>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<header>

		<div class="header-outline">
			<div class="header-1">
				<ul>
					<c:if test="${empty login }">
						<li><a href="${cpath }/login">로그인</a></li>
					</c:if>
					<c:if test="${not empty login }">
						<li><a href="${cpath }/logout">로그아웃</a></li>
					</c:if>
					<c:if test="${empty login }">
						<li><a href="${cpath }/join">회원가입</a></li>
					</c:if>
				</ul>
			<c:if test="${not empty login }">
				<div class="rightUserBox"
					style="width: 180px; height: 52px; margin-left: 0%; display: flex;">
					<div id="backImg" class="userProfile"
						style="width: 50px; height: 50px; border-radius: 9999px; margin-top: auto; margin-bottom: auto;">
					</div>

					<div class="userName"
						style="width: 100px; height: 30px; margin-top: auto; margin-bottom: auto; margin-left: 10px; line-height: 32px;">
						${login.name }</div>
				</div>
			</c:if>
			</div>
			<form id="imgChange" method="post" enctype="mulipart/form-data">
				<input id="input_profile" class="fileBtn" type="file" name="file">
			</form>
		</div>
		<div class="header-2">
			<div class="header2-inner">
				<div>
					<a href="${cpath }"><img src="img/check/logo_180.png"
						alt="부산광역시"></a>
				</div>
				<div>
					<div class="search">
						<input type="text" name="search" id="search" placeholder="검색어를 입력하세요">
						<input type="button" id="searchBtn" value="검색">
					</div>
				</div>

			</div>

		</div>
	</header>
	
</html>