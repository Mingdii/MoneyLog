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
<title>회원가입 완료</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">

	$("#longin").click(function()
	{
		$("#joinOk").submit();
	});


</script>


<script src="./js/userTerms.js"></script>
</head>
<body>

<div class="wrap">
	<header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./GuestNavTerm.jsp"></jsp:include>
	</header>

	<main id="userSuOk">
		<!-- 회원가입 상단 아이콘 -->
		<div class="container-fixed m-4">
	        <div class="row sign-up-form">
	            <h2 id="sign-up-intro">회원가입 <span id="sign-up-moneylog">MONEYLOG</span></h2>
	        </div>
	        <div class="row sign-up-form">
	            <div class="sign-up-process col-12">
	                <div class="row bg-light" style="border-radius: 3px;">
	                    <div class="col-3 sign-up-icon">
	                        <img src="./img2/file-text-white.svg" alt="약관동의아이콘">
	                        <br>
	                        약관동의
	                    </div>
	                    <div class="col-3 sign-up-icon">
	                        <img src="./img2/search-white.svg" alt="본인인증아이콘">
	                        <br>
	                        본인인증
	                    </div>
	                    <div class="col-3 sign-up-icon">
	                        <img src="./img2/user-plus-white.svg" alt="회원정보입력">
	                        <br>
	                        회원정보 입력
	                    </div>
	                    <div class="col-3 sign-up-icon">
	                        <img src="./img2/user-check-black.svg" alt="">
	                        <br>
	                        회원가입 완료
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <div class="row sign-up-form" >
				<div class="sign-up-process col-12">
	                <form action="UserLogin.jsp" method="post" id="joinOk">
						<div class="form-group">
							<img src="img2/smile.svg" alt="웃는얼굴">
							<h4>환영합니다.</h4>
							<h4>회원가입이 완료되었습니다.</h4>
						</div>
						<div>
							<button type="submit" id="longin" class="btn btn-primary">로그인하러 가기</button>
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