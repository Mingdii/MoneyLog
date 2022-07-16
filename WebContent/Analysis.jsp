<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script type="text/javascript">

	var year = ${year}
	var month = ${month}

	function moveCalendar()
	{
		window.location.href = "./calendar.action?year="+year+"&month="+month;
	}
	function moveAnalysis()
	{
		window.location.href = "./analysis.action?year="+year+"&month="+month;
	}
	function moveAnalysisIn()
	{
		window.location.href = "./analysisIn.action?year="+year+"&month="+month;
	}
	function moveAnalysisOut()
	{
		window.location.href = "./analysisOut.action?year="+year+"&month="+month;
	}
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<!-- 안내 ===================================================== -->
				<div class="container">
					<div class="row" style="place-items: center; display: grid;">
						<div class="col-12">
							<ol class="breadcrumb">
								<li class="active">${year}년 ${month}월 보고서</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- 안내 ===================================================== -->

				<!-- 헤더 ===================================================== -->
				<header id="header">
					<div class="container p-3 bg-dark text-white">
						<div class="row">
							<div class="col-sm-12">
								<div class="btn-group float-left">
									<button type="button" class="btn btn-success"
										onclick="moveAnalysis()">전체</button>
									<button type="button" class="btn btn-dark" onclick="moveAnalysisIn()">
										수입</button>
									<button type="button" class="btn btn-dark" onclick="moveAnalysisOut()">
										지출</button>
								</div>

								<div class="btn-group float-right">
									<button type="button" class="btn btn-dark" onclick="moveCalendar()">
										돌아가기</button>
								</div>

							</div>
						</div>
					</div>
				</header>
				<!-- 헤더 ===================================================== -->

				<div class="container">
					<div class="row">
						

						<!-- 나의 수입대비지출 -->
						<div class="col-md-12">
						
							<br><br>

							<div class="list-group">
								<h4>수입 대비 지출</h4>
								<h4 style="text-align: right;">
									<small style="color: #f79900;">■ 수입</small> <small
										style="color: #03a313;">■ 지출</small>
								</h4>
								
								
								<!-- 수입총 + 지출총이 0원인지 -->
								<c:if test="${(monthInTot+monthOutTot)==0}">
									<div class="col-md-12">
										<div class="list-group">
											<br><br><br><br>
											<h4 style="text-align: center;"><img src="./img/noData.png"><br><small> 내역이 없습니다! </small> </h4>
										</div>
									</div>
									<c:set var="writer_flag" value="true" />
								</c:if>
								
								
								<c:if test="${not writer_flag }">
								
									<!-- 나의 수입대비지출 프로그레스바 -->
									<div class="progress"
										style="height: 50px; background-color: white;">
	
										<div
											class="progress-bar progress-bar bg-warning progress-bar-animated"
											role="progressbar"
											style="font-size: 17pt; width: ${monthInTot/(monthInTot+monthOutTot)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber type="percent" value="${monthInTot/(monthInTot+monthOutTot)}"  pattern="0.0%"/>
										</div>
	
										<div
											class="progress-bar progress-bar bg-success progress-bar-animated"
											role="progressbar"
											style="font-size: 17pt; width: ${monthOutTot/(monthInTot+monthOutTot)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber type="percent" value="${monthOutTot/(monthInTot+monthOutTot)}"  pattern="0.0%"/>
										</div>
	
									</div>
	
									<div class="progress"
										style="height: 50px; background-color: white;">
	
										<div
											class="progress-bar progress-bar bg-white progress-bar-animated"
											role="progressbar"
											style=";font-size: 13pt; color: #f79900; width: ${monthInTot/(monthInTot+monthOutTot)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber value="${monthInTot}" groupingUsed="true"></fmt:formatNumber> 원
										</div>
	
										<div
											class="progress-bar progress-bar bg-white progress-bar-animated"
											role="progressbar"
											style="font-size: 13pt; color: #03a313; width: ${monthOutTot/(monthInTot+monthOutTot)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber value="${monthOutTot}" groupingUsed="true"></fmt:formatNumber> 원
										</div>
	
									</div>
								</c:if>


								<!-- <h5 class="mt-2">이번달, 수입에 비해 [ 60% ] 지출하였습니다. </h5> -->

							</div>
						</div>


						<!-- 나와 비슷한 사람과의 비교 -->
						<div class="col-md-12">
		
							<div class="list-group">
								<br>
								<br>
								<h4>
									수입 / 지출 <small> ${user_name} 님의 평균 수입·지출 금액을 비교해봤어요! </small>
								</h4>
								
								<!-- 수입총+지출총이 0원인지 -->
								<c:if test="${(monthInTot+monthOutTot)==0}">
									<div class="col-md-12">
										<div class="list-group">
											<br><br><br><br>
											<h4 style="text-align: center;"><img src="./img/noData.png"><br><small> 내역이 없습니다! </small> </h4>
										</div>
									</div>
									<c:set var="writer_flag" value="true" />
								</c:if>
								
								<c:if test="${not writer_flag }">
									<!-- 막대 그래프가 들어가는 곳 -->
									<div class="list-group mt-3">
										<div class="list-group-item">
											<canvas id="barChart"></canvas>
										</div>
									</div>
								</c:if>
							</div>
						</div>
		
		
						<!-- 나와 비슷한 사람과의 비교2 // 호버되는 내용 수정 필요!!!!!!!!!!! -->
						<div class="col-md-12">
		
							<div class="list-group">
								<br>
								<br>
								<h4>
									평균 수입 대비 지출 <small> ${user_name} 님과 비슷한 사람들의 수입·지출을 찾아봤어요! </small>
								</h4>
								<h4 style="text-align: right;">
									<small style="color: rgba(163, 207, 255, 1);">■ 수입</small> <small
										style="color: rgba(255, 200, 234, 1);">■ 지출</small>
								</h4>
								
								<!-- 수입총+지출총이 0원인지 -->
								<c:if test="${(monthInTot+monthOutTot)==0}">
									<div class="col-md-12">
										<div class="list-group">
											<br><br><br><br>
											<h4 style="text-align: center;"><img src="./img/noData.png"><br><small> 내역이 없습니다! </small> </h4>
										</div>
									</div>
									<c:set var="writer_flag" value="true" />
								</c:if>
								
								<c:if test="${not writer_flag }">
									<!-- 나와 비슷한 사람의 평균 프로그레스바 -->
									<div class="progress"
										style="height: 50px; background-color: white;">
			
										<div class="progress-bar progress-bar-animated"
											role="progressbar"
											style="background-color:rgba(163, 207, 255, 1); font-size: 17pt; width: ${similarInAvg/(similarInAvg+similarOutAvg)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber type="percent" value="${similarInAvg/(similarInAvg+similarOutAvg)}"  pattern="0.0%"/>
										</div>
			
										<div class="progress-bar progress-bar-animated"
											role="progressbar"
											style="background-color:rgba(255, 200, 234, 1); font-size: 17pt; width: ${similarOutAvg/(similarInAvg+similarOutAvg)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber type="percent" value="${similarOutAvg/(similarInAvg+similarOutAvg)}"  pattern="0.0%"/>
										</div>
			
									</div>
			
									<div class="progress"
										style="height: 50px; background-color: white;">
			
										<div
											class="progress-bar progress-bar bg-white progress-bar-animated"
											role="progressbar"
											style=";font-size: 13pt; color: rgba(163, 207, 255, 1); width: ${similarInAvg/(similarInAvg+similarOutAvg)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber value="${similarInAvg }" groupingUsed="true"></fmt:formatNumber> 원
										</div>
			
										<div
											class="progress-bar progress-bar bg-white progress-bar-animated"
											role="progressbar"
											style="font-size: 13pt; color: rgba(255, 200, 234, 1); width: ${similarOutAvg/(similarInAvg+similarOutAvg)*100}%;"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
											<fmt:formatNumber value="${similarOutAvg }" groupingUsed="true"></fmt:formatNumber> 원 
										</div>
									</div>
								</c:if>
		
								
							</div>
						</div>
					</div>
				</div>
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

	<script>
		var ctx = document.getElementById('barChart').getContext('2d');
		var chart = new Chart(ctx,
		{
			// The type of chart we want to create
			type : 'bar',

			// The data for our dataset
			data :
			{
				labels : [ '내 수입', '평균 수입', '내 지출', '평균 지출' ],
				datasets : [
				{
					label : '내 수입 지출 분석',
					backgroundColor : [ 'rgba(255, 210, 76, 1)',
							'rgba(163, 207, 255, 1)', 'rgba(31, 167, 102, 1)',
							'rgba(255, 200, 234, 1)' ],
					borderColor : [ 'rgb(255, 99, 132,1.5)',
							'rgba(54, 162, 235, 1.5)',
							'rgba(255, 206, 86, 1.5)',
							'rgba(75, 192, 192, 1.5)' ],
					data : [
								${monthInTot }
								, ${allInAvg }
								, ${monthOutTot }
								, ${allOutAvg }
							]
				} ]
			},

			// Configuration options go here
			options :
			{

				/* title: {
				    display: true,
				    text: ' ss',
				    fontSize: 30,
				    fontColor: 'rgba(46, 49, 49, 1)'
				}, */

				legend :
				{
					display : false,
					labels :
					{
						fontColor : 'rgba(83, 51, 237, 1)',
						fontSize : 15
					}
				},
				scales :
				{
					xAxes : [
					{
						ticks :
						{
							fontColor : 'rgba(0, 0, 0, 1)',
							fontSize : '15'
						}
					} ],
					yAxes : [
					{
						ticks :
						{
							beginAtZero : true,
							fontColor : 'rgba(0, 0, 0, 1)',
							fontSize : '15'
						}
					} ]
				}
			}
		});
	</script>

</body>
</html>