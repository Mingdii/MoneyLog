<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function cancelBtn()
	{
		window.location.href = "moneypostcancel.action"
	}
	
	// 페이지 열렸을 때 title 구성
	$(document).ready(function(){
		//alert("제이쿼리테스트");
		changeMonth();
	});
	
	// 선택월 바꿀때마다 title 재구성
	function changeMonth()
	{
		var item = document.getElementById("acnt_ym");
		var title = document.getElementById("post_title").value;
		var itemId = item.options[item.selectedIndex].value;
		
		//alert(itemId);
		document.getElementById("post_title").value = "["+((itemId.substr(4,5)).substr(0,1)==0?itemId.substr(5,5):itemId.substr(4,5)) + "월] "+title;
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
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>
	
	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container">
			<div class="row">
				
						
				<!-- 활용정보1 -->
				<div class="col-md-12">
					<br>
					<div class="list-group">
						<h4>머니리뷰<small> 게시글 작성 </small></h4>
						<div class="list-group-item">
							<div class="list-group">
							
							
							<c:forEach var="post" items="${postFind }">
				
							
								<form action = "moneypostupdate.action" method="post" id="myForm">
						
									<div class="form-group">
										<label>제목</label>
										<input type="text" class="form-control" id="post_title" name="post_title" value="${post.post_title }"
										readonly="readonly">
									</div>
									<br>
									<div class="form-group">
										<label>선택 월</label>
										<select class="form-control selectpicker" id="acnt_ym" name="acnt_ym" style="width: 50%;">
				
											<option value= ${post.acnt_ym }>
												<fmt:parseDate value="${post.acnt_ym}" var="year" pattern="yyyyMM" />
												<fmt:formatDate value="${year}" pattern="yyyy" />년
												<fmt:parseDate value="${post.acnt_ym}" var="month" pattern="yyyyMM" />
												<fmt:formatDate value="${month}" pattern="MM" />월
											</option>
								
									  	</select>
									</div>
									
									
									<br>
									<div class="form-group" style="width: 49%;">
										<label>상세내역 공개여부</label>
										
										
										<div class="form-check">
										<input type="radio" class="btn-check" name="dtl_select_cd" id="dtl_select_cd1" checked="checked" value=1>
										<label class="btn btn-secondary" for="dtl_select_cd1">
											공개
										</label>
										
										
										<input type="radio" class="btn-check" name="dtl_select_cd" id="dtl_select_cd2" value=2>
										<label class="btn btn-secondary" for="dtl_select_cd2">
											비공개
										</label>
										</div>
									</div>
									
									
									<br>
									<div class="form-group">
										<label>이 달의 가게부 소감을 작성해주세요!</label>
										<textarea class="form-control" id="opinion" name="opinion" style="height: 180px;">${post.opinion }</textarea>
									</div>
									
									<div>
										<input type="hidden" class="form-control" id="user_dstn_cd" name="user_dstn_cd" value="${post.user_dstn_cd }">
										<input type="hidden" class="form-control" id="post_cd" name="post_cd" value="${post.post_cd }">
									</div>
									
									<div class="form-group">
										<button type="reset" class="btn btn-secondary" onclick="cancelBtn()">취소</button>
										<button type="submit" class="btn btn-success">수정완료</button>
									</div>
									
								</form>
								
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
				
			
				
			</div>
			
			
			<!-- 밑에 공백만드는용 ㅠ -->
			<br><br><br><br><br><br><br><br><br><br>
			
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