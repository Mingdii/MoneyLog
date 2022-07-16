<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>관리자 메인 사이드바</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar" style="position: fixed; top: 58px;">
            <div class="list-group border-0 card text-center text-md-left">
		
                <a href="#admanage" class="list-group-item d-inline-block collapsed" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
                    <img style="width: 20px;" src="./img/edit.svg"><span class="d-none d-md-inline ml-1"> 통합관리</span>
                </a>
                <div class="collapse" id="admanage">
                    <a href="./aduserlist.action" class="list-group-item" data-parent="#sidebar">회원 목록</a>
                    <a href="./adbanlist.action" class="list-group-item" data-parent="#sidebar">영구정지회원</a>
                    <a href="./adpostreptlist.action" class="list-group-item" data-parent="#sidebar">신고처리</a>
                </div>

                <a href="#moneyreview" class="list-group-item d-inline-block collapsed" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
                    <img style="width: 20px;" src="./img2/file-text-black.svg"><span class="d-none d-md-inline ml-1"> 머니리뷰</span>
                </a>
                <div class="collapse" id="moneyreview">
                    <a href="./adpostlist.action?pageNum=1" class="list-group-item" data-parent="#sidebar">게시글 목록</a>
                    <a href="./adcmntlist.action?pageNum=1" class="list-group-item" data-parent="#sidebar">댓글 목록</a>
                </div>
                
                <a href="#cs" class="list-group-item d-inline-block collapsed" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
                    <img style="width: 20px;" src="./img/user.svg"><span class="d-none d-md-inline ml-1"> 고객지원</span>
                </a>
                <div class="collapse" id="cs">
                    <a href="./adnotilist.action?pageNum=1" class="list-group-item" data-parent="#sidebar">공지사항</a>
                    <a href="./adqnalist.action?pageNum=1" class="list-group-item" data-parent="#sidebar">문의글</a>
                </div>
                
            </div> 
        </nav>
    </div>
	
                
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>