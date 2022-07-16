<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Object fstCate = request.getAttribute("fstCateList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부 당일 내역</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	var user_dstn_cd = ${user_dstn_cd}
	var year = ${year}
	var month = ${month}
	var day = ${day}

	function moveCalendar()
	{
	  window.location.href = "./calendar.action?year="+year+"&month="+month;
	}
	
	function acntreg()
	{
		if ($("#inout_cd").val()=="")
		{
			$("#inout_cd").focus();
			alert("구분을 선택해주세요");
			return;
		}
		
		if ($("#cate_fst_cd").val()=="")
		{
			$("#cate_fst_cd").focus();
			alert("1차 카테고리를 선택해주세요");
			return;
		}
		
		if ($("#cate_sec_cd").val()=="")
		{
			$("#cate_sec_cd").focus();
			alert("2차 카테고리를 선택해주세요");
			return;
		}
		
		if ($("#acnt_dtl_cont").val()=="")
		{
			$("#acnt_dtl_cont").focus();
			alert("상세내역을 입력해주세요");
			return;
		}
		
		if ($("#amnt").val()=="")
		{
			$("#amnt").focus();
			alert("금액을 입력해주세요");
			return;
		}
		
		if (isNaN($("#amnt").val()))
		{
			$("#amnt").focus();
			alert("숫자만 입력이 가능합니다");
			return;
		}
		
		var cate2 = document.getElementById("cate_sec_cd");
		var cate2_cd = cate2.options[cate2.selectedIndex].value;
		
		var acnt_dtl_cont = document.getElementById("acnt_dtl_cont").value;
		var amnt = document.getElementById("amnt").value;
		
		window.location.href = "./acntreg.action?user_dstn_cd="+user_dstn_cd+"&year="+year+"&month="+month+"&day="+day+"&cate_sec_cd="+cate2_cd+"&acnt_dtl_cont="+acnt_dtl_cont+"&amnt="+amnt;
		
	}

	// 유효성검사
	$(document).ready(function()
	{
		
		// 추천검색어
		$("#acnt_dtl_cont").keyup(function()
		{	
			//alert("확인");
		});
		
		
		// 타이용자 평균금액 비교
		$("#amnt").keyup(function()
		{	
			/* if ( parseInt($("#amnt").text()) > parseInt($("#").val()) )	
			{
				$("#err").html("입력하신 기본급이 최소 기본급보다 작습니다.");
				$("#err").css("display", "inline");
				return;
			} */
		});
	});
	
	// 1차 카테고리 선택시
	function selectFst()
	{
		
		var inout = document.getElementById("inout_cd");
		var inout_cd = inout.options[inout.selectedIndex].value;
		
		var cate1 = document.getElementById("cate_fst_cd");
		var cate1_cd = cate1.options[cate1.selectedIndex].value;
		
		var cate2 = document.getElementById("cate_sec_cd");
		var cate2_cd = cate2.options[cate2.selectedIndex].value;
		//var post_rept_dtl_cont = document.getElementById("postReptDtlCont");
		
		if (cate1_cd == 1)
		{
			// 주수입	
			inout.selectedIndex=1;
		
			//cate2.selectedIndex=30;
			//selectSec();
			
			//cate1.options[1].remove();
			
		}
		else if (cate1_cd == 2)
		{
			// 부수입	
			inout.selectedIndex=1;
			//cate2.selectedIndex=2;
		}

		
	}
	
	// 2차 카테고리 선택시
	function selectSec()
	{
		
		var inout = document.getElementById("inout_cd");
		var inout_cd = inout.options[inout.selectedIndex].value;
		
		var cate1 = document.getElementById("cate_fst_cd");
		var cate1_cd = cate1.options[cate1.selectedIndex].value;
		
		var cate2 = document.getElementById("cate_sec_cd");
		var cate2_cd = cate2.options[cate2.selectedIndex].value;
		//var post_rept_dtl_cont = document.getElementById("postReptDtlCont");
		
		if (cate2_cd >= 1 && cate2_cd <= 5)
		{
			// 주수입	
			inout.selectedIndex=1;
			cate1.selectedIndex=1;
		}
		else if (cate2_cd >= 6 && cate2_cd <= 10)
		{
			// 부수입	
			inout.selectedIndex=1;
			cate1.selectedIndex=2;
		}
		else if (cate2_cd >= 11 && cate2_cd <= 14)
		{
			// 저축	
			inout.selectedIndex=1;
			cate1.selectedIndex=3;
		}
		else if (cate2_cd >= 15 && cate2_cd <= 19)
		{
			// 식비
			inout.selectedIndex=2;
			cate1.selectedIndex=4;
		}
		else if (cate2_cd >= 20 && cate2_cd <= 23)
		{
			// 카페/간식
			inout.selectedIndex=2;
			cate1.selectedIndex=5;
		}
		else if (cate2_cd >= 24 && cate2_cd <= 29)
		{
			// 통신/구독	
			inout.selectedIndex=2;
			cate1.selectedIndex=6;
		}
		else if (cate2_cd >= 30 && cate2_cd <= 35)
		{
			// 쇼핑/생활	
			inout.selectedIndex=2;
			cate1.selectedIndex=7;
		}
		else if (cate2_cd >= 36 && cate2_cd <= 40)
		{
			// 뷰티/미용	
			inout.selectedIndex=2;
			cate1.selectedIndex=8;
		}
		else if (cate2_cd >= 41 && cate2_cd <= 45)
		{
			// 교통	
			inout.selectedIndex=2;
			cate1.selectedIndex=9;
		}
		else if (cate2_cd >= 46 && cate2_cd <= 54)
		{
			// 자동차	
			inout.selectedIndex=2;
			cate1.selectedIndex=10;
		}
		else if (cate2_cd >= 55 && cate2_cd <= 61)
		{
			// 주거
			inout.selectedIndex=2;
			cate1.selectedIndex=11;
		}
		else if (cate2_cd >= 62 && cate2_cd <= 66)
		{
			// 의료/건강
			inout.selectedIndex=2;
			cate1.selectedIndex=12;
		}
		else if (cate2_cd >= 67 && cate2_cd <= 72)
		{
			// 금융	
			inout.selectedIndex=2;
			cate1.selectedIndex=13;
		}
		else if (cate2_cd >= 73 && cate2_cd <= 82)
		{
			// 문화/여가
			inout.selectedIndex=2;
			cate1.selectedIndex=14;
		}
		else if (cate2_cd >= 83 && cate2_cd <= 87)
		{
			// 여행/숙박
			inout.selectedIndex=2;
			cate1.selectedIndex=15;
		}
		else if (cate2_cd >= 88 && cate2_cd <= 92)
		{
			// 교육/학습
			inout.selectedIndex=2;
			cate1.selectedIndex=16;
		}
		else if (cate2_cd >= 93 && cate2_cd <= 97)
		{
			// 자녀/육아
			inout.selectedIndex=2;
			cate1.selectedIndex=17;
		}
		else if (cate2_cd >= 98 && cate2_cd <= 101)
		{
			// 반려동물
			inout.selectedIndex=2;
			cate1.selectedIndex=18;
		}
		else if (cate2_cd >= 102 && cate2_cd <= 108)
		{
			// 경조/선물
			inout.selectedIndex=2;
			cate1.selectedIndex=19;
		}
		else
		{
			inout.selectedIndex=0;
			cate1.selectedIndex=0;
		} 
	}

</script>
</head>
<body>
	<!-- 상단 네비게이션바 -->
	<jsp:include page="./UserNav.jsp"></jsp:include>
	    

     <div class="container mt-3">
      	<div class="row">
      		<div class="col-12" style="text-align: center;">
      			<h1>${year }</h1><br>
    			<h2>${month}월 ${day}일 가계부</h2>
    		</div>
	    </div>
	    
		<form class="row mt-3" action="acntreg.action" method="post" id="enterAcnt">
				<table class="col-12">
					<tbody>
						<tr>
							<td>
								<select name="inout_cd" id ="inout_cd" style="width: 100%;">
									<option value="" selected>구분</option>
									<c:if test="${not empty inoutCateList}">
									<c:forEach var="inoutCate" items="${inoutCateList }" varStatus="status">
									<option value="${inoutCate.inout_cd }">${inoutCate.inout_cont }</option>
									</c:forEach>
									</c:if>
								</select>
							</td>
							<td>
								<select name="cate_fst_cd" id="cate_fst_cd" onchange="selectFst()" style="width: 100%;">
									<option value="" selected>1차카테고리</option>
									<c:if test="${not empty fstCateList}">
									<c:forEach var="fstCate" items="${fstCateList }" varStatus="status">
										<option value="${fstCate.cate_fst_cd}" id="${fstCate.inout_cd}" >${fstCate.cate_fst_name }</option>
									</c:forEach>
									</c:if>
								</select>
							</td>
							<td>
								<select name="cate_sec_cd" id="cate_sec_cd" onchange="selectSec()" style="width: 100%;">
									<option value="" selected>2차카테고리</option>
									<c:if test="${not empty secCateList}">
									<c:forEach var="secCate" items="${secCateList }" varStatus="status">
										<option value="${secCate.cate_sec_cd}" id="${secCate.cate_fst_cd}" >${secCate.cate_sec_name }</option>
									</c:forEach>
									</c:if>
								</select>
								
							</td>
							<td>
								<input type="text" style="width: 100%;" id="acnt_dtl_cont" name="acnt_dtl_cont" placeholder="상세내역 입력">
								<div id="searchResult">
								</div>
							</td>
							<td>
								<input type="text"style="width: 100%;" id="amnt" name="amnt" placeholder="금액 입력">
							</td>
							<td>
								<button id="next-btn" type="button" class="btn btn-primary" onclick="acntreg()" style="background-color: #1fa766; width: 100%;">등록</button>
							</td>
							<td>
								<img src="img2/icon.png" alt="아이콘" style="width: 35px;">
							</td>
						</tr>
					</tbody>
				</table>
		</form>
	    <div class="row mt-3">
	    	<div class="col-12">
	    		<table class="table table-striped" >
			        <thead>
			            <tr>
			                <th class="mobile" style="width: 120px; text-align: center;">분류</th>
			                <th class="mobile" style="width: 120px; text-align: center;">1차 분류</th>
			                <th style="width: 120px; text-align: center;">2차 분류</th>
			                <th class="mobile" style="text-align: center;">상세내역</th>
			                <th style="width: 200px; text-align: center;">금액</th>
			            </tr>
			        </thead>
			        <tbody>
			        
			        	
			        	<c:if test="${empty dayInoutList}">
							<tr>
								<td colspan="5" style="text-align: center;">등록 내역이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:if test="${not empty dayInoutList}">
							<c:forEach var="dayList" items="${dayInoutList}">
						 	<tr>
								<td class="mobile" style="text-align: center;">${dayList.inout_cont}</td>
								<td class="mobile" style="text-align: center;">${dayList.cate_fst_name}</td>
				                <td style="text-align: center;">${dayList.cate_sec_name}</td>
				                <td style="text-align: center;">${dayList.acnt_dtl_cont}</td>
				                <td class="mobile" style="text-align: center;">
					                <fmt:formatNumber value="${dayList.amnt}" groupingUsed="true"></fmt:formatNumber>
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
				<div class="text-center" style="margin-right: auto; margin-left: auto;">
	         		<button type="button" class="btn btn-success" onclick="moveCalendar()"> 돌아가기 </button>
				</div>
			</div>
		</div>
    </div>	

	    
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>