<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String qna_cd = (String)request.getParameter("qna_cd");
%>
<!DOCTYPE html>
<html>
<head>
<title>문의하기 - 등록</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">

<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

	//keyup 시 발생.. 순서 중요
	$(document).ready(function()
	{	
		//제목 입력하면 에러 사라지게 처리
		$("#qna_title").keyup(function() 
		{
			$("#err1").css("display", "none");
			return;
		});
		
		// 내용 입력하면 에러 사라지게 처리
		$("#qna_cont").keyup(function() 
		{
			$("#err2").css("display", "none");
			return;
		});
				
	});


	$(function()
	{
		$("#qnaReg-btn").click(function()    
		{
					
			if($("#qna_title").val()=="")   
			{
				$("#err1").css("display", "inline");
				$("#qna_title").focus();
				return;
			}
			
			
			if($("#qna_cont").val()=="")
			{
				$("#err2").css("display", "inline");
				$("#qna_cont").focus();
				return;
			}
			
			//alert("등록되었습니다.");
			$("#qnaContForm").submit();
			
		});
				
	});
		
</script>

</head>

<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavCs.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
		<div class="row d-flex d-md-block flex-nowrap wrapper">
           
            <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            	<!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./UserMenuCs.jsp"></jsp:include>
            </nav>            
        </div>
    
	<!-- 코드 들어가기 -->	
	
			<div class="container">
			<div class="row">
						
				<div class="col-md-12">
				
					<div class="list-group">
						<br>
						<h4>문의글 등록</h4>
						<div class="list-group-item">
							<div class="list-group">
								<form action="userqnacont.action" id="qnaContForm">
									
	            					<b>제목<%=qna_cd %></b>
	            					<input type="text" id="qna_title" name="qna_title" style="padding-left:15px; width: 500px; height:35px;">
	            					<span id="err1" style="color: red; display: none;">※ 제목을 입력하세요.</span>	
	            					<br><br>
	            					
	            					<b>작성자</b>
	            					<input type="text" id="user_name" name="user_name" value="${user_name }" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
	            					<br><br>
	            					
	            					<b>작성일자</b>
	            					<input type="text" id="qna_date"  name="qna_date" value="${qna_date }" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
	            					<br><br>
	            					
	            					<b>내용</b>
	            					<textarea id="qna_cont" name="qna_cont" rows="10" cols="60" style="vertical-align: top;"></textarea>
	            					<span id="err2" style="color: red; display: none;">※ 내용을 입력하세요.</span>	
	            					<br><br>
	            	
	            					
	            					<button type="button" class="btn btn-primary"  id="qnaReg-btn" style="background-color: #1fa766; float: right;"  
	            					> 등록하기 </button>
									<button type="reset" class="btn btn-secondary" style="background-color: #1fa766; float: right;"  
									onclick="location.href='./userqnalist.action'">취소하기</button>
									
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
