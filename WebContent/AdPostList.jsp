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
	
	function adPostInfoAction(postCd)
	{
		//alert(postCd)
		//alert(${pageNum});
		//alert(${postListCheck});
        window.location.href = "./adpostinfo.action?post_cd="+postCd+"&pageNum="+${pageNum}+"&postListCheck="+${postListCheck};
	}
	
	
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
</head>
<body>

<div class="wrap">
    <!-- ○ 상단 네비게이션 include -->
    <header>
		<!-- ○ 상단 네비게이션 include -->
		<jsp:include page="./AdNavMoney.jsp"></jsp:include>
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
                                    <button type="submit" class="btn btn-primary activate-btn" onclick="location.href='./adpostlist.action?pageNum=1'">게시글</button>
                                    <button type="submit" class="btn btn-primary unactivate-btn" onclick="location.href='./adcmntlist.action?pageNum=1'">댓글</button>
                                </div>
                                <div class="btn-group float-right">
                                
                                	<c:if test="${empty postListCheck}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                       	데이터 없음
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adpostlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item" href="./adpostlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item" href="./adpostlistPrivate.action?pageNum=1">비공개</a>
	                                    </div>
									</c:if>
                                
                                	<c:if test="${postListCheck==1}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        전체
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item dropdown-selected" href="./adpostlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item" href="./adpostlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item" href="./adpostlistPrivate.action?pageNum=1">비공개</a>
	                                    </div>
									</c:if>
									
									<c:if test="${postListCheck==2}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        공개
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adpostlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item dropdown-selected" href="./adpostlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item" href="./adpostlistPrivate.action?pageNum=1">비공개</a>
	                                    </div>
									</c:if>
									
									<c:if test="${postListCheck==3}">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        비공개
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="./adpostlist.action?pageNum=1">전체</a>
	                                        <a class="dropdown-item" href="./adpostlistOpen.action?pageNum=1">공개</a>
	                                        <a class="dropdown-item dropdown-selected" href="./adpostlistPrivate.action?pageNum=1">비공개</a>
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
                                	
                                	<c:if test="${postListCheck==1}">
										<h4> [전체] <small> 머니리뷰에 게시된 전체 게시글 리스트입니다.</small></h4>
									</c:if>
									
									<c:if test="${postListCheck==2}">
										<h4> [공개] <small> 머니리뷰에 게시된 공개된 게시글 리스트입니다.</small></h4>
									</c:if>
									
									<c:if test="${postListCheck==3}">
										<h4> [비공개] <small> 머니리뷰에 게시된 비공개된 게시글 리스트입니다.</small></h4>
									</c:if>

                                
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table table-striped" style="max-width: 1080px;">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="mobile" style="width:50px;" >no</th>
                                                        <th scope="col" style="width:150px;">게시글 코드</th>
                                                        <th scope="col" class="mobile" style="width:200px;">게시글 제목</th>
                                                        <th scope="col" class="mobile" style="width:150px;">작성자</th>
                                                        <th scope="col" class="mobile" style="width:150px;">날짜</th>
                                                        <th scope="col" style="width:150px;">공개여부</th>
                                                        <th scope="col" style="width:100px;">상세정보</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody>
                                                
                                                
	                                                <c:if test="${empty getPostList}">
														<tr>
															<td colspan="7">머니리뷰 게시글이 없습니다.</td>
														</tr>
													</c:if>
													 	
												 	<c:forEach var="list" items="${getPostList }" varStatus="loop">
												 		<tr>
															<td scope="row" class="mobile" >
																${list.rnum }
																<%-- ${fn:length(getPostList) - loop.index } --%>
															</td>
												  			<td scope="row">
												  				${list.post_cd}
												  			</td>
												  			
												  			<td class="mobile">
												  				<a href="./admoneypost.action?post_cd=${list.post_cd}">${list.post_title}</a>
												  			</td>
												  		
												  			<td class="mobile" scope="row">
												  				<c:if test="${empty getPostList}">
																	탈퇴회원
																</c:if>
												  				${list.user_id}
												  			</td>
												  			
												  			<td class="mobile">
												  				<fmt:parseDate value="${list.post_date}" var="post_date" pattern="yyyy-MM-dd" />
						                       					<fmt:formatDate value="${post_date}" pattern="yyyy-MM-dd" />
												  			</td>
												  		
												  			<td scope="row">
												  				${list.post_check}
												  			</td>
												  		
												  			<td >
                                                            	<button type="button" class="btn btn-success" onclick="adPostInfoAction(${list.post_cd})">보기</button>
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
						<div class="col-12 paging-div">
							<div id="paging">
								<p>${strList }${start }${end }</p>		
							</div>	
						</div>
					</div>
					<br><br><br>
					
                </main>
            </div>
        </div>
    </div>
</div>

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>