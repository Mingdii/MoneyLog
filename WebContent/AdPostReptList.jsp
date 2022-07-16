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
<title>게시글 신고처리 목록</title>

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
		// 게시글 신고처리 후 다시 게시글신고리스트 페이지로 돌아올 때 메세지 출력
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
                <main id="adPostReptList">
                    <section>
                        <div class="row">
                                <div class="col-sm-9 m-3">
                                    <div class="btn-group float-left">
                                        <button type="submit" class="btn btn-primary" style="width:100px; background-color: #F5CAC3; color: #000000;" onclick="location.href='./adpostreptlist.action'">게시글 신고</button>
                                        <button type="submit" class="btn btn-primary" style="width:100px; background-color: #F7EDE2; color: #000000;" onclick="location.href='./adcmntreptlist.action'">댓글 신고</button>
                                    </div>
                                </div>
                            </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 게시글 신고처리 -->
                            <div class="col-md-12 mt-3">
                                <div class="list-group">
                                    <h4>게시글 신고처리<small> 신고 접수된 게시글 리스트입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table table-striped" style="max-width: 1080px;">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="number-column mobile">no</th>
                                                        <th scope="col" class="board-number-column">신고 번호</th>
                                                        <th scope="col">게시글 내용</th>
                                                        <th scope="col" class="rept-column">신고 카테고리</th>
                                                        <th scope="col" class="date-column mobile">신고일</th>
                                                        <th scope="col" class="check-column">승인여부</th>
                                                        <th class="rept-column" >상세정보</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	
                                                	<c:if test="${empty adPostReptList }">
													<tr>
														<td colspan="7" style="text-align: center;">게시글 신고 접수 내역이 없습니다.</td>
													</tr>
													</c:if>
													<!-- 
                                                    <tr>
                                                        <td scope="row" class="mobile" >5</td>
                                                        <td scope="row" >
                                                            <a href="./AdPostRept.jsp" >2032</a>
                                                        </td>
                                                        <td class="content-column"> 
                                                            <a href="./AdPostRept.jsp">저희 카페로 놀러오세요! (투썸 신용산역 어쩌구 홍보글)</a> 
                                                        </td>
                                                        <td scope="row" >홍보</td>
                                                        <td class="mobile" >2018-01-05</td>
                                                        <td scope="row" > - </td>
                                                    </tr>
                                                     -->
                                  
													<c:if test="${not empty adPostReptList }">
									                <c:forEach var="postReptList" items="${adPostReptList }" varStatus="status">
                                                    <tr>
                                                        
                                                        <td scope="row" class="mobile" >${fn:length(adPostReptList) - status.index }</td>
                                                        <td scope="row" >
                                                            <a href="./adpostrept.action?post_rept_cd=${postReptList.post_rept_cd }" >${postReptList.post_rept_cd }</a>
                                                        </td>
                                                        <td class="content-column"> 
                                                            <a href="./adpostrept.action?post_rept_cd=${postReptList.post_rept_cd }">${postReptList.opinion }</a> 
                                                        </td>
                                                        <td scope="row" >${postReptList.rept_cate_name }</td>
                                                        <td class="mobile" style="text-align:center;">
                                                        	<fmt:parseDate value="${postReptList.post_rept_date}" var="postRept_date" pattern="yyyy-mm-dd" />
															<fmt:formatDate value="${postRept_date}" pattern="yyyy-mm-dd" />
														</td>
                                                        <td scope="row" >${postReptList.cnfm_result }</td>     
														
                                                        <td>
                                                            <button type="button" class="btn btn-success" 
                                                            onclick="location.href='./adpostrept.action?post_rept_cd=${postReptList.post_rept_cd }'">보기</button>
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