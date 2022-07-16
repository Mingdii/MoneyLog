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
<title>비밀번호찾기</title>
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
	
	<main id="userPwCertifiedOk">
		<div class="container-fixed m-4">
	        <div class="row sign-up-form">
	            <h2 id="sign-up-intro">비밀번호찾기 <span id="sign-up-moneylog">MONEYLOG</span></h2>
	        </div>
	
	        <div class="row bg-light sign-up-form mt-3" style="border-radius: 3px;">
				<div class="sign-up-process col-12">
	                <form action="UserLogin.jsp" method="post">
						<div class="form-group text-center">
							<img src="img2/smile.svg" alt="웃는얼굴">
							<p>요청하신 계정의 비밀번호가 확인 되었습니다.</p>
							
							<c:forEach var="check" items="${checkPw }">
								<p>귀하의 비밀번호는 <span style="color: blue;">${check.user_pw }</span> 입니다.</p>
							</c:forEach>
							
							<!-- 
								아직은 암호화 / 복호화 처리가 안된 비밀번호만 페이지에 제대로 나옴.
								암호화 / 복호화된 비밀번호도 나올 수 있도록 추가 수정할 예정.
							-->
							
							<!-- 
							<p>가입시 등록한 이메일로 비밀번호가 발송되었습니다.</p>
							<p>이메일 수신이 안되는 경우 스팸메일함을 확인바랍니다.</p> 
							-->
						</div>
						<div class="go-login text-center">
							<button type="submit" class="btn btn-primary">로그인하러 가기</button>
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