<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cpath }/resources/css/info.css"></link>
</head>
<body>
	<header>
		<div class="header-outline">
			<div class="header-1">
				<ul>
					<c:if test="${empty login }">
						<li>
							<a href="${cpath }/login">로그인</a>
						</li>
						<li>
							<a href="${cpath }/join">회원가입</a>
						</li>
					</c:if> 
					<c:if test="${not empty login }">
						<li>
							<a href="${cpath }/logout">로그아웃</a>
						</li>
					</c:if>
				</ul>
				
				<div class="rightUserBox"
					style="width: 180px; height: 52px; margin-left: 0%; display: flex;">
					<div id="backImg" class="userProfile"
						style="width: 50px; height: 50px; border-radius: 9999px; margin-top: auto; margin-bottom: auto;">
					</div>

					<div class="userName"
						style="width: 100px; height: 30px; margin-top: auto; margin-bottom: auto; margin-left: 10px; line-height: 32px;">
						${login.name }</div>
				</div>
			</div>
			<form id="imgChange" method="post" enctype="mulipart/form-data">
				<input id="input_profile" class="fileBtn" type="file" name="file">
			</form>
		</div>
		<div class="header-2">
			<div class="header2-inner">
				<div>
					<a href="${cpath }">
						<img src="${cpath }/img/check/logo_180.png"
						alt="부산광역시">
					</a>
				</div>
			</div>
		</div>
	</header>

</body>
</html>