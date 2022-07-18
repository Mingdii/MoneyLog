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


<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">

	// 해당 게시글의 작성자, 게시글 코드 가져오기
	<c:forEach var="post" items="${postFind }">
  		var user_dstn_cd = ${post.user_dstn_cd}
  		var post_cd = ${post.post_cd}
	</c:forEach>
	
	// 게시글 신고
	function postReport()
	{
		window.location.href = "./postreportform.action?post_cd="+post_cd;
	}
	
	// 댓글 신고
	function cmntReport(cmnt_cd)
	{
		//alert(cmnt_cd);
		window.location.href = "./cmntreportform.action?cmnt_cd="+cmnt_cd;
	}
	
	// 댓글 삭제
	function cmntDelete(cmnt_cd)
	{
		window.location.href = "./cmntdel.action?cmnt_cd="+cmnt_cd+"&post_cd="+post_cd
	}
	
	// 댓글 수정 (입력창 보이게, 기존 댓글 숨기기)
	function cmntEdit(cmnt_cd)
	{
		var cmntEdit = document.getElementById('cmntEdit'+cmnt_cd);
		var cmntCont = document.getElementById('cmntCont'+cmnt_cd);
		
		if (cmntCont.style.display!='none')
		{
			cmntCont.style.display='none';
			cmntEdit.style.display='inline';
		}
		else
		{
			cmntCont.style.display='inline';
			cmntEdit.style.display='none';
		}
	}
	
	// 댓글 수정 취소 (입력창 다시 숨기기)
	function cmntEditCancle(cmnt_cd)
	{
		var cmntEdit = document.getElementById('cmntEdit'+cmnt_cd);
		var cmntCont = document.getElementById('cmntCont'+cmnt_cd);
		
		cmntCont.style.display='inline';
		cmntEdit.style.display='none';
	}
	
	// 게시글 수정폼으로 이동
	function moneyPostModifyForm()
	{
		window.location.href = "./moneypostmodifyform.action?post_cd="+post_cd;
	}
	
	// 게시글 목록으로 이동 (+1은 페이지번호)
	function userPostList()
	{
		window.location.href = "./userpostlist.action?pageNum="+1;
	}
	
	// 게시글 목록으로 이동
	function adPostList()
	{
		window.location.href = "./adpostlist.action?pageNum="+1;
	}
	
	
	// 페이지 열리면 바로 실행
	$(document).ready(function(){
	
		// 본인에게 이모티콘 했을때
		$('#emtcbtnSelf1').click(function()
		{
			alert("[텅장될 예정] 본인에게 평가는 불가능합니다!")
		});
		$('#emtcbtnSelf2').click(function()
		{
			alert("[안사면 0원] 본인에게 평가는 불가능합니다!")
		});
		$('#emtcbtnSelf3').click(function()
		{
			alert("[이대로만 쭉] 본인에게 평가는 불가능합니다!")
		});
		$('#emtcbtnSelf4').click(function()
		{
			alert("[티끌모아 태산] 본인에게 평가는 불가능합니다!")
		});
		$('#emtcbtnSelf5').click(function()
		{
			alert("[부자될 예정] 본인에게 평가는 불가능합니다!")
		});
		
		
		// 관리자가 이모티콘 했을때
		$('#emtcbtnAdmin1').click(function()
		{
			alert("[텅장될 예정] 관리자는 평가가 불가능합니다!")
		});
		$('#emtcbtnAdmin2').click(function()
		{
			alert("[안사면 0원] 관리자는 평가가 불가능합니다!")
		});
		$('#emtcbtnAdmin3').click(function()
		{
			alert("[이대로만 쭉] 관리자는 평가가 불가능합니다!")
		});
		$('#emtcbtnAdmin4').click(function()
		{
			alert("[티끌모아 태산] 관리자는 평가가 불가능합니다!")
		});
		$('#emtcbtnAdmin5').click(function()
		{
			alert("[부자될 예정] 관리자는 평가가 불가능합니다!")
		});
		
		
		// 이모티콘 1 ~ 5 클릭시
		$('#emtcbtn1').click(function()
		{
			window.location.href = "./emtcadd.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=1"
		});
		$('#emtcbtn2').click(function()
		{
			window.location.href = "./emtcadd.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=2"
		});
		$('#emtcbtn3').click(function()
		{
			window.location.href = "./emtcadd.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=3"
		});
		$('#emtcbtn4').click(function()
		{
			window.location.href = "./emtcadd.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=4"
		});
		$('#emtcbtn5').click(function()
		{
			window.location.href = "./emtcadd.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=5"
		});
		
		
		// 이모티콘 재클릭시 → 기존꺼 삭제
		$('#emtcdel1').click(function()
		{
			window.location.href = "./emtcdel.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=1"
		});
		$('#emtcdel2').click(function()
		{
			window.location.href = "./emtcdel.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=2"
		});
		$('#emtcdel3').click(function()
		{
			window.location.href = "./emtcdel.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=3"
		});
		$('#emtcdel4').click(function()
		{
			window.location.href = "./emtcdel.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=4"
		});
		$('#emtcdel5').click(function()
		{
			window.location.href = "./emtcdel.action?user_dstn_cd="+${user_dstn_cd }+"&post_cd="+post_cd+"&emtc_cd=5"
		});
		
	});
	
