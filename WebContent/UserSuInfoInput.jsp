<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 입력 - 기본정보</title>

<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script src="./js/userTerms.js"></script>
<style type="text/css">
	
	#errForm, #errPw, #errPwCheck, #errId, #errIdCheck, #errName
	{
		color: red;
		font-size: small;
		display: none;
	}
	
	#pwOk, #idOk, #nameOk
	{
		color: green;
		font-size: small;
		display: none;
	}
	
</style>

<script type="text/javascript">
 
 	// 휴대폰번호 하이픈(-) 자동 삽입 정규식
 	function autoHyphen(user_tel)
	{
		var phoneNum = $("#user_tel").val();
		phoneNum = $.trim(phoneNum); 			// 앞뒤 공백제거
		phoneNum = phoneNum.replace(/-/gi, ""); // - 하이픈 제거
		phoneNum = phoneNum.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, "$1-$2-$3");
		user_tel = phoneNum;
		//alert(user_tel);
	}
 
 	 // 이메일 형식의 아이디 확인
	 function idForm(user_id)
	{
		var id = $("#user_id").val();
			
		// 검증에 사용할 정규식 변수 regExp에 저장
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if (id.match(regExp) != null) 
		{
		    $("#errIdCheck").hide();
		}
		else 
		{
			$("#errIdCheck").show();
		}
	}

 	 
	$(function()
	{
		$("#user_id").focusout(function()
		{	
			var user_id = $('#user_id').val(); // 아이디 가져오기
			
			$.ajax
			({
				url : "checkid.action"
			  , type : "POST"
			  , data : {user_id : user_id}
			  , dataType : "json"      // check~!!!
		      , success : function(result)
		      {		    	  
		    	  if(result.checkId == 0)
		    	  {  
		             //$("#checkId"). html('사용할 수 있는 아이디입니다.');
		             //$("#checkId").css('color', 'green');
		             $("#idOk").show();
		             $("#errId").hide();
		             
		    	  }
		    	  else
		    	  {
		             //$("#checkId").html('사용할 수 없는 아이디입니다.');
		             //$("#checkId").css('color', 'red');
			         $("#idOk").hide();
			         $("#errId").show(); 
		    	  }
		      }
			  , error : function(e)
		        {
		            alert(e.responseText);
		        }
			}) 
		});
		
		// 비밀번호 검사
		$("#user_pw").keyup(function()
		{
			var user_pw = $("#user_pw").val();
			var pw_rule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;  // 정규표현식
			
			if(!pw_rule.test(user_pw))
			{
				$("#errPw").show();
				
			}
			else
				$("#errPw").hide();
		});
		
		
		// 비밀번호 == 비밀번호 확인 검사
		$("#pwCheck").keyup(function()
		{
			var user_pw = $("#user_pw").val();
			
			var pwCheck = $("#pwCheck").val();
			
			if (user_pw != "" || pwCheck != "")
			{
				if(user_pw == pwCheck)
				{
					 $("#pwOk").show();
					 $("#errPwCheck").hide();
				}
				else
				{
					 $("#pwOk").hide();
					 $("#errPwCheck").show();
				}
			}
		});
			
		// 이름에 한글만 입력하게 하여 영문과 숫자, 특문은 자동으로 지워지게
		$("#user_name").keyup(function()
		{
			var user_name = $(this).val();
			$(this).val((user_name.replace(/[[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}= ]/g,'')));
			
		});   
		

		$("#nextBtn").click(function()
		{	
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			$("#errForm").css("display", "none");
			$("#errCheck").css("display", "none");
					
			if ( $("#user_id").val()=="" || $("#user_pw").val()==""|| $("#pwCheck").val()=="" 
					|| $("#user_name").val()==""  || $("#user_tel").val()=="" )
			{
				$("#errForm").css("display" ,"inline");
				return;
			} 
					
			$("#joinForm").submit();
				
		});
		
	});
	
	
</script>

