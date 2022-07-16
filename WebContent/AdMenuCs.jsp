<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>고객지원 사이드바</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar" style="position: fixed; top: 58px;">
            <div class="list-group border-0 card text-center text-md-left">
		
                <h4 class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><span class="d-none d-md-inline ml-1"> 고객지원</span></h4>

                <a href="./adnotilist.action?pageNum=1" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
                    <img style="width: 20px;" src="./img2/list.svg"><span class="d-none d-md-inline ml-1"> 공지사항</span>
                </a>
                
                <a href="./adqnalist.action?pageNum=1" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
                    <img style="width: 20px;" src="./img2/help-circle.svg"><span class="d-none d-md-inline ml-1"> 문의글</span>
                </a>
                
            </div> 
        </nav>
    </div>
                
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>