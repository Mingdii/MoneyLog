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
<title>영구정지 회원 목록</title>

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
                    <main id="adBan">
                        <section>
                            <div class="row">
                                <!-- 영구정지 회원 리스트 -->
                                <div class="col-md-12 mt-3 mb-3">
                                    <div class="list-group">
                                        <h4>영구정지 회원 목록<small> 영구정지 처리된 회원입니다.</small></h4>
                                        <div class="list-group-item">
                                            <div class="list-group">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th class="number-column" >번호</th>
                                                            <th class="user-code-column mobile" >이용자코드</th>
                                                            <th class="name-column" >이름</th>
                                                            <th class="id-column mobile" >아이디</th>
                                                            <th class="ban-date-column mobile" >정지일자</th>
                                                            <th class="rept-column" >상세정보/신고내역</th>
                                                        </tr>
                                                        <!-- 
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이윤태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td>
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                         -->
                                              
                                                        <c:if test="${empty adBanList }">
														<tr>
															<td colspan="6" style="text-align: center;">영구정지된 회원이 없습니다.</td>
														</tr>
														</c:if>
														
														<c:if test="${not empty adBanList }">
										                <c:forEach var="adBan" items="${adBanList }" varStatus="status">
	                                                    <tr>
	                                                        <td>${fn:length(adBanList) - status.index }</td>
	                                                        <td class="mobile">${adBan.user_dstn_cd }</td>
	                                                        <td>${adBan.user_name }</td>
	                                                        <td class="mobile">${adBan.user_id }</td>     
															<td class="mobile" style="text-align:center;">
											                	<fmt:parseDate value="${adBan.ban_date}" var="ban_date" pattern="yyyy-mm-dd" />
																<fmt:formatDate value="${ban_date}" pattern="yyyy-mm-dd" />
											                </td>
	                                                        <td>
	                                                            <button type="button" class="btn btn-success" name="user_dstn_cd"
	                                                            onclick="location.href='./adbaninfo.action?user_dstn_cd=${adBan.user_dstn_cd }'">보기</button>
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