<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">

	$(function()
	{
		// 전체 선택 / 전체해제
		$("#chkAll").click(function()
		{
			if($("#chkAll").is(":checked"))
				$("input[name=check]").prop("checked", true);
			else $("input[name=check]").prop("checked", false);
		});
		
		// 비동의 눌렀을 때 페이지 넘어가지 않도록 하기
		$("#disagree").click(function()
		{
			alert("필수조건을 모두 동의해야 회원가입이 가능합니다.");
			return false;
		});
		
		// 동의버튼 눌렀을 때
		$("#agreeBtn").click(function()
		{
			//alert("확인");
			
			// 필수조건 체크 안되어 있을 때 페이지 넘어가지 않도록 하기 
			if( $("#usecheck").is(":checked") == false || $("#infocheck").is(":checked") == false || $("#moneyloginfo").is(":checked") == false )
			{
				//alert("버튼 체크 안됨");
				alert("필수조건을 모두 동의해야 회원가입이 가능합니다.");
				return false;
			}
			else
			{	// 필수조건 체크되면 submit
				//alert("버튼 체크");
				$("#joinForm").submit();
			}
			
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
		
		<main id="userSuTerms">
			<!-- 회원가입 상단 아이콘 -->
			<div class="container-fixed m-4">
		        <div class="row sign-up-form">
		            <h2 id="sign-up-intro">회원가입 <span id="sign-up-moneylog">MONEYLOG</span></h2>
		            <hr>
		        </div>
		        <div class="row sign-up-form">
		            <div class="sign-up-process col-12">
		                <div class="row">
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/file-text-black.svg" alt="약관동의아이콘">
		                        <br>
		                        약관동의
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/search-white.svg" alt="본인인증아이콘">
		                        <br>
		                        본인인증
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/user-plus-white.svg" alt="회원정보입력">
		                        <br>
		                        회원정보 입력
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/user-check-white.svg" alt="">
		                        <br>
		                        회원가입 완료
		                    </div>
		                </div>
		            </div>
		            <hr>
		        </div>
		        <div class="row mt-3">
		            <!--약관동의--> <!-- /phone.action -->
		            <form action="UserSuCertified.jsp" method="post" id="joinForm">
		                <ul class="join_box">
		                    <li class="checkBox check01">
		                        <ul class="clearfix">
		                            <li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내
		                                메일 수신(선택)에 모두 동의합니다.</li>
		                            <li class="checkAllBtn">
		                                <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
		                            </li>
		                        </ul>
		                        <textarea class="check-detail" name="" id="">여러분을 환영합니다.
머니로그 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 머니로그 서비스의 이용과 관련하여 머니로그 서비스를 제공하는 머니로그 주식회사(이하 ‘머니로그’)와 이를 이용하는 머니로그 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 머니로그 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
		                        </textarea>
		                    </li>
		                    <li class="checkBox check02">
		                        <ul class="clearfix">
		                            <li>이용약관 동의(필수)</li>
		                            <li class="checkBtn">
		                                <input type="checkbox" id="usecheck" name="check" class="usecheck"> 
		                            </li>
		                        </ul>
		                        <textarea class="check-detail" name="" id="">여러분을 환영합니다.
머니로그 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 머니로그 서비스의 이용과 관련하여 머니로그 서비스를 제공하는 머니로그 주식회사(이하 ‘머니로그’)와 이를 이용하는 머니로그 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 머니로그 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
		                        </textarea>
		                    </li>
		                    <li class="checkBox check03">
		                        <ul class="clearfix">
		                            <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
		                            <li class="checkBtn">
		                                <input type="checkbox" name="check" id="infocheck" class="infocheck">
		                            </li>
		                        </ul>
		        
		                        <textarea class="check-detail" name="" id="">여러분을 환영합니다.
머니로그 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 머니로그 서비스의 이용과 관련하여 머니로그 서비스를 제공하는 머니로그 주식회사(이하 ‘머니로그’)와 이를 이용하는 머니로그 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 머니로그 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
		                        </textarea>
		                    </li>
		                    <li class="checkBox check03">
		                        <ul class="clearfix">
		                            <li>위치정보 이용약관 동의(선택)</li>
		                            <li class="checkBtn">
		                                <input type="checkbox" name="check" id="locacheck" class="chk">
		                            </li>
		                        </ul>
		        
		                        <textarea class="check-detail" name="" id="">여러분을 환영합니다.
머니로그 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 머니로그 서비스의 이용과 관련하여 머니로그 서비스를 제공하는 머니로그 주식회사(이하 ‘머니로그’)와 이를 이용하는 머니로그 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 머니로그 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
		                        </textarea>
		                    </li>
		                    <li class="checkBox check04">
		                        <ul class="clearfix">
		                            <li>이용정보 수집 및 이용에 대한 안내(필수)</li>
		                            <li class="checkBtn">
		                                <input type="checkbox" name="check" id="moneyloginfo" class="eventcheck">
		                            </li>
		                        </ul>
		                        <textarea class="check-detail" name="" id="">여러분을 환영합니다.
머니로그 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 머니로그 서비스의 이용과 관련하여 머니로그 서비스를 제공하는 머니로그 주식회사(이하 ‘머니로그’)와 이를 이용하는 머니로그 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 머니로그 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
		                        </textarea>
		                    </li>
		                </ul>
		                <ul class="footBtwrap clearfix mt-2">
		                    <li><button type="button" class="fpmgBt1" id="disagree" onclick="disagree()">비동의</button></li>
		                    <li><button type="submit" class="fpmgBt2" id="agreeBtn" onclick="newPage()">동의</button></li>
		                </ul>
		            </form>
		        </div>
		    </div>
		</main>
	</div>
	

    <script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>