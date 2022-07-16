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
	  window.location.href = "./adUser.jsp"
	}	
*/	
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<!-- jquery -->

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
			
				<!-- 게시글 내역 -->
				<div class="col-md-12">
					<div class="list-group">
						<br>
						<h4>게시글 내역<small> [ ${user_name } ] 님이 등록한 게시글입니다.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
								<table class="table table-striped" style="max-width: 1080px;">
						            <thead>
						              <tr>
						                <th scope="col" class="mobile" style="width:80px; text-align:center;">no</th>
						                <!-- <th scope="col" class="mobile" style="width:120px; text-align:center;">게시글 번호</th> -->
						                <th scope="col" class="mobile" style="text-align:center;">제목</th>
						                <th scope="col" class="mobile" style="width:100px; text-align:center;">댓글</th>
						                <th scope="col" class="mobile" style="width:120px; text-align:center;">등록일자</th>
						                <th scope="col" class="mobile" style="width:100px; text-align:center;">조회수</th>
						              </tr>
						            </thead>
						            <tbody>
						              <!-- 
						              <tr>
						                <td scope="row" class="mobile" style="text-align:center;">5</td>
						                <td scope="row" class="mobile" style="text-align:center;">2032</td>
						                <td><a href="./boardView.html" style="color: #000000;">#20대 #2마리 #전세 #개발자 #태그</a></td>
						                <td class="mobile" style="text-align:center;">12</td>
						                <td class="mobile" style="text-align:center;">2018-01-05</td>
						                <td class="mobile" style="text-align:center;">235</td>
						              </tr>
						              -->
						                           
										<c:if test="${empty myPostList}">
										<tr>
											<td colspan="6" style="text-align: center;">머니리뷰에 게시한 게시글이 없습니다.</td>
										</tr>
										</c:if>
										
										
										<c:if test="${not empty myPostList}">
						                <c:forEach var="post" items="${myPostList }" varStatus="status">
						                <tr>
							                <td scope="row" class="mobile" style="text-align:center;">${fn:length(myPostList) - status.index }</td>
							                <%-- <td scope="row" class="mobile" style="text-align:center;">${post.post_cd }</td> --%>
							                <td><a href="moneypost.action?post_cd=${post.post_cd }" style="color: #000000;">${post.post_title }</a></td>
							                <td class="mobile" style="text-align:center;">${post.count_cmnt }</td>
							                <td class="mobile" style="text-align:center;">
							                	<fmt:parseDate value="${post.post_date }" var="post_date" pattern="yyyy-mm-dd" />
												<fmt:formatDate value="${post_date}" pattern="yyyy-mm-dd" />
							                </td>
							                <td class="mobile" style="text-align:center;">${post.post_view }</td>
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
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				
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