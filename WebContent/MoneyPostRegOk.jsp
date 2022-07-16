<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String user_dstn_cd = (String)session.getAttribute("user_dstn_cd");
	String acnt_ym = request.getParameter("acnt_ym");
%>

<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script type="text/javascript">

	function moneypostInsert()
	{
	  <%-- window.location.href = "./moneypost.action?user_dstn_cd="+<%=user_dstn_cd%>+"&post_cd="+${post_cd}+"&acnt_ym="+<%=acnt_ym%> --%>
	  window.location.href = "./moneypost.action?&post_cd="+${post_cd }
	}
	
	function userAcntCalendar()
	{
	  window.location.href = "./UserAcntCalendar.jsp"
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

    <!-- 회원가입 상단 아이콘 -->
   <div class="container">
		<div class="row sign-up-form mt-3">
         <div class="sign-up-process col-12" style="margin-top: 25%;">
               <div class="form-group text-center">
                  <img src="img2/smile.svg" alt="웃는얼굴" style="width: 50px;">
                  <h4 style="font-size: larger;">머니로그 등록이 완료되었습니다.</h4>
               </div>
               <div class="text-center mt-3">
                  <button type="button" class="btn btn-primary mb-3" style="width: 200px; background-color: #1fa766;" onclick="moneypostInsert()"> 내 <b>게시글</b> 확인하기 </button>
                  <br>
                  <button type="button" class="btn btn-primary mb-3" style="width: 200px; background-color: #1fa766;" onclick="userAcntCalendar()"> 내 <b>가게부</b>로 돌아가기 </button>
               </div>
               
            </div>
      </div>
    </div>

    <script src="./js/jquery-3.2.1.min.js"></script>
   <script src="./js/popper.min.js"></script>
   <script src="./js/bootstrap.min.js"></script>
</body>

</html>