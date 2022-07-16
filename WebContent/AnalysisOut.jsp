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

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
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
					<div class="row">
						<div class="col">
							<ol class="breadcrumb">
								<li class="active"> ${year}년 ${month}월 보고서 </li>
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
									<button type="button" class="btn btn-dark" onclick="moveAnalysis()"> 전체 </button>
									<button type="button" class="btn btn-dark" onclick="moveAnalysisIn()"> 수입 </button>
									<button type="button" class="btn btn-success" onclick="moveAnalysisOut()"> 지출 </button>
								</div>
								
								<div class="btn-group float-right">
									<button type="button" class="btn btn-dark" onclick="moveCalendar()"> 돌아가기 </button>
								</div>
								
							</div>
						</div>
					</div>
				</header>
				<!-- 헤더 ===================================================== -->
		
		
				<div class="container">
					<div class="row">
					
						<!-- 내 지출 분석 -->
						<div class="col-md-12">
							<div class="list-group">
								<br><br>
								<h4> 지출 <small> ${user_name} 님의 ${month }월 지출 분석 </small> </h4>
								
								<c:forEach var="data" items="${inOutData }">
									<!-- 지출이 0원인지 -->
									<c:if test="${(data.cate_fst_4+data.cate_fst_5+data.cate_fst_6+data.cate_fst_7+data.cate_fst_8+data.cate_fst_9
									+data.cate_fst_10+data.cate_fst_11+data.cate_fst_12+data.cate_fst_13+data.cate_fst_14+data.cate_fst_15
									+data.cate_fst_16+data.cate_fst_17+data.cate_fst_18+data.cate_fst_19)==0}">
										<div class="col-md-12">
											<div class="list-group">
												<br><br><br><br>
												<h4 style="text-align: center;"><img src="./img/noData.png"><br><small> 지출 내역이 없습니다! </small> </h4>
											</div>
										</div>
										<c:set var="writer_flag" value="true" />
									</c:if>
								</c:forEach>
								
								
								<c:if test="${not writer_flag }">
									<!-- 그래프가 들어가는 곳 -->
								<div class="list-group mt-3">
									<div class="list-group-item" >
										<canvas id="myChart" style="height: 400px;"></canvas>
									</div>
								</div>
								</c:if>
				
							</div>
						</div>
						
						
						<!-- 내 지출 내역들 -->
						<div class="col-md-12">
							<div class="list-group">
								<br><br>
								<h4> 지출 <small> ${user_name} 님의 ${month }월 지출 리스트 </small> </h4>
								
								<div class="list-group-item">
									<div class="list-group">
										<table class="table" style="max-width: 1080px;">
								            <thead>
								            	<tr>
								                	<th style="text-align:center;">날짜</th>
								                	<th style="text-align:center;">1차 카테고리</th>
								                	<th style="text-align:center;">2차 카테고리</th>
								                	<th style="text-align:center;">상세내용</th>
								                	<th style="text-align:center;">금액</th>
								            	</tr>
								            </thead>
								            
								            <tbody>
									            <c:if test="${empty monthOutList}">
												<tr>
													<td>지출 내역이 없습니다.</td>
												</tr>
												</c:if>
												
												<c:if test="${not empty monthOutList}">
												<c:forEach var="monOutList" items="${monthOutList }">
											 	<tr>
													<td style="text-align: center;">
														<fmt:parseDate value="${monOutList.acnt_date}" var="acntDate" pattern="yyyy-MM-dd" />
														<fmt:formatDate value="${acntDate}" pattern="MM-dd" />
													</td>
													<td style="text-align: center;">${monOutList.cate_fst_name }</td>
									                <td style="text-align: center;">${monOutList.cate_sec_name }</td>
									                <td style="text-align: center;">${monOutList.acnt_dtl_cont }</td>
									                <td style="text-align: center;">
						     					        <fmt:formatNumber value="${monOutList.amnt }" groupingUsed="true"></fmt:formatNumber>
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
	
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
 -->
	
	
	<script>
    
	<!-- 모든 카테고리별 총합 데이터 수신 -->
	<c:forEach var="data" items="${inOutData }">
		/* var idata1 = ${data.cate_fst_1};
		var idata2 =${data.cate_fst_2};
		var idata3 =${data.cate_fst_3}; */
	    var data1 = ${data.cate_fst_4};
	    var data2 = ${data.cate_fst_5};
	    var data3 = ${data.cate_fst_6};
	    var data4 = ${data.cate_fst_7};
	    var data5 = ${data.cate_fst_8};
	    var data6 = ${data.cate_fst_9};
	    var data7 = ${data.cate_fst_10};
	    var data8 = ${data.cate_fst_11};
	    var data9 = ${data.cate_fst_12};
	    var data10= ${data.cate_fst_13};
	    var data11= ${data.cate_fst_14};
	    var data12= ${data.cate_fst_15};
	    var data13= ${data.cate_fst_16};
	    var data14= ${data.cate_fst_17};
	    var data15= ${data.cate_fst_18};
	    var data16= ${data.cate_fst_19};
	</c:forEach>
	
	// 지출합
	var hap = data1+data2+data3+data4+data5+data6+data7+data8+data9+data10+data11+data12+data13+data14+data15+data16;
	
	// 수입합
	//var hap2 = idata1+idata2+idata3;

	// 지출 그래프
	var ctxP = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctxP, {
		type : 'doughnut',
		data : {
			labels : [ 
				 "식비" + " : "+data1+" [ "+ (data1/hap*100).toFixed(3) + " %" +" ]"
				, "카페/간식" + " : "+data2+" [ "+ (data2/hap*100).toFixed(3) + " %" +" ]"
				, "통신/구독" + " : "+data3+" [ "+ (data3/hap*100).toFixed(3) + " %" +" ]"
				, "쇼핑/생활" + " : "+data4+" [ "+ (data4/hap*100).toFixed(3) + " %" +" ]"
				, "뷰티/미용" + " : "+data5+" [ "+ (data5/hap*100).toFixed(3) + " %" +" ]"
				,"교통" + " : "+data6+" [ "+ (data6/hap*100).toFixed(3) + " %" +" ]"
				, "자동차" + " : "+data7+" [ "+ (data7/hap*100).toFixed(3) + " %" +" ]"
				, "주거" + " : "+data8+" [ "+ (data8/hap*100).toFixed(3) + " %" +" ]"
				, "의료/건강" + " : "+data9+" [ "+ (data9/hap*100).toFixed(3) + " %" +" ]"
				, "금융" + " : "+data10+" [ "+ (data10/hap*100).toFixed(3) + " %" +" ]"
				, "문화/여가" + " : "+data11+" [ "+ (data11/hap*100).toFixed(3) + " %" +" ]"
				, "여행/숙박" + " : "+data12+" [ "+ (data12/hap*100).toFixed(3) + " %" +" ]"
				, "교육/학습" + " : "+data13+" [ "+ (data13/hap*100).toFixed(3) + " %" +" ]"
				, "자녀/육아" + " : "+data14+" [ "+ (data14/hap*100).toFixed(3) + " %" +" ]"
				, "반려동물" + " : "+data15+" [ "+ (data15/hap*100).toFixed(3) + " %" +" ]"
				, "경조/선물" + " : "+data16+" [ "+ (data16/hap*100).toFixed(3) + " %" +" ]"
				],
			datasets : [
				{
					data : [ data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16],
					backgroundColor : [ "#FFA44F", "#FFC48E", "#EAC4FF", "#C5ACFF", "#9591FF", "#78A6FD", "#6CB2DF", "#5BBFBA", "#15A665", "#2F9245", "#66B237", "#96CA39", "#DFE356", "#FFC66B", "#FFAD7D", "#FF9FA5"],
					hoverBackgroundColor : []
				} 
			]
		},
		options : {
			responsive: true,
			legend : {
				display : true,
				position: "right",
				labels:{
					fontSize: 18,
					boxWidth: 40,
					padding: 30,
					usePointStyle: true,
					PointStyle: "circle"
				}
			}}
	});

	
    </script>

</body>
</html>