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
<title>문의사항 게시판</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">

<script src="./js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
    /*
	function sendIt()
	{
		alert("검색");
	}
	*/
	

	
</script>
</head>
<body>
	<header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./UserNavCs.jsp"></jsp:include>
	</header>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
		<div class="row d-flex d-md-block flex-nowrap wrapper">
           
            <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            	<!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./UserMenuCs.jsp"></jsp:include>
            </nav>            
        </div>
    
	<!-- 게시판 코드 들어가기 -->	
	
	<div class="container">
		<div class="row">
			<div class="col-12" style="margin-top: 30px;" >
				<div id="List_title">
						<!-- 문의사항 -->
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form action="" name="searchForm" method="post">
					      <select name="searchKey" class="selectField">
					           <option value="subject" selected="selected">제목</option>
					           <option value="content">내용</option>
					           <option value="name">작성자</option>
					      </select>
				<input type="text" name="searchValue" class="textField">
				<button type="submit" value="검색" class="btn btn-primary" style="background-color: #1fa766; height: 35px;" onclick="sendIt()">검색</button>
				</form>
			</div>
		</div>
	</div>
					
	<div class="container">
		<div class="row">
				<div class="col-12">
					 <table id="customers" class="table">
					  <thead>
					     <tr>
					        <!-- 항목 -->
					         <th>no</th>
					         <th>제목</th>
					         <th>작성자</th> 
					         <th>답변</th> 
					         <th>등록일자</th>
					         <th>조회수</th>
					      </tr>	
			    	 </thead>
			         <tbody>
			            
		             
						<c:if test="${empty userQnaList}">
						<tr>
							<td colspan="6" style="text-align: center;">등록된 문의글이 없습니다.</td>
						</tr>
						</c:if>
						
						
						<c:if test="${not empty userQnaList}">
		                <c:forEach var="userQna" items="${userQnaList }" varStatus="status">
		                <tr>
			                <td scope="row" class="mobile" style="text-align:center;">${fn:length(userQnaList) - status.index }</td>
			                <td><a href="./userqnaselect.action?qna_cd=${userQna.qna_cd }" style="color: #000000;">${userQna.qna_title }</a></td>
			                <td class="mobile" style="text-align:center;">${userQna.user_name }</td>
			                <td class="mobile" style="text-align:center;">${userQna.ad_ansr_cd}</td>
			                <td class="mobile" style="text-align:center;">
			                	<fmt:parseDate value="${userQna.qna_date }" var="qna_date" pattern="yyyy-mm-dd" />
								<fmt:formatDate value="${qna_date}" pattern="yyyy-mm-dd" />
			                </td>
			                <td class="mobile" style="text-align:center;">${userQna.qna_view }</td>
						</tr>
						</c:forEach>
						</c:if>

		            </tbody>
				      </table>
					
					<div class="row">
						<div class="col">
					         <button type="button" class="btn btn-primary"  id="qnaForm-btn" style="background-color: #1fa766; float: right; width: 10%;" 
					         onclick="location.href='./userqnareg.action'">문의하기</button>
					    </div>
					</div>    
					  
					<!-- ※ 가로 세로 스크롤이 생김 -->
					<div class="row">
						<div class="col" style="place-items: center; display: grid;">
							<div id="paging">
								<p>1 <span style="color: #92B4EC;">Prev</span> 21 22 23 24 25 26 27 28 29 30 <span style="color: #92B4EC;">Next</span> 54</p>		
						 	</div>	
						</div>
					</div>
			 </div>
		</div>
	</div>
</div>				

	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>


</body>
</html>