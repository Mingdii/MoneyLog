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

<script type="text/javascript">
/*
	function newPage()
	{
	  window.location.href = "./adUserList.jsp"
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
			
				<!-- 문의글 내역 -->
				<div class="col-md-12">
					<div class="list-group">
						<br>
						<h4>문의 내역<small> [ ${user_name } ] 님이 등록한 문의글입니다.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
								<table class="table table-striped" style="max-width: 1080px;">
						            <thead>
						              <tr>
						                <th scope="col" class="mobile" style="width:100px; text-align:center;">no</th>
						                <!-- <th scope="col" class="mobile" style="width:120px; text-align:center;">문의 번호</th> -->
						                <th scope="col" class="mobile" style="text-align:center;">문의 제목</th>
						                <th scope="col" class="mobile" style="width:140px; text-align:center;">날짜</th>
						              </tr>
						            </thead>
						            <tbody>
						              <!--  
						              <tr>
						                <td scope="row" class="mobile" style="text-align:center;">5</td>
						                <td scope="row" class="mobile" style="text-align:center;">
						                	<a href="./boardView.html" style="color: #000000;">2032</a>
						                </td>
						                <td> 문의글에 글 올려도 되나요 </td>
						                <td class="mobile" style="text-align:center;">2018-01-05</td>
						              </tr>
						              -->	
						              
						              <c:if test="${empty myQnaList}">
									  <tr>
										  <td colspan="4" style="text-align: center;">문의하신 내역이 없습니다.</td>
									  </tr>
									  </c:if>
									  
									  <c:if test="${not empty myQnaList}">
						               <c:forEach var="qna" items="${myQnaList }" varStatus="status">
						                <tr>
							                <td scope="row" class="mobile" style="text-align:center;">${fn:length(myQnaList) - status.index }</td>
						              		<%-- <td scope="row" class="mobile" style="text-align:center;">${qna.qna_cd }</td> --%>
						                	<td>
						                		<a href="userqnaselect.action?qna_cd=${qna.qna_cd }" style="color: #000000;">${qna.qna_title }</a>
						                	</td>
							                <td class="mobile" style="text-align:center;">
							                	<fmt:parseDate value="${qna.qna_date }" var="qna_date" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${qna_date}" pattern="yyyy-MM-dd" />
							                </td>
										</tr>
										</c:forEach>
						                </c:if>
						                
						            </tbody>
						          </table>
							</div>
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