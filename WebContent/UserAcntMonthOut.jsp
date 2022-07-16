<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가계부 지출 내역</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
</head>
<body>
	<!-- 상단 네비게이션바 -->
	<jsp:include page="./UserNav.jsp"></jsp:include>
	    
	<div class="container mt-3">
      	<div class="row">
      		<div class="col-12" style="text-align: center;">
    			<h2>이번달 지출</h2>
    		</div>
	    </div>
	    <div class="row">
	    	<div class="col-12">
	    		${year}년 ${month}월 지출 합계 : <fmt:formatNumber value="${monthOutTot }" groupingUsed="true"></fmt:formatNumber> 원
	    	</div>
	    </div>
	    <div class="row mt-3" >
	    	<div class="col-12" >
	    		<table class="table table-striped" >
			        <thead>
			            <tr>
			                <th class="mobile" style="width: 120px; text-align: center;">날짜</th>
			                <th class="mobile" style="width: 120px; text-align: center;">1차 분류</th>
			                <th style="width: 120px; text-align: center;">2차 분류</th>
			                <th class="mobile" style="text-align: center;">상세내역</th>
			                <th style="width: 200px; text-align: center;">금액</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:if test="${empty monthOutList}">
						<tr>
							<td colspan="5" style="text-align: center;">지출 내역이 없습니다.</td>
						</tr>
						</c:if>
						
						<c:if test="${not empty monthOutList}">
						<c:forEach var="monOutList" items="${monthOutList }">
					 	<tr>
							<td class="mobile" style="text-align: center;">
								<fmt:parseDate value="${monOutList.acnt_date}" var="acnt_date" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${acnt_date}" pattern="MM-dd" />
							</td>
							<td class="mobile" style="text-align: center;">${monOutList.cate_fst_name }</td>
			                <td style="text-align: center;">${monOutList.cate_sec_name }</td>
			                <td style="text-align: center;">${monOutList.acnt_dtl_cont }</td>
			                <td class="mobile" style="text-align: center;">
     					        <fmt:formatNumber value="${monOutList.amnt }" groupingUsed="true"></fmt:formatNumber>
		                	</td>
						</tr>
					 	</c:forEach>	
					 	</c:if>
			        </tbody>
			    </table>	
	    	</div>
	    </div>
	    <div class="row">
	    	<div class="col-12">
	    		<a href="calendar.action?year=${year }&month=${month}" class="btn btn-primary float-right"
	         	style="background-color: #1fa766;">내 가계부로 돌아가기</a>
	    	</div>
	    </div>
    </div>	


	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>