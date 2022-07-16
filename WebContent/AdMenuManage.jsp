<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>관리자 통합관리 사이드바</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar" style="position: fixed; top: 58px;">
            <div class="list-group border-0 card text-center text-md-left">
		
                <h4 class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><span class="d-none d-md-inline ml-1"> 통합관리</span></h4>
		
                <a href="./aduserlist.action" class="list-group-item d-inline-block collapsed"  data-parent="#sidebar">
                    <img style="width: 20px;" src="./img2/user.svg"><span class="d-none d-md-inline ml-1"> 회원목록</span>
                </a>
                
                <a href="./adbanlist.action" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
                    <img style="width: 20px;" src="./img2/user-check-black.svg"><span class="d-none d-md-inline ml-1"> 영구정지회원</span>
                </a>
                <a href="#rept" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
                data-parent="#sidebar" aria-expanded="false">
                    <img style="width: 20px;" src="./img/edit.svg"><span class="d-none d-md-inline ml-1"> 신고처리</span>
                </a>
                <div class="collapse" id="rept">
                    <a href="./adpostreptlist.action" class="list-group-item" data-parent="#sidebar">게시글 신고처리</a>
                    <a href="./adcmntreptlist.action" class="list-group-item" data-parent="#sidebar">댓글 신고처리</a>
                </div>
                
            </div> 
        </nav>
    </div>
                
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>