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

    // 비밀번호 틀려서 다시 이 페이지로 돌아올 때 메세지 출력
	var msg = "<c:out value='${msg}'/>";
	if(!msg=="")
	{
		alert(msg);
	}

    $(function()
	{
		$("#check_btn").click(function()      // ※ button id : input_btn 으로 되어 있어서 수정
		{
			$("#err").css("display", "none");
					
			if($("#user_id").val()=="")   // f12로 임의로 아이디 ""로 변경할 수 있길래 함 넣어봤음..
			{
					$("#err").html("※ 아이디를 입력하세요.").css("display", "inline");
					return;
			}
			
			if($("#user_pw").val()=="")
			{
					$("#err").html("※ 비밀번호를 입력하세요.").css("display", "inline");
					return;
			}
			
			$("#myCheckPwForm").submit();	// 서브밋 하면 myinfomodify.action 처리
			
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
			
				<!-- 비밀번호 확인 -->
				<div class="col-md-12">
				
				
					<div class="list-group">
						<br>
						<h4>내 정보 수정<small> 본인확인을 위해 비밀번호를 입력해 주세요.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
								<form action="myinfomodify.action" id="myCheckPwForm" method="post">
									<input type="text" id="user_id" name="id" class="text-field form-control" placeholder="아이디"
									value=${user_id } readonly="readonly">
	            					<input type="password" id="user_pw" name="pw" class="text-field form-control" placeholder="비밀번호" />
	            					<br>
	            					<button type="button" class="btn btn-primary" id="check_btn" 
	            					        style="width:100%; background-color: #1fa766;"> 확인 </button>
									
									<!-- <button type="button" class="btn btn-primary" id="login-btn" style="width:100%; background-color: #1fa766;"
									onclick="newPage()"> 확인 </button> -->
									
								</form>
							</div>
						</div>
						<div>
                           <span id="err" style="color: red; display: none;"></span>
                        </div>
					</div>
				</div>
				
				
				
				<!-- 밑에 공백만드는용 ㅠ -->
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				
				
				
			</div>
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