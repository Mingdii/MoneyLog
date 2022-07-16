<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>네비게이션바</title>
<script type="text/javascript">

	function home()
	{
		// post 하기 위해 form 생성
		var form = document.createElement("form");
		
		form.action = "./fstcalendar.action";
		form.method = "post";
		
		document.body.appendChild(form);
		form.submit();
	}
	
</script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
</head>
<body>

<!-- 네비게이션바  -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" onclick="home()"><img src="./img/banner-white.png" alt="배너" style="width: 100px;" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar" aria-controls="navbar" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse justify-content-end"
			id="navbar">
			<div class="navbar-nav mr-sm-2">
				<a class="nav-item nav-link" href="userpostlist.action?pageNum=1">머니리뷰</a>
				<a class="nav-item nav-link active" href="userservice.action">고객지원</a>
				<a class="nav-item nav-link" href="mypostlist.action">마이페이지</a>
				<a class="nav-item nav-link" href="logoutuser.action">로그아웃</a>
			</div>
		</div>
	</nav>

	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>