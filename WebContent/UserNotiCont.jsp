<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
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
		<!-- 
		<div class="container">
			<div class="row">
				<div class="col-md-12" id="List_title" style="margin-top: 30px;">
					공지사항
				</div>
			</div>
		</div>
		-->
		<div class="container">
				<div class="row">
				
						<table id="cont" class="table2 col-12">
						     <tr>
						         <th>작성일</th>
						      	 <td>
									<fmt:parseDate value="${userNotiSelect.noti_date }" var="noti_date" pattern="yyyy-mm-dd" />
									<fmt:formatDate value="${noti_date}" pattern="yyyy-mm-dd" />						      	 <td>
								 </td>
						     </tr>
						     <tr>    
						         <th>조회수</th>
						         <td>
						         	<input type="text" id="noti_view" name="noti_view" value="${userNotiSelect.noti_view }">
						         </td>
						     </tr>  
						     <tr>    
						     <tr>    
						         <th>제목</th>
						         <td>
						         	<input type="text" id="noti_title" name="noti_title" value="${userNotiSelect.noti_title }">
						         </td>
						     </tr>  
						     <tr>    
						         <th>내용</th>
						         <td>
						         	<textarea name="content" rows="10" cols="60" readonly="readonly">${userNotiSelect.noti_cont }</textarea>
						     	 </td>    
						     </tr>
						</table>
				</div>			
				
				<div class="row">
					<div class="col-12" style="margin-top: 10px; padding-left: 30px;">				
						<table class="table3">
							<tr>
								<td>이전글 : (${userNotiSelect.noti_cd}) 머니로그 가계부 관련 공지사항입니다.</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-12" style="margin-top: 10px; padding-left: 30px;">				
						<table class="table3">
							<tr>
								<td>다음글 : (${userNotiSelect.noti_cd}) 머니리뷰 관련 공지사항입니다.</td>
							</tr>
						</table>
					</div>
				</div>	
					
				<div class="row">
						<div class="col-12" style="margin-top: 20px;">
								<button type="submit" class="btn btn-primary" style="background-color: #1fa766; float: right;"
								onclick="javascript:location.href='<%=cp%>/usernotilist.action'">목록</button>
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