<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<title>머니리뷰 게시판</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
		<!-- 게시판 코드 들어가기 -->	

		<div class="container">
			<div class="row">
				<div class="col-12" style="place-items: center; display: grid; margin-top: 30px;" >
					<div id="moneyList_title">
							MONEY REVIEW
					</div>
				</div>
			</div>
		</div>
		
		
	<!-- 데이터 잘 왔는지 테스트용 - 통합시 삭제하기 -->
	<!-- 전체 게시글 수 : ${allPostCount }<br>
	페이지 수 : ${pageCount }<br>-->
	<!-- ------------------------------------------- -->
	
	
		
		<div class="container">
				<div class="row">
						<div class="col-12">
							
							 <table class="table">
							     <tr>
							        <!-- 항목 -->
							         <th>no</th>
							         <th>제목</th>
							         <th>댓글</th>
							         <th>등록일자</th>
							         <th>조회수</th>
							      </tr>	
							
							
							<c:if test="${empty getPostList}">
							<tr>
								<td>머니리뷰 게시글이 없습니다.</td>
							</tr>
							</c:if>
							 	
						 	<c:forEach var="list" items="${getPostList }" varStatus="loop">
						 		<tr>
									<td style="width: 110px; text-align: center;">
										${list.rnum }
										<%-- ${fn:length(getPostList) - loop.index } --%>
									</td>
						  			<td>
						  				<a href="./moneypost.action?post_cd=${list.post_cd}">${list.post_title}</a>
						  			</td>
						  		
						  			<td>
						  				${list.count_cmnt}
						  			</td>
						  		
						  			<td>
						  				<fmt:parseDate value="${list.post_date}" var="post_date" pattern="yyyy-MM-dd" />
                       					<fmt:formatDate value="${post_date}" pattern="yyyy-MM-dd" />
						  			</td>
						  		
						  			<td>
						  				${list.post_view}
						  			</td>
						  		</tr>
							</c:forEach>
						      </table>
							  
							<!-- ※ 스크롤 가로 세로 제한되어 있음 -->
							<div class="row">
								<div class="col-12" style="place-items: center; display: grid;">
									<div id="paging">
										<p>${strList }${start }${end }</p>		
								 	</div>	
								 </div>
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

  </div>




</body>
</html>