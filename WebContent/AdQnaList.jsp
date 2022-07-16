<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String ad_id = (String)request.getAttribute("ad_id");
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 문의사항 게시판</title>
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
                            <div class="col-12" id="List_title" style="margin-top: 30px;" >
                                <div class="list-title">
                                        문의사항
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-striped board-table">
                                    <tr>
                                        <!-- 항목 -->
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>답변처리</th>
                                        <th>등록일자</th>
                                    </tr>

                                    <c:if test="${empty adQnaList}">
									<tr>
										<td colspan="5" style="text-align: center;">등록된 공지사항이 없습니다.</td>
									</tr>
									</c:if>
									
									<c:if test="${not empty adQnaList}">
		                			<c:forEach var="adQna" items="${adQnaList }" varStatus="status">
		                			<tr>
			                			<td scope="row" class="mobile" style="text-align:center;">${adQna.rownum }</td>
			                			<%-- <td><a href="./adqnacont.action?qna_cd=${adQna.qna_cd }"" style="color: #000000;">${adQna.qna_title }</a></td> --%>
												                			
			                			<c:choose>
			                				<c:when test="${adQna.ad_ansr eq '-'}">
			                					<td><a href="./adqnacont.action?qna_cd=${adQna.qna_cd }" style="color: #000000;">${adQna.qna_title }</a></td>
			                				</c:when>
			                				<c:otherwise>
			                					<td><a href="./reganswerform.action?qna_cd=${adQna.qna_cd }" style="color: #000000;">${adQna.qna_title }</a></td>
			                				</c:otherwise>
			                			</c:choose>
			                		 
			                			<td class="mobile" style="text-align:center;">${adQna.ad_ansr }</td>
			                			<td class="mobile" style="text-align:center;">
			                				<fmt:parseDate value="${adQna.qna_date }" var="qna_date" pattern="yyyy-mm-dd" />
											<fmt:formatDate value="${qna_date}" pattern="yyyy-mm-dd" />
			                			</td>
									</tr>
									</c:forEach>
									</c:if>

                                </table>
                                <div class="row">
                                    <div class="col" style="place-items: center; display: grid;">
                                        <div id="paging" class="mb-5">
                                           <p>${strList }${start }${end }</p>	
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