<%@page import="com.test.mvc.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>

<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


	var user_pw = "${user_pw }";         // db에 있는 pw 복호화하여 가져온 값
	
	var pw_rule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;  // 정규표현식
		

	// keyup 시 발생.. 순서 중요
    $(document).ready(function()
	{	
    	var newPw1 = $("#newPw1").val();
    	
    	
    	//기존 비밀번호 입력하는 중에는 에러 사라지게 처리 (일치했을때 갑자기 사라지면 유추가능하니까)
		$("#pw").keyup(function()    
		{	
    		$("#err1").hide();	
    		return;                       //-- submit 액션 처리 중단
    	});
			

    	
		$("#newPw2").keyup(function() 
		{
			$("#err3").hide();
			
			if($("#newPw1").val() == $("#newPw2").val())        //비밀번호 일치
			{
				$("#err3").text("비밀번호가 일치합니다.").css("color", "black").show();

			}
			else
			{
				$("#err3").text("비밀번호가 일치하지 않습니다.").css("color", "red").show();
				
				if($("#newPw1").keyup(function()
				{
					$("#err3").hide();
				}));
	
			}
			return;
		});
				
	});
	
	
	// 버튼 클릭시 발생 순서 중요
    $(function()
    {
		$("#pwModify-btn").click(function()     
	    {
	       	$("#err1").css("display", "none");
	       	$("#err2").css("display", "none");
	       	$("#err3").css("display", "none");
	       	
	       	
	       	if ($("#pw").val()== "")         // 이 아래로 세개는 혹시 몰라서 해놓은 거 입력 안됐을 때
	   		{
	   			$("#err1").text("기존 비밀번호를 입력하세요.").css("color","red").show();
	   			$("#pw").focus();
	   			return;
	   		}
	   		
	   		if($("#newPw1").val()== "")
	   		{
	   			$("#err2").text("변경 비밀번호를 입력하세요.").css("color","red").show();
	   			$("#newPw1").focus();
	   			return;
	   		}
	   		
	   		if($("#newPw2").val()== "")
	   		{
	   			$("#err3").text("변경 비밀번호를 입력하세요.").css("color","red").show();
	   			$("#newPw2").focus();
	   			return;
	   		}
	   		
	       	
	       	// 기존 비밀번호 일치 검사
	   		if( $("#pw").val() != user_pw )             // 기존 비밀번호가 일치하지 않을 경우
	   		{	
	   			$("#err1").text("기존 비밀번호가 일치하지 않습니다.").css("color", "red").show();
	   			$("#pw").val().focus();			                          //-- submit 액션 처리 중단
	   			return;                                                   //-- submit 액션 처리 중단
	   		}
	       	
	   		if (!pw_rule.test($("#newPw1").val()))
			{
				$("#err2").text("8~15 자리의 영문 + 숫자 + 특수문자 조합 비밀번호를 입력해주세요.").css("color", "red").show();
				$("#newPw1").focus();
				return;
			}
	   		
	   		if($("#newPw1").val()!=$("#newPw2").val())  
	   		{
	   			$("#err3").text("비밀번호가 일치하지 않습니다.").css("color","red").show();	
	   			return;
	   		}
	   		
	   		
	   		$("#myPwModifyForm").submit();	// 서브밋 하면 mypwmodifyok.action 처리
	   			
	    });

    });
	

 
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMp.jsp"></jsp:include>
	
	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    	<div class="row d-flex d-md-block flex-nowrap wrapper">
            <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            	<!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./UserMenuMp.jsp"></jsp:include>
            </nav>
        </div>
		
		<div class="container">
			<div class="row">
						
						
				<!-- 비밀번호 변경 -->
				<div class="col-md-12">
				
					<div class="list-group">
						<br>
						<h4>비밀번호 변경<small> 현재 비밀번호와 새로운 비밀번호를 입력해주세요</small></h4>
						<div class="list-group-item">
							<div class="list-group">
								<form action="mypwmodifyok.action" id="myPwModifyForm" method="post">
									
	            					<b>현재 비밀번호</b>
	            					<input type="password" id="pw" name="pw" class="text-field form-control" placeholder="현재 비밀번호 입력" />
                                    <span id="err1" style="color: red; font-weight: bold; display: none;">비밀번호가 틀렸습니다.</span>
	            					<br><br>
	            					
	            					<b>새 비밀번호</b>
	            					<input type="password" id="newPw1" name="newPw1" class="text-field form-control" placeholder="새 비밀번호 입력 (8~15 자리의 영문 + 숫자 + 특수문자 조합)" />
	            					<span id="err2" style="color: red; font-weight: bold; display: none;">신규 비밀번호는 8~15자의 영문, 숫자 및 특수문자를 모두 혼합하여 설정해주세요.</span> 
	            					<br><br>
	            					
	            					<b>새 비밀번호 확인</b>
	            					<input type="password" id="newPw2" name="newPw2" class="text-field form-control" placeholder="새 비밀번호 확인" />
	            					<span id="err3" style="color: red; font-weight: bold; display: none;">비밀번호와 확인값이 일치하지 않습니다.</span> 
	            					<br><br>
	            					
	            					<button type="button" class="btn btn-primary" id="pwModify-btn" style="width:100%; background-color: #1fa766;"
									> 확인 </button>
									
									
									<!-- <button type="button" class="btn btn-primary" id="login-btn" style="width:100%; background-color: #1fa766;"
									onclick="newPage()"> 확인 </button> -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 밑에 공백만드는용 ㅠ -->
			<br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br>
			
		</div>
	</div>


	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		머니로그의 푸터 부분입니다. </footer>


	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- MDB 라이브러리 추가하기 <== chart!!!! **** -->
	<script src="./js/mdb.min.js"></script>

</body>
</html>