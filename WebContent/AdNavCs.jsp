<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	var ad_id = (String)session.getAttribute("ad_cd");
	
</script>
</head>
<body>

<!-- 네비게이션바 ===================================================== -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="./admain.action"><img src="./img/banner-white.png" alt="배너" style="width: 120px; height: 27px;" /></a>
		<ol class="breadcrumb mobile" style="height: 30px; background: #FFD97D;">
            <li class="active"> 안녕하세요. [ ${ad_id } ] 관리자님 반갑습니다.</li>
        </ol>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar" aria-controls="navbar" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbar">
			<div class="navbar-nav mr-sm-2">
				<a class="nav-item nav-link" href="./aduserlist.action">통합관리</a>
				<a class="nav-item nav-link" href="./adpostlist.action?pageNum=1">머니리뷰</a>
				<a class="nav-item nav-link active" href="./adnotilist.action?pageNum=1">고객지원</a>
				<a class="nav-item nav-link" href="./adminlogout.action">로그아웃</a>
			</div>
		</div>
	</nav>
	<!-- 네비게이션바 ===================================================== -->

	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>