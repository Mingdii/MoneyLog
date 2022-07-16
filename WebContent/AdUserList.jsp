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
<title>회원목록</title>

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
            <%-- <nav class="navbar navbar-expand-lg navbar-dark">
                <a class="navbar-brand" href="./AdMain.jsp">MONEYLOG</a>
                <ol class="breadcrumb mobile" style="height: 30px; background: #FFD97D;">
                    <li class="active"> 안녕하세요. [ 김태형 ] 관리자님 반갑습니다.</li>
                </ol>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbar" aria-controls="navbar" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end"
                    id="navbar">
                    <div class="navbar-nav mr-sm-2">
                        <a class="nav-item nav-link active" href="/AdUserList.jsp">통합관리</a>
                        <a class="nav-item nav-link" href="/AdPostList.jsp">머니리뷰</a>
                        <a class="nav-item nav-link" href="/AdNotiList.jsp">고객지원</a>
                        <a class="nav-item nav-link" href="/AdLogin.jsp">로그아웃</a>
                    </div>
                </div>
            </nav> --%>
            <jsp:include page="./AdNavManage.jsp"></jsp:include>
        </header>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <!-- ○ 좌측 메뉴바 include -->
                    <jsp:include page="./AdMenuManage.jsp" flush="true"></jsp:include>
                    <%-- <div class="row d-flex d-md-block flex-nowrap wrapper">
                        <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar" style="position: fixed; top: 58px;">
                            <div class="list-group border-0 card text-center text-md-left">
                        
                                <h4 class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><span class="d-none d-md-inline ml-1"> 통합관리</span></h1>
                                <a href="AdUserList.jsp" class="list-group-item d-inline-block collapsed"  data-parent="#sidebar">
                                    <img style="width: 20px;" src="./img2/user.svg"><span class="d-none d-md-inline ml-1"> 회원목록</span>
                                </a>
                                
                                <a href="AdBan.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
                                    <img style="width: 20px;" src="./img2/user-check-black.svg"><span class="d-none d-md-inline ml-1"> 영구정지회원</span>
                                </a>
                                
                                <a href="#rept" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
                                data-parent="#sidebar" aria-expanded="false">
                                    <img style="width: 20px;" src="./img/edit.svg"><span class="d-none d-md-inline ml-1"> 신고처리</span>
                                </a>
                                <div class="collapse" id="rept">
                                    <a href="AdPostReptList.jsp" class="list-group-item" data-parent="#sidebar">게시글 신고처리</a>
                                    <a href="AdCmntReptList.jsp" class="list-group-item" data-parent="#sidebar">댓글 신고처리</a>
                                </div>
                                
                            </div> 
                        </nav>
                    </div> --%>
                </div>
            </div>
            
            <div class="span10">
                <main id="adUserList">
                    <section>
                        <div class="row">
                
                            <!-- 회원 리스트 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <br>
                                    <h4>회원 목록<small> 머니로그를 이용중인 회원입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table ad-user-list-table">
                                             	<tbody>
                                                    <!-- class="mobile" 는 화면이 990픽셀 이하로 작아지면 안보이게 처리 (모바일용)-->
                                                    <!-- 회원 목록 (화면 작아지면 번호, 이름, 상세정보만 뜨도록)  -->
                                                    <tr>
                                                        <th class="number-column mobile" >번호</th>
                                                        <th class="user-code-column mobile" >이용자코드</th>
                                                        <th class="user-name-column" >이름</th>
                                                        <th class="user-id-column" >아이디</th>
                                                        <th class="mobile user-date-column" >가입일자</th>
                                                        <th class="user-info-column" >상세정보</th>
                                                    </tr>
                                                    <!-- 
                                                    <tr>
                                                        <td class="mobile">4</td>
                                                        <td class="mobile">001002</td>
                                                        <td>이태</td>
                                                        <td>testfff@test.com</td>
                                                        <td class="mobile">2022-06-05</td>
                                                        <td>
                                                            <button type="button" class="btn btn-success" onclick="location.href='AdUserInfo.jsp'">보기</button>
                                                        </td>
                                                    </tr>
                                                    -->
                                                    
                                                    <c:if test="${empty adUserList }">
													<tr>
														<td colspan="6" style="text-align: center;">머니리뷰에 가입한 회원이 없습니다.</td>
													</tr>
													</c:if>
													
													<c:if test="${not empty adUserList }">
									                <c:forEach var="adUser" items="${adUserList }" varStatus="status">
                                                    <tr>
                                                        <td class="mobile">${fn:length(adUserList) - status.index }</td>
                                                        <td class="mobile">${adUser.user_dstn_cd }</td>
                                                        <td>${adUser.user_name }</td>
                                                        <td>${adUser.user_id }</td>     
														<td class="mobile" style="text-align:center;">
										                	<fmt:parseDate value="${adUser.user_date}" var="user_date" pattern="yyyy-mm-dd" />
															<fmt:formatDate value="${user_date}" pattern="yyyy-mm-dd" />
										                </td>
										                
                                                        <td>
                                                            <button type="button" class="btn btn-success" name="user_dstn_cd"
                                                            onclick="location.href='./aduserinfo.action?user_dstn_cd=${adUser.user_dstn_cd }'">보기</button>
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


	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>