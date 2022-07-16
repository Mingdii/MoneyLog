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

<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

	function checkAgree(leaveOk)
	{  
        if ( $('#agree').is(':checked') )                  // 셀렉트박스 체크됐을때 버튼 활성화
        { 
        	$('#leaveOk-btn').prop("disabled", false);
        } 
        else                                                // 셀렉트박스 해제됐을때 버튼 비활성화
        {
        	$('#leaveOk-btn').prop("disabled", true);
        }
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
						
						
				<!-- 회원탈퇴 -->
				<div class="col-md-12">
				
					<div class="list-group">
						<br>
						<h4>회원탈퇴 안내<small> 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
								<form id="leaveOk">
									
	            					<img src="./img2/board.svg"> <b>탈퇴 후 아래의 회원정보는 모두 삭제됩니다.</b>
	            					<p>아이디, 이름, 휴대폰번호는 회원의 탈퇴 신청 시 3개월 간의  데이터 보관 후 즉시 삭제됩니다.</p>
	            					<br>
	            					
	            					<img src="./img2/board.svg"> <b>탈퇴 후에도 아래의 회원정보와 게시판형 서비스에 등록한 게시물은 그대로 남아있습니다.</b>
	            					<p>가계부 내역, 머니의 전당, 문의글 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
	            					<br>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</p>
	            					<br>
	            					
	            					<input type="checkbox" id="agree" onClick="checkAgree(this.form)"> <label for="agree"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
	            					<br><br>
	            					
	            					<button type="button" class="btn btn-primary" id="leaveOk-btn"  style="width:100%; background-color: #1fa766;"
									data-toggle="modal" data-target="#modal" disabled>탈퇴하기</button>
									

									
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
		
		
	<!-- modal 만들기 -->
	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
	aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">정말 탈퇴하실건가요?</h4>
					
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidde="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<form>
						<img src="./img2/image1.jpg" width="100%;">
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="leave" onclick="location.href='./leaveok.action'">탈퇴하기</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>


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