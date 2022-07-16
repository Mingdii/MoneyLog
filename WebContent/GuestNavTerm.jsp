<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>네비게이션바</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
</head>
<body>

<!-- 네비게이션바  -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="moneylogwelcome.action">
			<img src="./img/banner-white.png" alt="배너" style="width: 120px; height: 27px;" />
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar" aria-controls="navbar" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse justify-content-end"
			id="navbar">
			<div class="navbar-nav mr-sm-2">
				<a class="nav-item nav-link active" href="#">회원가입</a>
				<a class="nav-item nav-link" href="loginform.action">로그인</a>
			</div>
		</div>
	</nav>

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>