<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MONEYLOG 메인</title>
    <link rel="stylesheet" href="css/fullpage.css">
    <link rel="stylesheet" href="css/moneylog_main.css">
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/script_moneylog_main.js"></script>
    <!--flugin-->
    <script src="js/jquery.fullpage.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>


</head>

<body>
    <div class="wrap">
        <header>
            
            <div class="innerHeader">
                <h1 class="logo" style="color: white;">
                    <a href="moneylogwelcome.action">MONEYLOG</a>
                    <a href="usersuterms.action" class="nav-text">회원가입</a>
                    <a href="loginform.action" style="margin-left: 30px; font-size: 20px;">로그인</a>
                </h1>
            </div>
        </header>
        <!--contents-->
        <div class="fullPageWrap">
            <div id="fullpage">
                <!--section1-->
                <div class="section" id="section1">
                    <ul class="visual">
                        <li class="list" style="background-image: url(img/background_color.jpg);">
                            <div class="textBox">
                                <p class="txt">가계부는</p>
                                <p class="tit">MONEYLOG</p>
                                <p class="dot">가계부는 <br> MONEYLOG</p>
                            </div>
                        </li>
                        <li class="list" style="background-image: url(img/background_color.jpg);">
                            <div class="textBox">
                                <p class="tit">우리의 일상을<span>담은 가계부</span></p>
                                <p class="txt">일상을 담은 Vlog처럼 가계부를 담다.</p>
                                <p class="dot">우리의 일상을 담은<br>가계부</p>
                            </div>
                        </li>
                        <li class="list" style="background-image: url(img/background_color.jpg);">
                            <div class="textBox">
                                <p class="tit"><span>쓰면 쓸수록</span>정확해지는</p>
                                <p class="txt">가계부를 쓸 때마다 정확해지는 데이터.</p>
                                <p class="dot">쓰면 쓸수록 정확해지는<br>가계부</p>
                            </div>
                        </li>
                        <li class="list" style="background-image: url(img/background_color.jpg);">
                            <div class="textBox">
                                <p class="tit"><span>우리의 가계부를</span>공유하는</p>
                                <p class="txt">서로의 가계부를 공유해보세요.</p>
                                <p class="dot">공유하는 가계부<br>MONEYLOG</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body></html>