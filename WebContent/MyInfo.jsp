<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script type="text/javascript">
	function newPage()
	{
	  window.location.href = "./adUserList.jsp"
	}
	
	function newPage2()
	{
	  window.location.href = "./myInfoModifyOk.jsp"
	}
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
				<!-- 계정정보 -->
				<div class="col-md-12">

					<div class="list-group">
						<br>
						<h4>계정정보<small> [ 김태형 ] 님의 기본 계정정보 입니다.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
								<table class="table">
									<tbody>
									
										<!-- 계정 정보 -->
										<tr>
											<th style="width: 80px; text-align: center;">이름</th>
											<th class="mobile" style="width: 120px; text-align: center;">주민번호</th>
											<th class="mobile" style="width: 120px; text-align: center;">아이디</th>
											<th class="mobile" style="width: 120px; text-align: center;">전화번호</th>
										</tr>
										
										<tr>
											<td style="text-align: center;">이윤윤</td>
											<td class="mobile" style="text-align: center;">990501-1*****</td>
											<td class="mobile" style="text-align: center;">test@test.com</td>
											<td class="mobile" style="width: 100px; text-align: center;">
												<input type="text" name="tel" class="text-field form-control" value="010-2222-2222" disabled="disabled">
											</td>
										</tr>
								
									</tbody>
								</table>
								
								
							</div>
						</div>
					</div>
				</div>
						
						
				<!-- 활용정보1 -->
				<div class="col-md-12">
					<br>
					<div class="list-group">
						<h4>활용정보<small> [ 김태형 ] 님의 활용정보 입니다.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
							<form>
								<table class="table">
									<tbody>
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">결혼여부</th>
											<th style="text-align: center;">자녀수</th>
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">미혼</option>
											    	<option value="1">기혼</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">없음</option>
											    	<option value="1">1명</option>
												    <option value="2">2명</option>
												    <option value="3">3명 이상</option>
											  	</select>
											</td>
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">총가구구성원수</th>
											<th style="text-align: center;">주거형태</th>
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0">1명</option>
											    	<option value="1" selected="selected">2명</option>
												    <option value="2">3명</option>
												    <option value="3">4명 이상</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">월세</option>
											    	<option value="1">전세</option>
												    <option value="2">자가</option>
											  	</select>
											</td>
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">반려동물</th>
											<th style="text-align: center;">차량운용대수</th>
											
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">없음</option>
											    	<option value="1">1마리</option>
												    <option value="2">2마리</option>
												    <option value="3">3마리 이상</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">없음</option>
											    	<option value="1">1대</option>
												    <option value="2">2대</option>
												    <option value="3">3대 이상</option>
											  	</select>
											</td>
											
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">지역 1차</th>
											<th style="text-align: center;">지역 2차</th>
										</tr>
												
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">서울</option>
											    	<option value="1">경기</option>
												    <option value="2">생략</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">중구</option>
											    	<option value="1">강남구</option>
												    <option value="2">생략</option>
											  	</select>
											</td>
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">직업 1차</th>
											<th style="text-align: center;">직업 2차</th>
										</tr>
												
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">IT/개발</option>
											    	<option value="1">교육</option>
												    <option value="2">생략</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" disabled="disabled">
												    <option value="0" selected="selected">프론트엔드</option>
											    	<option value="1">빅데이터</option>
												    <option value="2">생략</option>
											  	</select>
											</td>
										</tr>
										
									</tbody>
								</table>
								
							</form>
							</div>
						</div>
					</div>
				</div>
				
			
				
			</div>
			
			
			<!-- 밑에 공백만드는용 ㅠ -->
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