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
<title>댓글 내역 목록</title>

<script type="text/javascript">

</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 	
</script>
</head>
<body>

    <div class="wrap">
        <!-- ○ 상단 네비게이션 include -->
        <header>
            <header>
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
                    <main id="adUserCmmtList">
                        <section>
                            <div class="row">
                                <div class="col-sm-12 m-3">
                                    <div class="btn-group float-left ">
                                        <button type="button" class="btn info-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 댓글 내역 </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="./aduserinfo.action?user_dstn_cd=${param.user_dstn_cd }">상세 정보</a>
                                            <a class="dropdown-item" href="./aduserpostlist.action?user_dstn_cd=${param.user_dstn_cd }">게시글 내역</a>
                                            <a class="dropdown-item" href="./adusercmntlist.action?user_dstn_cd=${param.user_dstn_cd }" style="background-color: #F0B1A8;">댓글 내역</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section>
                            <div class="row">
                                <!-- 댓글 내역 -->
                                <div class="col-md-12">
                                    <div class="list-group">
                                        <h4>댓글 내역<small> 선택한 회원이 등록한 모든 댓글입니다.</small></h4>
                                        <div class="list-group-item">
                                            <div class="list-group">
                                                <table class="table table-striped">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col" class="mobile number-column" >no</th>
                                                        <th scope="col" class="mobile board-number-column">게시글 번호</th>
                                                        <th scope="col" class="mobile" >댓글 내용</th>
                                                        <th scope="col" class="mobile date-column">등록일</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    	
                                                    	<c:if test="${empty adUserCmntList}">
														<tr>
															<td colspan="4" style="text-align: center;">머니리뷰에 작성한 댓글이 없습니다.</td>
														</tr>
														</c:if>
														
														<c:if test="${not empty adUserCmntList}">
														<c:forEach var="adUserCmnt" items="${adUserCmntList }" varStatus="status">
                                                        <tr>
                                                            <td scope="row" class="mobile" >${fn:length(adUserCmntList) - status.index }</td>
                                                            <td scope="row" class="mobile" >
                                                                <a href="admoneypost.action?post_cd=${adUserCmnt.post_cd }" >${adUserCmnt.post_cd }</a>
                                                            </td>
                                                            <td><a href="admoneypost.action?post_cd=${adUserCmnt.post_cd }" >${adUserCmnt.cmnt_cont }</a></td>
                                                            <td class="mobile" style="text-align:center;">
												               <fmt:parseDate value="${adUserCmnt.cmnt_date }" var="cmnt_date" pattern="yyyy-MM-dd" />
															   <fmt:formatDate value="${cmnt_date}" pattern="yyyy-MM-dd" />
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