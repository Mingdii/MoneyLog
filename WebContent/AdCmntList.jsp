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

<script type="text/javascript">
	
	
	function adCmntInfoAction(cmntCd)
	{
		//alert(cmntCd)
		//alert(${pageNum});
		//alert(${postListCheck});
       window.location.href = "./adcmntinfo.action?cmnt_cd="+cmntCd+"&pageNum="+${pageNum}+"&cmntListCheck="+${cmntListCheck};
	}
	
</script>

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
        <header>
            <!-- ○ 상단 네비게이션 include -->
            <jsp:include page="./AdNavMoney.jsp"></jsp:include>
        </header>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuMoney.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adPostList">
                    <section>
                        <div class="row">
                            <div class="col-sm-10 m-3">
                                <div class="btn-group float-left">
                                    <button type="submit" class="btn btn-primary" style="width:100px; background-color: #F7EDE2; color: #000000;" onclick="location.href='./adpostlist.action?pageNum=1'">게시글</button>
                                    <button type="submit" class="btn btn-primary" style="width:100px; background-color: #F5CAC3; color: #000000;" onclick="location.href='./adcmntlist.action?pageNum=1'">댓글</button>
                                </div>
                                <div class="btn-group float-right">
                                
                                	<c:if test="${empty cmntListCheck}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                       	데이터 없음
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adcmntlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item" href="./adcmntlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item" href="./adcmntlistPrivate.action?pageNum=1">비공개</a>
	                                    </div>
									</c:if>
                                
                                	<c:if test="${cmntListCheck==1}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        전체
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adcmntlist.action?pageNum=1" style="background-color: #F5CAC3; border: none;">전체</a>
	                                        <a class="dropdown-item" href="./adcmntlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item" href="./adcmntlistPrivate.action?pageNum=1">비공개</a>
	                                    </div>
									</c:if>
									
									<c:if test="${cmntListCheck==2}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        공개
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adcmntlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item" href="./adcmntlistOpen.action?pageNum=1" style="background-color: #F5CAC3; border: none;">공개</a>
	                                        <a class="dropdown-item" href="./adcmntlistPrivate.action?pageNum=1">비공개</a>
	                                    </div>
									</c:if>
									
									<c:if test="${cmntListCheck==3}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        비공개
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adcmntlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item" href="./adcmntlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item" href="./adcmntlistPrivate.action?pageNum=1" style="background-color: #F5CAC3; border: none;">비공개</a>
	                                    </div>
									</c:if>
                                
                                
                                </div>
                                
                                
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 게시글 리스트 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                
                                	<c:if test="${cmntListCheck==1}">
										<h4> [전체] <small> 머니리뷰에 게시된 전체 댓글 리스트입니다.</small></h4>
									</c:if>
									
									<c:if test="${cmntListCheck==2}">
										<h4> [공개] <small> 머니리뷰에 게시된 공개된 댓글 리스트입니다.</small></h4>
									</c:if>
									
									<c:if test="${cmntListCheck==3}">
										<h4> [비공개] <small> 머니리뷰에 게시된 비공개된 댓글 리스트입니다.</small></h4>
									</c:if>
                                
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table table-striped" style="max-width: 1080px;">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="mobile" style="width:50px; text-align:center;">no</th>
                                                        <th scope="col" style="width:150px; text-align:center;">게시글 번호</th>
                                                        <th scope="col" style="width:150px; text-align:center;">댓글 번호</th>
                                                        <th scope="col" class="mobile" style="width:200px; text-align:center;">댓글 내용</th>
                                                        <th scope="col" class="mobile" style="width:150px; text-align:center;">작성자</th>
                                                        <th scope="col" class="mobile" style="width:150px; text-align:center;">날짜</th>
                                                        <th scope="col" style="width:150px; text-align:center;">공개여부</th>
                                                        <th scope="col" style="width:100px; text-align:center;">상세정보</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="list" items="${getCmntList }" varStatus="loop">
                                                    <tr>
                                                        <td scope="row" class="mobile" style="text-align:center;">${list.rnum }</td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./admoneypost.action?post_cd=${list.post_cd}">${list.post_cd }</a>
                                                        </td>
                                                        <td scope="row" style="text-align:center;">${list.cmnt_cd }</td>
                                                        <td class="mobile">${list.cmnt_cont }</td>
                                                        <td class="mobile" scope="row" style="text-align:center;">${list.user_id }</td>
                                                        <td class="mobile" style="text-align:center;">
                                                        	<fmt:parseDate value="${list.cmnt_date }" var="cmnt_date" pattern="yyyy-MM-dd" />
						                       				<fmt:formatDate value="${cmnt_date}" pattern="yyyy-MM-dd" />
						                       			</td>
                                                        <td scope="row" style="text-align:center;">${list.cmnt_check }</td>
                                                        <td style="text-align: center;">
                                                            <button type="button" class="btn btn-success" onclick="adCmntInfoAction(${list.cmnt_cd })">보기</button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    
                    <div class="row">
						<div class="col-12" style="place-items: center; display: grid;">
							<div id="paging">
								<p>${strList }${start }${end }</p>		
							</div>	
						</div>
					</div>
                    
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