<%@ page contentType="text/html; charset=UTF-8"%>
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
<title>영구정지 회원 상세정보</title>

<script type="text/javascript">
	
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/admin.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="wrap">
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
                <main id="adBanInfo">
                    <section>
                        <div class="row">
                            <!-- 계정정보 -->
                            <div class="col-md-12 mt-3">
                                <div class="list-group">
                                    <h4>계정정보<small> 선택한 회원의 기본 계정정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <!-- 계정 정보 -->
                                                <tbody>
                                                    <tr>
                                                        <th class="user-code-column" style="width: 120px;">이용자코드</th>
                                                        <th class="name-column" style="width: 80px;">이름</th>
                                                        <th class="id-column" style="width: 120px;">아이디</th>
                                                        <th class="tel-column mobile" style="width: 120px;">전화번호</th>
                                                        <th class="date-column mobile" style="width: 120px;">가입일자</th>
                                                    </tr>
                                                    
                                                    <!--
                                                    <tr>
                                                        <td>001001</td>
                                                        <td>이윤윤</td>
                                                        <td>test@test.com</td>
                                                        <td class="mobile">010-0000-0000</td>
                                                        <td class="mobile">2022-06-05</td>
                                                    </tr>
                                                    -->
                                                     
                                                     <tr>
                                                        <td>${adUserInfo.user_dstn_cd }</td>
                                                        <td>${adUserInfo.user_name }</td>
                                                        <td>${adUserInfo.user_id }</td>
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
                            <!-- 신고내역 -->
                            <div class="col-md-12">
                                <br>
                                <div class="list-group">
                                    <h4>신고 처리 내역<small> 선택한 영구정지 회원의 지난 6개월 내 처리된 신고내역 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <th class="rept">신고처리코드</th>
                                                        <th class="rept">신고처리일자</th>
                                                    </tr>
                                                    
                                                    <!-- 
                                                    <tr>
                                                        <td><a href="AdPostRept.jsp">게시글122030</a></td>
                                                        <td>2022/05/29</td>
                                                    </tr>
                                                    -->
                                                     
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
												            <%-- <td>${userRept.ad_post_rept_date}</td> --%>
												           </tr>
												         </c:forEach> 
												       </c:when>
												       <c:otherwise>
												         <tr>
												        	 <td colspan="2" style="text-align: center;">신고 처리 내역이 없습니다.</td>
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