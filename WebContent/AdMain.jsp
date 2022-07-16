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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
</head>
<body>
    <div class="wrap">
        <!-- ○ 상단 네비게이션 include -->
        <header>
            <jsp:include page="./AdNavManage.jsp"></jsp:include>
        </header>	

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <!-- ○ 좌측 메뉴바 include -->
                    <jsp:include page="./AdMenuMain.jsp"></jsp:include>

                </div>

                <div class="span10">
                    <!-- 오늘의 할일 -->
                    <main>
                        <section>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="list-group">
                                        <br>
                                        <h4>오늘의 할일<small>  오늘 접수된 신고와 문의사항입니다.</small></h4>
                                        <div class="list-group-item">
                                            <div class="row m-1">
            
                                                <!-- 이미지 -->
                                                <div class="col-md-4 text-center p-5">
                                                    <a href="AdPostReptList.jsp"><img src="./img/event.svg"></a>
                                                    <h3>${countPostRept }</h3>
                                                    <h5>미처리된 게시글 신고</h5>
                                                </div>
                                                
                                                <!-- 이미지 -->
                                                <div class="col-md-4 text-center p-5">
                                                    <a href="AdCmntReptList.jsp"><img src="./img/event.svg"></a>
                                                    <h3>${countCmntRept }</h3>
                                                    <h5>미처리된 댓글 신고</h5>
                                                </div>
            
                                                <!-- 이미지 -->
                                                <div class="col-md-4 text-center p-5">
                                                    <a href="AdQnaList.jsp"><img src="./img/edit.svg"></a>
                                                    <h3>${countQna }</h3>
                                                    <h5>미답변된 문의</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
    
                        <!-- 공지사항 리스트 -->
                        <section>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="list-group">
                                        <br><br>
                                        <h4>공지사항<small> 페이지를 관리하세요.</small></h4>
            
                                        <div class="list-group-item">
                                            <div class="list-group table-container">
                                                <table class="table ad-main-table">
                                                    <tbody>
								                                           	
                                                        <!-- 공지사항 -->
                                                        <tr>
                                                            <th class="number-column mobile" >번호</th>
                                                            <th style="text-align: center;">제목</th>
                                                            <th class="mobile" style="width: 120px; text-align: center;">작성일</th>
                                                        </tr>
                                                        
                                                        <c:if test="${empty mainNotiList}">
														<tr>
															<td colspan="3" style="text-align: center;">공지사항이 없습니다.</td>
														</tr>
														</c:if>
														
														<c:if test="${not empty mainNotiList}">
										                <c:forEach var="mainNoti" items="${mainNotiList }" varStatus="status">
										                <tr>
											                <td class="number-column mobile">${mainNoti.noti_cd }</td>
											                <td><a href="./boardView.html">${mainNoti.noti_title }</a></td>
											                <td class="mobile">
											                	<fmt:parseDate value="${mainNoti.noti_date }" var="noti_date" pattern="yyyy-mm-dd" />
																<fmt:formatDate value="${noti_date}" pattern="yyyy-mm-dd" />
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
                        </section>
    
                        <!-- 신규회원 현황 -->
                        <section>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="list-group mt-3">
                                        <!-- <a href="#" class="list-group-item active">신규 회원</a> -->
                                        <br><br>
                                        <h4>회원 현황<small>  머니로그 신규 회원과 총 회원을 확인해보세요.</small></h4>
                
                                        <div class="list-group-item">
                                            <canvas id="lineChart"></canvas>
                                        </div>
                
                                    </div>
                                </div>
                            </div>
    
                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <div class="list-group">
                                        <!-- <a href="#" class="list-group-item active">회원 현황</a> -->
                                        <br><br>
                                        <h4>신규회원 현황<small></small></h4>
                
                                        <div class="list-group-item">
                                            <div class="list-group  table-container">
                                                <table class="table ad-main-table">
                                                    <tbody>
                                                    
                                                        <!-- 게시글 -->
                                                        <tr>
                                                            <th class="member-column" >전체 회원</th>
                                                            <th class="member-column mobile" >신규 회원</th>
                                                            <th class="member-column mobile">탈퇴 회원</th>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td class="member-column">${userCount }</td>
                                                            <td class="member-column mobile">${newUserCount }</td>
                                                            <td class="member-column mobile">${leaveUserCount }</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
        
                                    <div class="list-group">
                                        <!-- <a href="#" class="list-group-item active">머니리뷰 현황</a> -->
                                        <br><br>
                                        <h4>머니로그 현황<small></small></h4>
                
                                        <div class="list-group-item">
                                            <div class="list-group  table-container">
                                                <table class="table ad-main-table">
                                                    <tbody>
                                                    
                                                        <!-- 게시글 -->
                                                        <tr>
                                                            <th class="post-column" >전체 게시글</th>
                                                            <th class="post-column mobile" >신규 게시글</th>
                                                            <th class="post-column mobile" >비공개 게시글</th>
                                                            <th class="post-column mobile" >비공개 댓글</th>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td class="post-column" >${contentCount }</td>
                                                            <td class="post-column mobile" >${newContentCount }</td>
                                                            <td class="post-column mobile" >${reptContentCount }</td>
                                                            <td class="post-column mobile" >${reptCmntCount }</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </main>
                </div>
            </div>
        </div>
    </div>

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/mdb.min.js"></script>
	
	<script>
		// 월 신규 회원 수
		var data1 = ${data1};
		var data2 = ${data2};
		var data3 = ${data3};
		var data4 = ${data4};
		var data5 = ${data5};
		var data6 = ${data6};
		var data7 = ${data7};
		var data8 = ${data8};
		var data9 = ${data9};
		var data10 = ${data10};
		var data11 = ${data11};
		var data12 = ${data12};
		
		// 월 탈퇴 회원 수
		var ldata1 = ${ldata1};
		var ldata2 = ${ldata2};
		var ldata3 = ${ldata3};
		var ldata4 = ${ldata4};
		var ldata5 = ${ldata5};
		var ldata6 = ${ldata6};
		var ldata7 = ${ldata7};
		var ldata8 = ${ldata8};
		var ldata9 = ${ldata9};
		var ldata10 = ${ldata10};
		var ldata11 = ${ldata11};
		var ldata12 = ${ldata12};	
	
		var ctxL = document.getElementById("lineChart").getContext('2d');
		var myLineChart = new Chart(ctxL,
		{
			type : 'line',
			data :
			{
				labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				datasets : [
				{
					label : "신규 회원 수",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : [ data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12 ]
				},
				{
					label : "탈퇴 회원 수",
					fillColor : "rgba(151,187,205,0.2)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(151,187,205,1)",
					data : [ ldata1, ldata2, ldata3, ldata4, ldata5, ldata6, ldata7, ldata8, ldata9, ldata10, ldata11, ldata12 ]
				} ]
			},
			options :
			{
				responsive : true
			}
		});
	</script>

</body>
</html>