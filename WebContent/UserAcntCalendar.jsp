<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
	// 여기 삭제

	// 세션에서 이용자활용정보코드 가져오기
    String user_dstn_cd = (String)session.getAttribute("user_dstn_cd");
	
%>
<%

	// 3번째 방법
	int pigTotCount = request.getAttribute("pigTotCount") != null ? (Integer)request.getAttribute("pigTotCount") : 0;
	int pigMonthCount = request.getAttribute("pigMonthCount") != null ? (Integer)request.getAttribute("pigMonthCount") : 0;
	
	int result1 = pigTotCount > 60 ? 60 : pigTotCount;
	int result2 = pigMonthCount > 60 ? 60 : pigTotCount;
	
	double pigCount = (result1+result2)/(double)120;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가계부</title>
<style type="text/css">
	td {width: 14%; height: 100px;}
	.in {color: blue;}
	.out {color: red;}
	
	.now, .nowSat, .nowSun {background-color: #fff8c7; }
	.past {background-color: white;}
	.future {background-color: #fffdf2;}
	.blank {background-color: #f5f5f5;}
</style>


<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
	function formCalendar()
	{
		var year = document.getElementById("defaultyear").value
		var month = document.getElementById("defaultMonth").value
		window.location.href = "./calendar.action?year="+year+"&month="+month;	
	}
	
	
	function moveMonthIn()
	{
		var year = document.getElementById("defaultyear").value
		var month = document.getElementById("defaultMonth").value
		window.location.href = "./monthinlist.action?year="+year+"&month="+month;
	}
	function moveMonthOut()
	{
		var year = document.getElementById("defaultyear").value
		var month = document.getElementById("defaultMonth").value
		window.location.href = "./monthoutlist.action?year="+year+"&month="+month;
	}
	
	function movePostReg()
	{
		window.location.href="./moneypostreg.action?user_dstn_cd="+<%=user_dstn_cd%>;
	}
	function moveAnalysis()
	{
		var year = document.getElementById("defaultyear").value
		var month = document.getElementById("defaultMonth").value
		window.location.href = "./analysis.action?year="+year+"&month="+month;
	}
	
	// 페이지가 열릴때 삽입
	$(document).ready(function(){
		
		var url = "";
		var year = document.getElementById("defaultyear").value;
		var month = document.getElementById("defaultMonth").value;
		
		for (var i = 0; i <= 31; i++)
		{
			url = "<a href=\'useracntdaylist.action?year="+year+"&month="+month+"&day="+i+"\'>"+i+"<br>";
			
			<c:forEach var="in" items="${inTot }">
				if (i==${in.day})
				{
					url += "<span class='in'>수입 : "+${in.tot}+" 원</span><br>";
				}
			</c:forEach>
			
			<c:forEach var="out" items="${outTot }">
			
				if (i==${out.day})
				{
					url += "<span class='out'>지출 : "+${out.tot}+" 원</span><br>";
				}
			</c:forEach>
	
			url += "</a>";
			
			$('#'+i).html(url);
		}
			
	});
	
</script>
</head>
<body>
	<!-- 상단 네비게이션바 -->
	<jsp:include page="./UserNav.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div>
					<span>날짜 선택 &nbsp;</span>                     
					
					<form>
						<select id="defaultyear" name="defaultYear" onchange="formCalendar()">
							${yOptions}
						</select> 년
						<select id="defaultMonth" name="defaultMonth" onchange="formCalendar()">
							${mOptions}
						</select> 월
					</form>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12 m-2" style="text-align: center;">
				${year } 년 ${month } 월<br />
				
				<div class="page-header">
					<h1>내 가계부</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<table class="col-6" style="text-align: center;">
				<tr>
					<th>
						<button type="button" class="btn btn-primary" style="width: 200px; height:200px; border-radius:100px; background-color: #f79900; font-size: 20px" onclick="moveMonthIn()">
							수입<br />
							<span style="font-size: 17px;">
								<fmt:formatNumber value="${monthInTot }" groupingUsed="true"></fmt:formatNumber> 원
							</span>
						</button>	
						<!-- <a href="monthinlist.action" style="color: #f79900; font-size: 30px">
							■ 수입
						</a> -->
					</th>
				</tr>
			</table>
			<table class="col-6" style="text-align: center;">
				<tr>
					<th>
						<button type="button" class="btn btn-primary" style="width: 200px; height:200px; border-radius:100px; background-color: #03a313; font-size: 20px" onclick="moveMonthOut()">
							지출 <br />
							<span style="font-size: 17px;">
								<fmt:formatNumber value="${monthOutTot }" groupingUsed="true"></fmt:formatNumber> 원
							</span>
						</button>
						<!-- <a href="monthoutlist.action" style="color: #03a313; font-size: 30px">
							■ 지출
						</a> -->
					</th>
				</tr>
			</table>
		</div>
		<div class="row mb-2">
			<div class="col-6" style="text-align: left;">
				<span style="color: #f79900">
					이월
					<fmt:formatNumber value="${nowRemain-monthInTot+monthOutTot }" groupingUsed="true"></fmt:formatNumber> 원
				</span>
			</div>
			<div class="col-6" style="text-align: right;">
				<span style="color: #03a313;">
					잔액 <fmt:formatNumber value="${nowRemain }" groupingUsed="true"></fmt:formatNumber> 원
				</span>
			</div>
		</div>

		<div class="row">
			<!-- <div class="col-12" id="calendar"> -->
			<!-- 달력 -->
			
			<%-- <%=calStr %> --%>
			${calStr}
		</div>

	</div>

	<div class="container mt-5 mb-5">
		<div class="row">

			<div class="col-11">

				<div class="list-group">

					<!-- 머니리뷰 달성 현황(현 오리바) -->
					<div class="progress" style="background-color: white; height: 150px;">

						<div
							class="progress-bar progress-bar bg-white progress-bar-animated"
							role="progressbar" 
							style="width: <%=(pigCount*100)-10%>%;"
							aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
						</div>
						
						<img style=";" src="./img2/moneypig.gif">
						
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-11">

				<div class="list-group">
					<!-- 머니리뷰 프로그레스바 -->
					<div class="progress"
						style="height: 40px; background-color: #F7EDE2;">

						<div
							class="progress-bar progress-bar bg-warning progress-bar-animated"
							role="progressbar" style="font-size: 17pt; width: <%=pigCount*100%>%;"
							aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
							<%-- <fmt:formatNumber type="percent" value=""  pattern=".%"/> --%>
							<fmt:formatNumber type="percent" value="<%=pigCount%>" minIntegerDigits="0"/>
						</div>
					</div>
				</div>
			</div>
			<div class="col-1" style="place-items: left; display: grid;">
			<!-- 조건문으로 분기해줘야함!!!! -->
				<%
				if (pigCount != 1)
				{
				%>
					<!-- class의 btn-primary 빼면 테두리 사라짐! -->
					<button type="submit" class="btn" style="background-color:#b3b3b3; height: 40px; color: white;"
					 data-toggle="modal" data-target="#modal" disabled="disabled">리뷰하기</button>
				<%
				}
				else
				{
				%>
					<button type="submit" class="btn" style="background-color: #F7EDE2; height: 40px; color: white;"
					 data-toggle="modal" data-target="#modal">리뷰하기</button>
				<%
				}
				%>
			
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-12">
				<button type="button" class="btn" style="background-color: #1fa766; width: 100%; color: white;" onclick="moveAnalysis()">
					이번달 분석하기
				</button>
			</div>
		</div>
	</div>


	<!-- modal 만들기 ★ -->
	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
	aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">목표 달성을 축하합니다!! </h4>
					
					<!-- 화면 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidde="true">&times;</span>
					</button>
					
				</div>
				
				<div class="modal-body">
						<br>
						${user_name}님은 가계부를 공유할 수 있습니다.
						<br>
						머니리뷰를 작성하시겠습니까?
						
						<!-- 축하 이미지 넣기 -->
						<!-- <img src="./img2/image1.jpg" width="100%;"> -->
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" style="width: 100px;" onclick="movePostReg()"> 네 </button>
							<button type="button" class="btn btn-secondary" style="width: 100px;" data-dismiss="modal"> 나중에 </button>
						</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- modal 만들기 끝 -->

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>