</script>

<style type="text/css">

	/* 댓글 호버 - 수정/삭제/신고 */
	li:hover button { visibility: visible;}
	
</style>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
</head>
<body>
	
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>
	
	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
	
	<!-- 회원탈퇴 상단 아이콘 -->
   	<div class="container">

		<div class="row sign-up-form">
         <div class="sign-up-process col-12" style="margin-top: 15%; margin-bottom: 5%;">
               <div class="form-group text-center">
                  
                  <!-- <h1 style="font-weight: 300; font-size: 20pt; color: blue;">#30대 #여자 #반려동물3마리이상 #가족구성원2명 #자녀수없음 #자차없음 #IT/개발</h1> -->
                  <h1 style="font-weight: 300; font-size: 15pt; color: blue;">
	                  <c:forEach var="post" items="${postFind }">
	                  	${post.post_title}
	                  </c:forEach>
                  </h1>
                  
                  <h2><!-- 익명의  -->
	                  <c:forEach var="post" items="${postFind}">
	                  	${post.month}
	                  </c:forEach>월 가계부
	              </h2>
               </div>
            </div>
      </div>
    </div>
 

    <div class="container-fluid">
    	<div class="row">
			<div class="col">
				<div class="container">
					<div class="row">
					
						<!-- 전체 수입 / 지출 내역 -->
						<div class="col-md-12">
							<div class="list-group">
								<br><br>
								<h4 style="text-align: center;"> 수입 / 지출 <small> </small> </h4>
								
								<div class="list-group-item">
									<div class="list-group">
										<table class="table" style="max-width: 1080px;">
								            <thead>
								            
								            	<!-- 상세내역 공개/비공개 -->
												<c:forEach var="dtlCheck" items="${postFind }">
												<c:set var="loop_flag" value="false" />
												
												<!-- 공개 -->
												<c:if test="${not loop_flag }">
													<c:if test="${dtlCheck.dtl_select_cd == 1 }">
													
														<tr>
											                <th style="text-align:center;">날짜</th>
											                <th style="text-align:center;">수입/지출</th>
											                <th style="text-align:center;">1차 카테고리</th>
											                <th style="text-align:center;">2차 카테고리</th>
											                <th style="text-align:center;">상세내용</th>
											                <th style="text-align:center;">금액</th>
										              	</tr>
													
														<c:set var="loop_flag" value="true" />
													</c:if>
												</c:if>
												
													<!-- 비공개 -->
													<c:if test="${not loop_flag }">
													
													<tr>
										                <th style="text-align:center;">날짜</th>
										                <th style="text-align:center;">수입/지출</th>
										                <th style="text-align:center;">1차 카테고리</th>
										                <th style="text-align:center;">2차 카테고리</th>
										                <th style="text-align:center;">금액</th>
													</tr>
													
												</c:if>
													</c:forEach>
								              
								            </thead>
								            <tbody>
							                  	
						                  	<!-- tr 태그 구성 -->
											<c:forEach var="inout" items="${inOutList }">
											<c:set var="loop_flag" value="false" />
	
											<!-- 수입일경우 blue -->
											<c:if test="${not loop_flag }">
												<c:if test="${inout.inout_cont == '수입' }">
												
													<!-- 반복문으로 상세내역 공개/비공개 -->
													<c:forEach var="dtlCheck" items="${postFind }">
													<c:set var="loop_flag" value="false" />
													
													<!-- 공개 -->
													<c:if test="${not loop_flag }">
														<c:if test="${dtlCheck.dtl_select_cd == 1 }">
														
															<tr>
												                <td style="text-align:center;">
												                	<fmt:parseDate value="${inout.acnt_date}" var="day" pattern="yyyy-mm-dd" />
																	<fmt:formatDate value="${day}" pattern="dd" />
												                </td>
												                <td style="text-align:center; color: blue;">${inout.inout_cont}</td>
												                <td style="text-align:center;">${inout.cate_fst_name}</td>
												                <td style="text-align:center;">${inout.cate_sec_name}</td>
												                <td style="text-align:center;">${inout.acnt_dtl_cont}</td>
												                <td style="text-align:center; color: blue;"> ${inout.amnt} </td>
												            </tr>
														
															<c:set var="loop_flag" value="true" />
														</c:if>
													</c:if>
													
														<!-- 비공개 -->
														<c:if test="${not loop_flag }">
														
														<tr>
											                <td style="text-align:center;">
											                	<fmt:parseDate value="${inout.acnt_date}" var="day" pattern="yyyy-mm-dd" />
																<fmt:formatDate value="${day}" pattern="dd" />
											                </td>
											                <td style="text-align:center; color: blue;">${inout.inout_cont}</td>
											                <td style="text-align:center;">${inout.cate_fst_name}</td>
											                <td style="text-align:center;">${inout.cate_sec_name}</td>
											                <td style="text-align:center; color: blue;"> ${inout.amnt} </td>
											            </tr>
														
													</c:if>
														</c:forEach>
													<c:set var="loop_flag" value="true" />
												</c:if>
											</c:if>
									 		
									 		<!-- 지출일 경우 red -->
									 		<c:if test="${not loop_flag }">
									 		
										 		<!-- 반복문으로 상세내역 공개/비공개 -->
												<c:forEach var="dtlCheck" items="${postFind }">
												<c:set var="loop_flag" value="false" />
												
												<!-- 공개 -->
												<c:if test="${not loop_flag }">
													<c:if test="${dtlCheck.dtl_select_cd == 1 }">
													
														<tr>
											                <td style="text-align:center;">
											                	<fmt:parseDate value="${inout.acnt_date}" var="day" pattern="yyyy-mm-dd" />
																<fmt:formatDate value="${day}" pattern="dd" />
											                </td>
											                <td style="text-align:center; color: red;">${inout.inout_cont}</td>
											                <td style="text-align:center;">${inout.cate_fst_name}</td>
											                <td style="text-align:center;">${inout.cate_sec_name}</td>
											                <td style="text-align:center;">${inout.acnt_dtl_cont}</td>
											                <td style="text-align:center; color: red;"> ${inout.amnt} </td>
											            </tr>
													
														<c:set var="loop_flag" value="true" />
													</c:if>
												</c:if>
												
													<!-- 비공개 -->
													<c:if test="${not loop_flag }">
													
													<tr>
										                <td style="text-align:center;">
										                	<fmt:parseDate value="${inout.acnt_date}" var="day" pattern="yyyy-mm-dd" />
															<fmt:formatDate value="${day}" pattern="dd" />
										                </td>
										                <td style="text-align:center; color: red;">${inout.inout_cont}</td>
										                <td style="text-align:center;">${inout.cate_fst_name}</td>
										                <td style="text-align:center;">${inout.cate_sec_name}</td>
										                <td style="text-align:center; color: red;"> ${inout.amnt} </td>
										            </tr>
													
												</c:if>
													</c:forEach>
											</c:if>
									 		</c:forEach>
								            </tbody>
								          </table>
									</div>
								</div>
							</div>
						</div>

						<br>
						
						<!-- 나의 수입대비지출 -->
						<div class="col-md-12">
						
							<br><br>

							<div class="list-group">
								<h4>수입 대비 지출</h4>
								<h4 style="text-align: right;">
									<small style="color: #f79900;">■ 수입</small> <small
										style="color: #03a313;">■ 지출</small>
								</h4>
								
								<!-- 나의 수입 대비 지출 프로그레스바 -->
								<div class="progress" style="height: 50px; background-color: white;">
								
									<!-- 수입 퍼센트 -->
									<div class="progress-bar progress-bar bg-warning progress-bar-animated"
										role="progressbar"
										style="font-size: 17pt; width: ${totalIn / (totalIn + totalOut) * 100 }%;"
										aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										<fmt:formatNumber value="${totalIn / (totalIn + totalOut) * 100 }" pattern=".00"/> %
									</div>
									
									<!-- 지출 퍼센트 -->
									<div class="progress-bar progress-bar bg-success progress-bar-animated"
										role="progressbar"
										style="font-size: 17pt; width: ${totalOut / (totalIn + totalOut) * 100 }%;"
										aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										<fmt:formatNumber value="${totalOut / (totalIn + totalOut) * 100 }" pattern=".00"/> %
									</div>
								</div>
								
								<!-- 프로그레스바 추가 정보용 -->
								<div class="progress" style="height: 50px; background-color: white;">
								
									<!-- 수입 총액 -->
									<div class="progress-bar progress-bar bg-white progress-bar-animated"
										role="progressbar"
										style=";font-size: 13pt; color: #f79900; width: ${totalIn / (totalIn + totalOut) * 100 }%;"
										aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										${totalIn }
									</div>
									
									<!-- 지출 총액 -->
									<div class="progress-bar progress-bar bg-white progress-bar-animated"
										role="progressbar"
										style="font-size: 13pt; color: #03a313; width: ${totalOut / (totalIn + totalOut) * 100 }%;"
										aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										${totalOut }
									</div>

								</div>
							</div>
						</div>
						
						<!-- 수입이 있는지 없는지 -->
						<c:set var="writer_flag" value="false" />
						<c:if test="${not writer_flag }">
							
							<!-- 수입이 0원인지 -->
							<c:if test="${totalIn==0}">
								<div class="col-md-12">
									<div class="list-group">
										<br><br><br><br>
										<h4 style="text-align: center;"><img src="./img/noData.png"><br><small> 수입 내역이 없습니다! </small> </h4>
									</div>
								</div>
								<c:set var="writer_flag" value="true" />
							</c:if>
						</c:if>
						
						<c:if test="${not writer_flag }">
							<!-- 수입 분석 -->
							<div class="col-md-12">
								<div class="list-group">
									<br><br><br><br>
									<h4 style="text-align: center;"> 수입 분석 <small> </small> </h4>
									<!-- ★ 그래프가 들어가는 곳 -->
									<canvas id="myChart2" style="height: 500px;"></canvas>
								</div>
							</div>
						</c:if>
						
						<!-- 지출 분석 -->
						<div class="col-md-12">
							<div class="list-group">
								<br><br><br><br>
								<h4 style="text-align: center;"> 지출 분석 <small> </small> </h4>
								<!-- ★ 그래프가 들어가는 곳 -->
								<canvas id="myChart"  style="height: 600px;"></canvas>
							</div>
						</div>
						
						
						<!-- 소감 -->
						<div class="col-md-12">
							<div class="list-group">
								<br><br><br><br>
								<h4 style="text-align: center;"> 소감 <small> </small> </h4>
								
								<!-- 소감 -->
								<div class="list-group mt-3">
									<div class="list-group-item" style="background: #fff9e6;">
										<p style="text-align: center;">
											<c:forEach var="post" items="${postFind}">
						                  		${post.opinion}
						                  	</c:forEach>
										</p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
						
							<!-- 수정 / 신고 분기처리 -->
							<c:set var="writer_flag" value="false" />
							<c:if test="${not writer_flag }">
								<c:forEach var="post" items="${postFind }">
								
									<!-- 글작성자일때 - 수정버튼 -->
									<c:if test="${post.user_dstn_cd eq user_dstn_cd }">
										<div class="float-left">
											<br><br>
											<button class="btn" style="width: 100px;" onclick="moneyPostModifyForm()">수정</button>
											<!-- <button class="btn" style="width: 100px;">삭제</button> -->
							            </div>
										<c:set var="writer_flag" value="true" />
									</c:if>
									
								</c:forEach>
							</c:if>
							
							<!-- 글작성자가 아닐때 - 게시글 신고버튼 -->
							<c:if test="${not writer_flag and empty ad_cd}">
								<div class="float-left">
									<br><br>
									<button class="btn" style="width: 100px;" onclick="postReport()">신고</button>
					            </div>
							</c:if>
							
							<!-- ★★★ 이전글 다음글 미구현 ★★★ -->
							<div class="float-right">
								<br><br>
								<button class="btn" style="width: 100px;">이전 글</button>
								<button class="btn" style="width: 100px;">다음 글</button>
								<c:if test="${user_dstn_cd != -1}">
									<button class="btn" style="width: 100px;" onclick="userPostList()">목록</button>
								</c:if>
								
								<c:if test="${not empty ad_cd}">
									<button class="btn" style="width: 100px;" onclick="adPostList()">목록</button>
								</c:if>
			               </div>
			               
            			</div>
						
						<div class="col-md-12">
							
							<br><br><br><br>
							<h4 style="text-align: center;"> <small> </small></h4>
							<br><br>
							<div class="d-flex flex-row justify-content-center" style="width: 100%; text-align: center;">
							    
							    <!-- 받은 이모티콘 개수 세팅 시작 -->
							    <c:forEach var="count" items="${emtcCount }">
							    
								    <!-- 이모티콘 분기처리 -->
									<c:set var="writer_flag" value="false" />
									<c:if test="${not writer_flag }">
										<c:forEach var="post" items="${postFind }">
										
											<!-- 이모티콘 불가능 - 글작성자 본인이라서 -->
											<c:if test="${post.user_dstn_cd eq user_dstn_cd }">
												
												<div class="item" style="width: 200px;">
											    	<button type="button" class="emtcbtn" id="emtcbtnSelf1" style="border: none; background-color: white;">
											    		<img src="./img/emtc1.png">
											    	</button>
											    	<h3>${count.emtc1}</h3>
													<h5>텅장될 예정</h5>
												</div>
												
												<div class="item" style="width: 200px;">
													<button type="button" class="emtcbtn" id="emtcbtnSelf2" style="border: none; background-color: white;">
											    	<img src="./img/emtc2.png">
											    	</button>
											    	<h3>${count.emtc2}</h3>
													<h5>안사면 0원</h5>
												</div>
												
												<div class="item" style="width: 200px;">
											    	<button type="button" class="emtcbtn" id="emtcbtnSelf3" style="border: none; background-color: white;">
											    	<img src="./img/emtc3.png">
											    	</button>
											    	<h3>${count.emtc3}</h3>
													<h5>이대로만 쭉</h5>
												</div>
												
												<div class="item" style="width: 200px;">
											    	<button type="button" class="emtcbtn" id="emtcbtnSelf4" style="border: none; background-color: white;">
											    	<img src="./img/emtc4.png">
											    	</button>
											    	<h3>${count.emtc4}</h3>
													<h5>티끌모아 태산</h5>
												</div>
												
												<div class="item" style="width: 200px;">
											    	<button type="button" class="emtcbtn" id="emtcbtnSelf5" style="border: none; background-color: white;">
											    	<img src="./img/emtc5.png">
											    	</button>
											    	<h3>${count.emtc5}</h3>
													<h5>부자될 예정</h5>
												</div>
												
												<c:set var="writer_flag" value="true" />
											</c:if>
											
										</c:forEach>
									</c:if>
									
									<!-- ☆ 이모티콘 가능 - 글작성자가 아닐 경우 -->
									<c:if test="${not writer_flag and empty ad_cd }">
									
										<!-- ① 이모티콘1 등록여부 -->
										<c:set var="check_flag" value="true" ></c:set>
										
										<c:if test="${check_flag }">
											<c:forEach var="emtc1" items="${emtc1 }">
												<!-- 이모티콘1 등록한사람 == 로그인된코드 -->
												<c:if test="${emtc1.emtc_writer eq user_dstn_cd }">
													<c:set var="check_flag" value="false" />
												</c:if>
											</c:forEach>
										</c:if>
											
										<c:if test="${not check_flag }">
											<!-- 이모티콘1 이미 등록했을때 (누르면 등록취소가 되도록)  -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcdel1" style="border: none; background-color: white;">
										    		<img src="./img/emtc1.png">
										    	</button>
										    	<h3>${count.emtc1}</h3>
												<h5>텅장될 예정</h5>
											</div>
										</c:if>
										
										<c:if test="${ check_flag }">
											<!-- 이모티콘1 등록안했을때 (누르면 등록이 되도록) -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcbtn1" style="border: none; background-color: white;">
										    		<img src="./img/emtc1.png" style="filter: grayscale(100%);">
										    	</button>
										    	<h3>${count.emtc1}</h3>
												<h5>텅장될 예정</h5>
											</div>
										</c:if>
										
										<!-- ② 이모티콘2 등록여부 -->
										<c:set var="check_flag" value="true" ></c:set>
										
										<c:if test="${check_flag }">
											<c:forEach var="emtc2" items="${emtc2 }">
												<!-- 이모티콘2 등록한사람 == 로그인된코드 -->
												<c:if test="${emtc2.emtc_writer eq user_dstn_cd }">
													<c:set var="check_flag" value="false" />
												</c:if>
											</c:forEach>
										</c:if>
											
										<c:if test="${not check_flag }">
											<!-- 이모티콘2 이미 등록했을때 (누르면 등록취소가 되도록)  -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcdel2" style="border: none; background-color: white;">
										    		<img src="./img/emtc2.png">
										    	</button>
										    	<h3>${count.emtc2}</h3>
												<h5>안사면 0원</h5>
											</div>
										</c:if>
										
										<c:if test="${ check_flag }">
											<!-- 이모티콘2 등록안했을때 (누르면 등록이 되도록) -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcbtn2" style="border: none; background-color: white;">
										    		<img src="./img/emtc2.png" style="filter: grayscale(100%);">
										    	</button>
										    	<h3>${count.emtc2}</h3>
												<h5>안사면 0원</h5>
											</div>
										</c:if>
										
										<!-- ③ 이모티콘3 등록여부 -->
										<c:set var="check_flag" value="true" ></c:set>
										
										<c:if test="${check_flag }">
											<c:forEach var="emtc3" items="${emtc3 }">
												<!-- 이모티콘3 등록한사람 == 로그인된코드 -->
												<c:if test="${emtc3.emtc_writer eq user_dstn_cd }">
													<c:set var="check_flag" value="false" />
												</c:if>
											</c:forEach>
										</c:if>
											
										<c:if test="${not check_flag }">
											<!-- 이모티콘3 이미 등록했을때 (누르면 등록취소가 되도록)  -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcdel3" style="border: none; background-color: white;">
										    		<img src="./img/emtc3.png">
										    	</button>
										    	<h3>${count.emtc3}</h3>
												<h5>이대로만 쭉</h5>
											</div>
										</c:if>
										
										<c:if test="${ check_flag }">
											<!-- 이모티콘3 등록안했을때 (누르면 등록이 되도록) -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcbtn3" style="border: none; background-color: white;">
										    		<img src="./img/emtc3.png" style="filter: grayscale(100%);">
										    	</button>
										    	<h3>${count.emtc3}</h3>
												<h5>이대로만 쭉</h5>
											</div>
										</c:if>
										
										<!-- ④ 이모티콘4 등록여부 -->
										<c:set var="check_flag" value="true" ></c:set>
										
										<c:if test="${check_flag }">
											<c:forEach var="emtc4" items="${emtc4 }">
												<!-- 이모티콘4 등록한사람 == 로그인된코드 -->
												<c:if test="${emtc4.emtc_writer eq user_dstn_cd }">
													<c:set var="check_flag" value="false" />
												</c:if>
											</c:forEach>
										</c:if>
											
										<c:if test="${not check_flag }">
											<!-- 이모티콘4 이미 등록했을때 (누르면 등록취소가 되도록)  -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcdel4" style="border: none; background-color: white;">
										    		<img src="./img/emtc4.png">
										    	</button>
										    	<h3>${count.emtc4}</h3>
												<h5>티끌모아 태산</h5>
											</div>
										</c:if>
										
										<c:if test="${ check_flag }">
											<!-- 이모티콘4 등록안했을때 (누르면 등록이 되도록) -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcbtn4" style="border: none; background-color: white;">
										    		<img src="./img/emtc4.png" style="filter: grayscale(100%);">
										    	</button>
										    	<h3>${count.emtc4}</h3>
												<h5>티끌모아 태산</h5>
											</div>
										</c:if>
										
										
										<!-- ⑤ 이모티콘5 등록여부 -->
										<c:set var="check_flag" value="true" ></c:set>
										
										<c:if test="${check_flag }">
											<c:forEach var="emtc5" items="${emtc5 }">
												<!-- 이모티콘1 등록한사람 == 로그인된코드 -->
												<c:if test="${emtc5.emtc_writer eq user_dstn_cd }">
													<c:set var="check_flag" value="false" />
												</c:if>
											</c:forEach>
										</c:if>
											
										<c:if test="${not check_flag }">
											<!-- 이모티콘5 이미 등록했을때 (누르면 등록취소가 되도록)  -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcdel5" style="border: none; background-color: white;">
										    		<img src="./img/emtc5.png">
										    	</button>
										    	<h3>${count.emtc5}</h3>
												<h5>부자될 예정</h5>
											</div>
										</c:if>
										
										<c:if test="${ check_flag }">
											<!-- 이모티콘5 등록안했을때 (누르면 등록이 되도록) -->
											<div class="item" style="width: 200px;">
										    	<button type="button" class="emtcbtn" id="emtcbtn5" style="border: none; background-color: white;">
										    		<img src="./img/emtc5.png" style="filter: grayscale(100%);">
										    	</button>
										    	<h3>${count.emtc5}</h3>
												<h5>부자될 예정</h5>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
								
								<!-- 이모티콘 불가능 - 관리자 -->
								<c:if test="${not empty ad_cd }">
									
									<div class="item" style="width: 200px;">
								    	<button type="button" class="emtcbtn" id="emtcbtnAdmin1" style="border: none; background-color: white;">
								    		<img src="./img/emtc1.png">
								    	</button>
								    	<h3>${count.emtc1}</h3>
										<h5>텅장될 예정</h5>
									</div>
									
									<div class="item" style="width: 200px;">
										<button type="button" class="emtcbtn" id="emtcbtnAdmin2" style="border: none; background-color: white;">
								    	<img src="./img/emtc2.png">
								    	</button>
								    	<h3>${count.emtc2}</h3>
										<h5>안사면 0원</h5>
									</div>
									
									<div class="item" style="width: 200px;">
								    	<button type="button" class="emtcbtn" id="emtcbtnAdmin3" style="border: none; background-color: white;">
								    	<img src="./img/emtc3.png">
								    	</button>
								    	<h3>${count.emtc3}</h3>
										<h5>이대로만 쭉</h5>
									</div>
									
									<div class="item" style="width: 200px;">
								    	<button type="button" class="emtcbtn" id="emtcbtnAdmin4" style="border: none; background-color: white;">
								    	<img src="./img/emtc4.png">
								    	</button>
								    	<h3>${count.emtc4}</h3>
										<h5>티끌모아 태산</h5>
									</div>
									
									<div class="item" style="width: 200px;">
								    	<button type="button" class="emtcbtn" id="emtcbtnAdmin5" style="border: none; background-color: white;">
								    	<img src="./img/emtc5.png">
								    	</button>
								    	<h3>${count.emtc5}</h3>
										<h5>부자될 예정</h5>
									</div>
									
									<c:set var="writer_flag" value="true" />
								</c:if>
								
								
							</div>
							<br><br>
							<div class="list-group-item">
								
								<!-- 댓글 기능 -->
								<div class="list-group">
								
									<!-- 글작성자 구별하기 -->
									<c:set var="postCount_flag" value="false" />
									
									<!-- 등록개수 >= 3 -->
									<!-- 3개 이상 등록 -->
									<c:if test="${not postCount_flag }">
										<c:if test="${postCount >= 3 }">
											<form action="cmntadd.action" method="get">
										 		<input type="text" id="user_dstn_cd" name="user_dstn_cd" value="${user_dstn_cd }"  style="display: none;">
										 		<c:forEach var="post" items="${postFind }">
										 		<input type="text" id="post_cd" name="post_cd" value="${post.post_cd}" style="display: none;">
										 		</c:forEach>
												<textarea class="form-control" name="cmnt_cont" rows="3"></textarea>
												<button type="submit" class="btn btn-dark mt-3" id="cmntAdd" style="width: 100%;"> 댓글 작성 </button>
											</form>
											
											<c:set var="postCount_flag" value="true" />
										</c:if>
									</c:if>
									
									<!-- 3개 미만이지만 작성자일때 -->
									<!-- 작성자는 3개미만이어도 댓글 가능 -->
									<c:if test="${not postCount_flag }">
										<c:forEach var="post" items="${postFind }">
										<c:if test="${post.user_dstn_cd eq user_dstn_cd }">
										
											<form action="cmntadd.action" method="get">
										 		<input type="text" id="user_dstn_cd" name="user_dstn_cd" value="${user_dstn_cd }"  style="display: none;">
										 		<c:forEach var="post" items="${postFind }">
										 		<input type="text" id="post_cd" name="post_cd" value="${post.post_cd}" style="display: none;">
										 		</c:forEach>
												<textarea class="form-control" name="cmnt_cont" rows="3"></textarea>
												<button type="submit" class="btn btn-dark mt-3" id="cmntAdd" style="width: 100%;"> 댓글 작성 </button>
											</form>
											
											<c:set var="postCount_flag" value="true" />
										</c:if>
										</c:forEach>
									</c:if>
									
									<!-- 등록개수 >= 3 -->
									<!-- 3개 미만 등록 -->
									<c:if test="${not postCount_flag and empty ad_cd }">
											<form action="cmntadd.action" method="get">
										 		<input type="text" id="user_dstn_cd" name="user_dstn_cd" value="${user_dstn_cd }"  style="display: none;">
										 		<c:forEach var="post" items="${postFind }">
										 		<input type="text" id="post_cd" name="post_cd" value="${post.post_cd}" style="display: none;">
										 		</c:forEach>
												<textarea class="form-control" name="cmnt_cont" rows="3" disabled="disabled"> 머니리뷰를 3번 이상 공유한 사람만 피드백을 작성할 수 있습니다. </textarea>
											</form>
									</c:if>
									
									<!-- 관리자는 댓글 불가 -->
									<c:if test="${not empty ad_cd }">
											<form action="cmntadd.action" method="get">
												<textarea class="form-control" name="cmnt_cont" rows="3" disabled="disabled"> 관리자는 피드백을 작성할 수 없습니다. </textarea>
											</form>
									</c:if>
								 	
								
								</div>
								<br><br>
								
								<ul class="list-group">
								
									<!-- 위에 style 댓글 hover 참고하기 -->
									<!-- 반복문으로 댓글 구성 -->
									<c:forEach var="cmnt" items="${cmntList}">

										<!-- 출력 후 탈출하기 위한 set -->
										<c:set var="loop_flag" value="false" />
	
										<!-- 댓글 작성자일 경우 -->
										<c:if test="${not loop_flag }">
											<c:if test="${cmnt.user_dstn_cd eq user_dstn_cd }">
												
												<!-- 댓글 1개 (작성자) -->
												<li class="list-group-item list-group-item-action">
												
							                		<!-- 댓글 수정 -->
							                		<form action="cmntedit.action" method="get">
								                		<span class="cmntEdit" id="cmntEdit${cmnt.cmnt_cd}" style="display: none;">
									                		<textarea class="form-control" rows="1" name="cmnt_cont" id="cmnt_cont">${cmnt.cmnt_cont}</textarea>
									                		<input type="text" id="cmnt_cd" name="cmnt_cd" value="${cmnt.cmnt_cd}" style="display: none;">
									                		<c:forEach var="post" items="${postFind }">
													 			<input type="text" id="post_cd" name="post_cd" value="${post.post_cd}" style="display: none;">
													 		</c:forEach>
									                		<div style="float: left;">
																<button type="submit" class="close" style="width: 40px;">
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="blue" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
																	  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
																	</svg>
																</button>
															</div>
								                		</span>
							                		</form>
							                		
													<span class="cmntCont" id="cmntCont${cmnt.cmnt_cd}">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
															<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
														</svg>
														<b>${cmnt.cmnt_cont}</b>
														<%-- ${cmnt.user_dstn_cd}
														${cmnt.cmnt_cd} --%>
													</span>
													
													<div style="float: right; visibility:hidden;">
														
														<!-- 삭제하기 -->
														<button type="button" class="close" onclick="cmntDelete(${cmnt.cmnt_cd})" style="width: 40px;">
															<span aria-hidde="true">
																<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
																  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
																  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
																</svg>
															</span>
														</button>
														
														<!-- 수정하기 -->
														<button type="button" class="close" onclick="cmntEdit(${cmnt.cmnt_cd})" style="width: 40px;">
															<span aria-hidde="true">
																<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
																	<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
																</svg>
															</span>
														</button>
														
													</div>
												</li>
												
												<c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
								 		
								 		<!-- 댓글 작성자가 아닐경우 -->
								 		<c:if test="${not loop_flag and empty ad_cd }">
									 		
									 		<!-- 댓글 1개 (작성자아닌) -->
									 		<li class="list-group-item list-group-item-action">
						                		
												<span class="cmntCont" id="cmntCont${cmnt.cmnt_cd}">
													${cmnt.cmnt_cont}
													<%-- ${cmnt.user_dstn_cd}
													${cmnt.cmnt_cd} --%>
												</span>
												
												<div style="float: right; visibility:hidden;">
													
													<!-- 신고하기 -->
													<button type="button" class="close" onclick="cmntReport(${cmnt.cmnt_cd})" style="width: 40px;">
														<span aria-hidde="true">
															<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="bi bi-bell" viewBox="0 0 16 16">
															  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
															</svg>
														</span>
													</button>
													
												</div>
											</li>
										</c:if>
										
										<!-- 관리자일 경우 (수정, 삭제, 신고 모두 불가능) -->
								 		<c:if test="${not empty ad_cd }">
									 		
									 		<!-- 댓글 1개 (작성자아닌) -->
									 		<li class="list-group-item list-group-item-action">
						                		
												<span class="cmntCont" id="cmntCont${cmnt.cmnt_cd}">
													${cmnt.cmnt_cont}
												</span>
											</li>
										</c:if>
					                </c:forEach>
					                
								</ul>
								<br>
							</div>
							
							<br><br><br><br><br><br><br>
								
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
	
	<!-- 통계용 스크립트 영역 .. ※ 위로 옮기면 안되더라 -->
	<script>
	
		<!-- 모든 카테고리별 총합 데이터 수신 -->
		<c:forEach var="data" items="${inOutData }">
			var idata1 = ${data.cate_fst_1};
			var idata2 =${data.cate_fst_2};
			var idata3 =${data.cate_fst_3};
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
		var hap2 = idata1+idata2+idata3;
	
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
		
		// 수입 그래프
		var ctxP = document.getElementById('myChart2').getContext('2d');
		var myChart2 = new Chart(ctxP, {
			type : 'doughnut',
			data : {
				labels : [ "주수입" + " : "+idata1+" [ "+ (idata1/hap2*100).toFixed(3) + " %" +" ]"
					, "부수입" + " : "+idata2+" [ "+ (idata2/hap2*100).toFixed(3) + " %" +" ]"
					, "저축" + " : "+idata3+" [ "+ (idata3/hap2*100).toFixed(3) + " %" +" ]"
					],
				datasets : [
					{
						data : [ idata1, idata2, idata3],
						backgroundColor : [ "#FFDF00", "#FF88B9", "#00D3C5"],
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