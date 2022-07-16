<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기결과</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />

<script src="./js/userTerms.js"></script>
</head>
<body>

<div class="wrap">
	<header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./GuestNav.jsp"></jsp:include>
	</header>

	<main id="userPwNo">
		<div class="container-fixed m-4">
	        <div class="row sign-up-form">
	            <h2 id="sign-up-intro">비밀번호 찾기 <span id="sign-up-moneylog">MONEYLOG</span></h2>
	        </div>
	
	        <div class="row bg-light sign-up-form mt-3" style="border-radius: 3px;">
				<div class="sign-up-process col-12">
	                <form>
						<div class="form-group text-center">
							<img src="img2/frown.svg" alt="슬픈얼굴">
							<p>입력하신 정보로 회원님의 계정을 찾을 수 없었습니다.</p>
						</div>
						<div class="find-id-div">
							<button type="submit" class="btn find-id-btn btn-primary">비밀번호찾기</button>
							<button type="submit" class="btn go-login-btn btn-primary">로그인하러 가기</button>
						</div>
						
					</form>
	            </div>
			</div>
	    </div>
	</main>
</div>

    <script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>