</head>
<body>
	<div class="wrap">
		<header>
			<!-- ○ 상단 네비게이션 include -->
			<jsp:include page="./GuestNavTerm.jsp"></jsp:include>
		</header>
	
		<main id="userSuInfoInput">
			<!-- 회원가입 상단 아이콘 -->
			<div class="container-fixed m-4">
		        <div class="row sign-up-form">
		            <h2 id="sign-up-intro">회원가입 <span id="sign-up-moneylog">MONEYLOG</span></h2>
		        </div>
		        <div class="row sign-up-form">
		            <div class="sign-up-process col-12">
		                <div class="row">
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/file-text-white.svg" alt="약관동의아이콘">
		                        <br>
		                        약관동의
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/search-white.svg" alt="본인인증아이콘">
		                        <br>
		                        본인인증
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/user-plus-black.svg" alt="회원정보입력">
		                        <br>
		                        회원정보 입력
		                    </div>
		                    <div class="col-3 sign-up-icon">
		                        <img src="./img2/user-check-white.svg" alt="회원가입완료">
		                        <br>
		                        회원가입 완료
		                    </div>
		                </div>
		            </div>
		        </div>
		
				<div class="row mt-3 sign-up-form">
					<div class="col-12">
						<h3 id="sign-up-info">기본정보</h3>
					</div>
				</div>
		
				<div class="row sign-up-form mt-3">
					<div class="col-12">
						<div class="list-group">
							<!-- 머니리뷰 프로그레스바 -->
							<div class="progress">
			
								<div class="progress-bar bg-warning progress-bar-animated"
									role="progressbar"
									aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
								</div>
							</div>
						</div>
					</div>
				</div>
			
			
		        <div class="row bg-light sign-up-form mt-3">
					<div class="sign-up-process col-12">
		                
		                <!-- plusfirst.action ? join_ok -->
		                <form action="plusfirst.action" method="post" id="joinForm" name="joinForm" class="pt-3 md-3" style="max-width: 720px">
							
							<div class="form-group">
								<label>아이디</label> 
								<input type="text" id="user_id" name="user_id" class="input_id form-control" placeholder="아이디를 입력하세요." oninput="idForm(this)" required>
								<span id="checkId" style="font-size: small;"></span>
								<div class="alert alert-danger" id="errIdCheck">※ 정상적인 이메일 형식의 아이디를 입력하세요</div>
								<div class="alert alert-success" id="idOk">중복되지 않은 아이디입니다.</div>
								<div class="alert alert-danger" id="errId">※ 중복되어 사용할 수 없는 아이디입니다.</div>
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호</label>
								<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호를 입력하세요." maxlength="15" required>
								<div class="alert alert-danger" id="errPw">※ 8~15 자리의 영문 + 숫자 + 특수문자 조합 비밀번호를 입력해주세요.</div>
							</div>
							<div class="form-group">
								<label for="pwCheck">비밀번호 확인</label>
								<input type="password" id="pwCheck" name="pwCheck" class="form-control" placeholder="비밀번호 확인을 입력하세요." maxlength="15" required>
								<div class="alert alert-danger" id="errPwCheck">※ 비밀번호가 일치하지 않습니다.</div>
								<div class="alert alert-success" id="pwOk">비밀번호가 일치합니다.</div>
		
							</div>
							<div class="form-group">
								<label for="user_name">이름</label>
								<input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름을 입력하세요." required>
								<div class="alert alert-danger" id="errName">※ 한글만 입력할 수 있습니다.</div>
							</div>
							<div class="form-group">
								<label for="user_tel">휴대폰번호</label>
								<input type="text" id="user_tel" name="user_tel" class="form-control" placeholder="휴대폰 번호를 입력해주세요." oninput="autoHyphen(this)" maxlength="13">
							</div>
							<button id="nextBtn" type="submit" class="btn btn-primary" >다음</button>
								<span id="errForm">※ 필수 입력 항목을 입력하세요.</span>		
						</form>
		            </div>
				</div>
		    </div>
		</main>
	</div>

    <script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>