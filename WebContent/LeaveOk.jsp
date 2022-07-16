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

	/*
	function newPage()
	{
	  window.location.href = "./메인.jsp"
	}
	*/

	
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

    <!-- 회원탈퇴 상단 아이콘 -->
   <div class="container">

		<div class="row sign-up-form mt-3">
         <div class="sign-up-process col-12" style="margin-top: 25%;">
               <div class="form-group text-center">
                  <img src="img2/smile.svg" alt="웃는얼굴" style="width: 50px;">
                  <h4 style="font-size: larger;">회원탈퇴가 완료되었습니다.</h4>
                  <h5>그 동안 <b>머니로그</b>를 이용해주셔서 감사합니다!</h5>
               </div>
               <div class="text-center mt-3">
                  <button type="button" class="btn btn-primary mb-3" style="width: 200px; background-color: #1fa766;" onclick="location.href='./loginform.action'"> 메인으로 돌아가기 </button>
               </div>
               
            </div>
      </div>
    </div>

   <script src="./js/jquery-3.2.1.min.js"></script>
   <script src="./js/popper.min.js"></script>
   <script src="./js/bootstrap.min.js"></script>
</body>

</html>