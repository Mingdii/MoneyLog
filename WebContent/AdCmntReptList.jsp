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
<title>댓글 신고처리 목록</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	var msg = "<c:out value='${msg}'/>";      
	if(!msg=="")
	{
		// 댓글 신고처리 후 다시 댓글신고리스트 페이지로 돌아올 때 메세지 출력
		alert(msg);
	}

</script>
</head>
<body>

<div class="wrap">
    <header>
        <!-- ○ 상단 네비게이션 include -->
        <jsp:include page="./AdNavManage.jsp"></jsp:include>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuManage.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adCmntReptList">
                    <section>
                        <div class="row">
                                <div class="col-sm-9 m-3">
                                    <div class="btn-group float-left">
                                        <button type="submit" class="btn btn-primary unactivate-btn" onclick="location.href='./adpostreptlist.action'">게시글 신고</button>
                                        <button type="submit" class="btn btn-primary activate-btn" onclick="location.href='./adcmntreptlist.action'">댓글 신고</button>
                                    </div>
                                </div>
                            </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 댓글 신고처리 -->
                            <div class="col-md-12 mt-3">
                                <div class="list-group">
                                    <h4>댓글 신고처리<small> 신고 접수된 댓글 리스트입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table table-striped" style="max-width: 1080px;">
                                                <thead>
                                                    <tr>
                                                    	<!--  
                                                        <th scope="col" class="mobile wid-50-col">no</th>
                                                        <th scope="col" class="wid-150-col">신고 번호</th>
                                                        <th scope="col">댓글 내용</th>
                                                        <th scope="col" class="wid-150-col">신고 카테고리</th>
                                                        <th scope="col" class="mobile wid-150-col">신고일</th>
                                                        <th scope="col" class="wid-150-col">승인여부</th>
                                                        <th class="rept-column" >상세정보</th>
                                                        -->
                                                        <th scope="col" class="mobile wid-50-col">no</th>
                                                        <th scope="col" class="wid-150-col">신고 번호</th>
                                                        <th scope="col">댓글 내용</th>
                                                        <th scope="col" class="wid-150-col">신고 카테고리</th>
                                                        <th scope="col" class="mobile wid-150-col">신고일</th>
                                                        <th scope="col" class="wid-150-col">승인여부</th>
                                                        <th scope="rept-column" >상세정보</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	
                                                	<c:if test="${empty adCmntReptList }">
													<tr>
														<td colspan="7" style="text-align: center;">댓글 신고 접수 내역이 없습니다.</td>
													</tr>
													</c:if>
													
													<c:if test="${not empty adCmntReptList }">
									                <c:forEach var="cmntReptList" items="${adCmntReptList }" varStatus="status">
                                                    <tr>
                                                        
                                                        <td scope="row" class="mobile" >${fn:length(adCmntReptList) - status.index }</td>
                                                        <td scope="row" >
                                                            <a href="./adcmntrept.action?cmnt_rept_cd=${cmntReptList.cmnt_rept_cd }" >${cmntReptList.cmnt_rept_cd }</a>
                                                        </td>
                                                        <td class="content-title">
                                                            <a href="./adcmntrept.action?cmnt_rept_cd=${cmntReptList.cmnt_rept_cd }">${cmntReptList.cmnt_cont }</a> 
                                                        </td>
                                                        <td scope="row" >${cmntReptList.rept_cate_name }</td>
                                                        <td class="mobile" style="text-align:center;">
                                                        	<fmt:parseDate value="${cmntReptList.cmnt_rept_date}" var="cmntRept_date" pattern="yyyy-mm-dd" />
															<fmt:formatDate value="${cmntRept_date}" pattern="yyyy-mm-dd" />
														</td>
                                                        <td scope="row" >${cmntReptList.cnfm_result }</td>     
														
                                                        <td>
                                                            <button type="button" class="btn btn-success" 
                                                            onclick="location.href='./adcmntrept.action?cmnt_rept_cd=${cmntReptList.cmnt_rept_cd }'">보기</button>
                                                        </td>
                                                        
                                                    </tr>
                                                    </c:forEach>
													</c:if>
                                                    
                                                    <!-- 
                                                    <tr>
                                                        <td scope="row" class="mobile">5</td>
                                                        <td scope="row">
                                                            <a href="./AdCmntRept.jsp">2032</a>
                                                        </td>
                                                        <td class="content-title"> 
                                                            <a href="./AdCmntRept.jsp">이걸 가게부라고 썼냐~ </a>
                                                        </td>
                                                        <td scope="row">홍보</td>
                                                        <td class="mobile">2018-01-05</td>
                                                        <td scope="row"> - </td>
                                                    </tr>
                                                    -->
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