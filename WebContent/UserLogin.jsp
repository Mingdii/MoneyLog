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
<title>로그인</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
	
	// 아이디 혹은 비밀번호 틀려서 다시 이 페이지로 돌아올 때 메세지 출력
	var msg = "<c:out value='${msg}'/>";
	if(!msg=="")
	{
		alert(msg);
	}
	
	$(function()
	{
		$("#login-btn").click(function()
		{
			$("#err").css("display", "none");
					
			if($("#user_id").val()=="" || $("#user_pw").val()=="")
			{
					$("#err").html("※ 항목을 모두 입력해야 합니다.").css("display", "inline");
					return;
			}
			$("#loginForm").submit();	// 자료를 전송
		});
	});
	
</script>
</head>
<body>
<div class="wrap">
	<header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./GuestNav.jsp"></jsp:include>
	</header>
	<main id="userLogin">
		<div class="container">
			<div class="row login-banner">
				<div>
					<h1 id="login-main">MONEYLOG</h1>
				</div>
			</div>
			<div class="row pt-2" style="place-items: center; display: grid;">
				<div id="login-form">
					<form action="login.action" method="POST" id="loginForm" name="loginForm"> 
						<input type="text" id="user_id" name="user_id" class="text-field form-control" placeholder="아이디를 입력해주세요" value="${cookie.id.value}" required="required">
	                    <input type="password" id="user_pw" name="user_pw" class="text-field form-control" placeholder="비밀번호를 입력해주세요" required="required"/>
						<button type="submit" class="btn btn-primary" id="login-btn" >로그인</button>
						
						<div>
							<label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "" : "checked"}> 아이디 저장</label>
						</div>
	                    <div id="login-links">
	                        <a href="/MoneyLog/searchid.action" >아이디 찾기</a> 
	                        <span style="margin-left: 32px; margin-right: 32px;">|</span>
	                        <a href="/MoneyLog/searchpw.action">비밀번호 찾기</a>
	                    </div>
	                    <div>
	                       <span id="err"></span>
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