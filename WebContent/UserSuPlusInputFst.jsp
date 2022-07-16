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
<title>추가정보1</title>

<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<style type="text/css">
	
	#errMsg
	{
		color: red;
		font-size: small;
		display: none;
		width: 95%;
		text-align: center;
	}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
	
	$(function()
	{ 	
		$("#mrgSelect").click(function()
		{
			var mrgSelect = $("select[name=mrgSelect]").val() + 1;
		});
		
		$("#childSelect").click(function()
		{
			var childSelect = $("select[name=childSelect]").val() + 1;
		});
		
		$("#fmlSelect").click(function()
		{
			var fmlSelect = $("select[name=fmlSelect]").val() + 1;
		});
		
		$("#houseSelect").click(function()
		{
			var houseSelect = $("select[name=houseSelect]").val() + 1;
		});
		
		$("#petSelect").click(function()
		{
			var petSelect = $("select[name=petSelect]").val() + 1;
		});
		
		$("#carSelect").click(function()
		{
			var carSelect = $("select[name=carSelect]").val() + 1;
		});
		
		$("#next-btn").click(function()
		{	
			
			if ( $("select[name=mrgSelect]").val()=="0" || $("select[name=childSelect]").val()=="0"|| $("select[name=fmlSelect]").val()=="0" 
					|| $("select[name=houseSelect]").val()=="0"  || $("select[name=petSelect]").val()=="0" || $("select[name=carSelect]").val()=="0" )
			{
				$("#errMsg").show();
				return false;	
			}

			
				$("#errPwCheck").hide();
				$("#joinForm").submit();
			
		});

	});

</script>
</head>
<body>
<div class="wrap">
	<header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./UserNav.jsp"></jsp:include>
	</header>

	<main id="userSuPlusInputFst">
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
	                        <img src="./img2/user-check-white.svg" alt="">
	                        <br>
	                        회원가입 완료
	                    </div>
	                </div>
	            </div>
	        </div>
	
			<div class="row mt-3 sign-up-form">
				<div class="col-12">
					<h3 id="sign-up-info">추가정보</h3>
				</div>
			</div>
	
			<div class="row sign-up-form mt-3">
				<div class="col-12">
					<div class="list-group">
						<!-- 머니리뷰 프로그레스바 -->
						<div class="progress">
		
							<div class="progress-bar progress-bar bg-warning progress-bar-animated"
								role="progressbar"
								aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
							</div>
						</div>
					</div>
				</div>
			</div>  
			
					<!-- ${user_id} ${user_pw} ${user_name} ${user_tel} 테스트 완료 -->
					<!-- ★★ 주민등록번호 앞자리 + 뒷자리 문자열 결합해서 변수에 담기 ★★ -->
	        		<!-- ★ ==선택== 일때는 다음 페이지로 넘어가지 않도록 제어하기!!!! -->
	        
	        <div class="row bg-light sign-up-form mt-3">
				<div class="sign-up-process col-12"> <!-- plussecond.action -->
	                <form class="pt-3 md-3" action="plussecond.action" method="post" id="plusInputForm" style="max-width: 720px">
						<div class="form-group">
							<label class="sign-up-title">주민등록번호</label>
							<div class="row">
								<input type="text" id="ssn1" name="ssn1" class="form-control col-4 mr-1 ml-3  form-checking" placeholder="주민번호 앞자리" required> - <input type="text" id="ssn2" name="ssn2" class="form-control col-1 ml-1" required> 
								<input type="text" class="form-control col-1" disabled placeholder="*">
								<input type="text" class="form-control col-1" disabled placeholder="*">
								<input type="text" class="form-control col-1" disabled placeholder="*">
								<input type="text" class="form-control col-1" disabled placeholder="*">
								<input type="text" class="form-control col-1" disabled placeholder="*">
								<input type="text" class="form-control col-1" disabled placeholder="*">
							</div>
							
							<table class="table">
								<tbody>
									<!-- 계정 정보 -->
									<tr>
										<th class="sign-up-title">결혼여부</th>
										<th class="sign-up-title">자녀수</th>
									</tr>
									
									<tr>
										<td>					
											<select class="form-control selectpicker" id="mrgSelect" name="mrgSelect">
												<option value="0">==선택==</option>
												<option value="1">기혼</option>
												<option value="2">미혼</option>
											</select>
	
										</td>
										<td>
											<select class="form-control selectpicker" id="childSelect" name="childSelect">
												<option value="0" selected="selected">==선택==</option>
												<option value="1">없음</option>
												<option value="2">1명</option>
												<option value="3">2명</option>
												<option value="4">3명 이상</option>
											</select>
										</td>
									</tr>
									
									<!-- 계정 정보 -->
									<tr>
										<th class="sign-up-title">총가구구성원수</th>
										<th class="sign-up-title">주거형태</th>
									</tr>
									
									<tr>
										<td>
											<select class="form-control selectpicker" id="fmlSelect" name="fmlSelect">
												<option value="0" selected="selected">==선택==</option>
												<option value="1">1인</option>
												<option value="2">2인</option>
												<option value="3">3인</option>
												<option value="4">4인</option>
												<option value="5">5인 이상</option>
											</select>
										</td>
										<td>
											<select class="form-control selectpicker" id="houseSelect" name="houseSelect">
												<option value="0" selected="selected">==선택==</option>
												<option value="1">월세</option>
												<option value="2">전세</option>
												<option value="3">자가</option>
											</select>
										</td>
									</tr>
									
									<!-- 계정 정보 -->
									<tr>
										<th class="sign-up-title">반려동물</th>
										<th class="sign-up-title">차량운용대수</th>
										
									</tr>
									
									<tr>
										<td>
											<select class="form-control selectpicker" id="petSelect" name="petSelect">
												<option value="0" selected="selected">==선택==</option>
												<option value="1">없음</option>
												<option value="2">1마리</option>
												<option value="3">2마리</option>
												<option value="4">3마리 이상</option>
											</select>
										</td>
										<td>
											<select class="form-control selectpicker" id="carSelect" name="carSelect">
												<option value="0" selected="selected">==선택==</option>
												<option value="1">없음</option>
												<option value="2">1대</option>
												<option value="3">2대</option>
												<option value="4">3대 이상</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table> <!-- 이전으로 갈 때에는 필수사항 모두 입력하지 않아도 넘어갈 수 있도록 별도의 처리 필요 ★ -->
							<div>
								<button type="submit" class="btn btn-primary pre-btn" onclick = "location.href='preinfoinput.action'">이전</button>
								<button id="next-btn" type="submit" class="btn btn-primary" >다음</button>
									<%-- <input type="hidden" name="ssnResult" value="${ssnResult}" > --%>
									<!-- <span id="errForm">※ 필수 입력 항목을 선택하세요.</span>		 -->
								<div style="place-items: center; display: grid;">
									<div id="errMsg" class="alert alert-danger">필수 사항을 모두 선택해야 합니다.</div>
								</div>
							</div>
						</div>
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