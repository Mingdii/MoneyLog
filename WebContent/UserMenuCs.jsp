<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>커뮤니티 웹 사이트</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
	<div class="list-group border-0 card text-center text-md-left">
		<h1 class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><span class="d-none d-md-inline">고객지원</span></h1>
		<a href="userservice.action" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
		    <img style="width: 20px;" src="./img2/home.svg"><span class="d-none d-md-inline"> 머니로그 소개</span>
		</a>
		<a href="usernotilist.action" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
		    <img style="width: 20px;" src="./img2/info.svg"><span class="d-none d-md-inline"> 공지사항</span>
		</a>
		<a href="userqnalist.action" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
		    <img style="width: 20px;" src="./img2/qna.svg"><span class="d-none d-md-inline"> 문의하기</span>
		</a>
		<a href="userterms.action" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
		    <img style="width: 20px;" src="./img2/file-text-black.svg"><span class="d-none d-md-inline"> 이용약관</span>
		</a>
	</div> 
                
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>