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
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">

<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>

</head>
<body>
<div class="wrap">
    <!-- ○ 상단 네비게이션 include -->
    <header>
        <header>
            <!-- ○ 상단 네비게이션 include -->
            <jsp:include page="./AdNavManage.jsp"></jsp:include>
        </header>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuManage.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adUserInfo">
                    <section>
                        <div class="row">
                            <div class="col-sm-12 m-3">
                                <div class="btn-group float-left">
                                    <button type="button" class="btn dropdown-toggle info-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 상세 정보</button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="./aduserinfo.action?user_dstn_cd=${param.user_dstn_cd }" style="background-color: #F0B1A8;">상세 정보</a>
                                        <a class="dropdown-item" href="./aduserpostlist.action?user_dstn_cd=${param.user_dstn_cd }">게시글 내역</a>
                                        <a class="dropdown-item" href="./adusercmntlist.action?user_dstn_cd=${param.user_dstn_cd }">댓글 내역</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 계정정보 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <h4>계정정보<small> 선택한 회원의 기본 계정정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table user-info-table">
                                                <tbody>
                                                    <!-- 계정 정보 -->
                                                    <tr>
                                                        <th class="code-column" >이용자코드</th>
                                                        <th class="name-column" >이름</th>
                                                        <th class="id-column mobile">아이디</th>
                                                        <th class="tel-column mobile" >전화번호</th>
                                                        <th class="date-column mobile" >가입일자</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td >${adUserInfo.user_dstn_cd }</td>
                                                        <td >${adUserInfo.user_name }</td>
                                                        <td class="mobile" >${adUserInfo.user_id }</td>
                                                        <td class="mobile" >${adUserInfo.user_tel }</td>
                                                        <td class="mobile" >
                                                        	<fmt:parseDate value="${adUserInfo.user_date }" var="user_date" pattern="yyyy-mm-dd" />
                                                        	<fmt:formatDate value="${user_date}" pattern="yyyy-mm-dd" />
                                                        </td>
                                                    </tr>
                                            
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 활용정보1 -->
                            <div class="col-md-12">
                                <br>
                                <div class="list-group">
                                    <h4>활용정보<small> 선택한 회원의 활용정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <tbody>
                                                    <!-- 계정 정보 -->
                                                    <tr>
                                                        <th >주민번호</th>
                                                        <th class="mobile">반려동물</th>
                                                        <th class="mobile">결혼여부</th>
                                                        <th class="mobile">자녀수</th>
                                                        <th class="mobile">총가구구성원수</th>
                                                        <th class="mobile">차량운용대수</th>
                                                        <th class="mobile">주거형태</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td >${adUserInfo.ssn }</td>
                                                        <td class="mobile">${adUserInfo.pet_num }</td>
                                                        <td class="mobile">${adUserInfo.mrg_yn }</td>
                                                        <td class="mobile">${adUserInfo.child_num }</td>
                                                        <td class="mobile">${adUserInfo.fml_num }</td>
                                                        <td class="mobile">${adUserInfo.car_num }</td>
                                                        <td class="mobile">${adUserInfo.house_type }</td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="2" >지역 1차</th>
                                                        <th class="mobile" colspan="2" >지역 2차</th>
                                                        <th colspan="2" >직업 1차</th>
                                                        <th class="mobile" colspan="2" >직업 2차</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="2" >${adUserInfo.area_fst_name }</td>
                                                        <td class="mobile" colspan="2" >${adUserInfo.area_sec_name }</td>
                                                        <td colspan="2" >${adUserInfo.job_fst_name }</td>
                                                        <td class="mobile" colspan="2" >${adUserInfo.job_sec_name }</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 신고내역 -->
                            <div class="col-md-12">
                                <br>
                                <div class="list-group">
                                    <h4>신고내역<small> 지난 6개월 내 처리된 신고내역 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <tbody>
                                                    <tr>                                 
                                                        <th>신고처리코드</th>  
														<th>신고처리일자</th>
														<th>승인여부</th>    
                                                    </tr>

													<c:choose>
													   <c:when test="${not empty userReptHistory }">
												         <c:forEach var="userRept" items="${userReptHistory}" varStatus="status">
												           <tr>
												             <td>						 			               
												               <c:set var ="post_reg_user" value="${userRept.post_reg_user}"/>
												               <c:if test="${userRept.user_dstn_cd == post_reg_user}"><a href="./adpostreptok.action?post_rept_cd=${userRept.post_rept_cd }">[게시글] ${userRept.ad_post_rept_cd }</a></c:if>
												               <c:if test="${userRept.user_dstn_cd != post_reg_user}"><a href="./adcmntreptok.action?cmnt_rept_cd=${userRept.post_rept_cd }">[댓글] ${userRept.ad_post_rept_cd }</a></c:if>
												             </td>
												             <td>
											                	 <fmt:parseDate value="${userRept.ad_post_rept_date}" var="ad_post_rept_date" pattern="yyyy-MM-dd" />
																 <fmt:formatDate value="${ad_post_rept_date}" pattern="yyyy-MM-dd" />
											                 </td>
											                 <td>${userRept.cnfm_result}</td>
												           </tr>
												         </c:forEach> 
												       </c:when>
												       <c:otherwise>
												         <tr>
												        	 <td colspan="3" style="text-align: center;">신고 처리 내역이 없습니다.</td>
												         </tr>
													   </c:otherwise>
												   </c:choose>
												   
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

</body>
</html>
