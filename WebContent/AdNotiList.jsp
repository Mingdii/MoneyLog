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
<title>공지사항 게시판</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
</head>
<body>

<div class="wrap">
    <header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./AdNavCs.jsp"></jsp:include>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuCs.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adNotiList">
                    <section>
                        <div class="row">
                            <div class="col-12 notice-title">
                                <div class="list-title">
                                        공지사항
                                </div>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-striped board-table">
	                                <tr>
	                                     <!-- 항목 -->
	                                     <th>번호</th>
	                                     <th>제목</th>
	                                     <th>작성자</th>
	                                     <th>등록일자</th>
	                                     <th>조회수</th>
	                                </tr>	

                                    <c:if test="${empty adNotiList}">
									<tr>
										<td colspan="5" style="text-align: center;">등록된 공지사항이 없습니다.</td>
									</tr>
									</c:if>
									
									<c:if test="${not empty adNotiList}">
		                			<c:forEach var="adNoti" items="${adNotiList }" varStatus="status">
		                			<tr>
			                			<td scope="row" class="mobile" style="text-align:center;">${adNoti.rownum }</td>
			                			<td><a href="./adnoticont.action?noti_cd=${adNoti.noti_cd }" style="color: #000000;">${adNoti.noti_title }</a></td>
			                			<td class="mobile" style="text-align:center;">${adNoti.ad_id }</td>
			                			<td class="mobile" style="text-align:center;">
			                				<fmt:parseDate value="${adNoti.noti_date }" var="noti_date" pattern="yyyy-mm-dd" />
											<fmt:formatDate value="${noti_date}" pattern="yyyy-mm-dd" />
			                			</td>
			                			<td class="mobile" style="text-align:center;">${adNoti.noti_view }</td>
									</tr>
									</c:forEach>
									</c:if>

                                </table>
                            </div>
                        </div>
                        <div class="row">	
                            <div class="col-12">
                                <button type="button" class="btn btn-success write-btn" onclick="location.href='./adnotiregform.action'">작성하기</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 board-paging">
                                <div class="paging">
                                    <p>${strList }${start }${end }</p>		
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