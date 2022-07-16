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
<title>휴대폰 인증</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />

<script type="text/javascript">

	function newPage()
	{
		location.href="UserSuTerms.jsp";
	}

	// 휴대폰번호 하이픈(-) 자동 삽입 정규식
	function autoHyphen(user_tel)
	{
		var phoneNum = $("#user_tel").val();
		phoneNum = $.trim(phoneNum); 			// 앞뒤 공백제거
		phoneNum = phoneNum.replace(/-/gi, ""); // - 하이픈 제거
		phoneNum = phoneNum.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, "$1-$2-$3");
		user_tel = phoneNum;
		alert(user_tel);
	}
	
	$(function()
	{
		// 테스트 중이라 required 속성 제거했지만 통합할 때 넣어주기 ★
			
		$("#goSMS").click(function()
		{
			// 휴대폰 번호 값 받아서 phoneNum 으로 일괄적으로 하이픈 적용
			var phoneNum = document.getElementById("user_tel").value;
					
			phoneNum = $.trim(phoneNum); 			// 앞뒤 공백제거
			phoneNum = phoneNum.replace(/-/gi, ""); // - 하이픈 제거
			phoneNum = phoneNum.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, "$1-$2-$3");
			user_tel = phoneNum;
					
			//alert(url_tel);	
					
			// 인증번호 ajax/controller 나중에 업데이트
					
			alert("인증번호가 발송되었습니다. 인증번호는 74624 입니다.");
					
		});
				
		$("#confirmBnt").click(function()
		{
			alert("인증되었습니다.");
		});
		
		$("#nextBtn").click(function()
		{
			$("#phoneForm").submit();
		});
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
	
		<main id="userSuCertified">
			<!-- 회원가입 상단 아이콘 -->
			<div class="container-fixed m-4">
		        <div class="row sign-up-form">
		            <h2 id="sign-up-intro">회원가입<span id="sign-up-moneylog">MONEYLOG</span></h2>
		        </div>
		        <div class="row sign-up-form">
		            <div class="sign-up-process col-12">
		                <div class="row">
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/file-text-white.svg" alt="약관동의아이콘">
		                        <br>
		                        약관동의
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/search-black.svg" alt="본인인증아이콘">
		                        <br>
		                        본인인증
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/user-plus-white.svg" alt="회원정보입력">
		                        <br>
		                        회원정보 입력
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/user-check-white.svg" alt="화원가입완료">
		                        <br>
		                        회원가입 완료
		                    </div>
		                </div>
		            </div>
		        </div>
		
		        <div class="row bg-light sign-up-form mt-3">
					<div class="sign-up-process col-12">
		                <form action="UserSuInfoInput.jsp" method="post" id="phoneForm"class="su-input-form">
							<div class="row form-group">
								<div class="col-8">
									<label>휴대폰 번호</label>
									<input type="text" id="user_tel" name="user_tel" class="form-control" required placeholder="휴대폰 번호를 입력해주세요.">
								</div>
								<div class="col-4">
									<br>
									<button type="submit" id="goSMS" name="goSMS" class="btn btn-primary">sms 전송</button>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-8">
									<label>인증번호</label>
									<input type="text" class="form-control" required placeholder="SMS로 수신된 인증 번호 5자리를 입력해주세요.">
								</div>
								<div class="col-4">
									<br>
									<button type="button" id="confirmBnt" name="confirmBnt"  class="btn btn-primary" >인증</button>
								</div>
							</div>
							<br>
							<button type="submit" id="prePage" name="prePage" class="btn btn-primary" onclick="newPage()">이전</button>
							<button id="nextBtn" type="submit" class="btn btn-primary">다음</button>
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