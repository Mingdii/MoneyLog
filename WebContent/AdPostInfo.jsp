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
<title>게시글 상세 정보</title>

<script type="text/javascript">
	function back()
	{

		//alert(${postListCheck});
		
		switch (${postListCheck})
		{
		case 1:
			//alert("전체");
			window.location.href = "./adpostlist.action?pageNum="+${pageNum};
			break;
			
		case 2:
			//alert("공개");
			window.location.href = "./adpostlistOpen.action?pageNum="+${pageNum};
			break;
			
		case 3:
			//alert("비공개");
			window.location.href = "./adpostlistPrivate.action?pageNum="+${pageNum};
			break;

		}
	}
	function getPost(post_cd)
	{
        window.location.href = "./admoneypost.action?post_cd="+post_cd;
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
                <main id="adPostInfo">
                    <section>
                    
                    
                    <c:forEach var="info" items="${getPostInfo}" varStatus="loop">
                    
                        <div class="row">
                            <!-- 게시글 상세정보 -->
                            <div class="col-md-12 mt-4">
                                <div class="list-group">
                                    <h4>게시글 상세정보<small> 선택한 게시글의 상세정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <tbody>
                                                
                                                    <!-- 상세 정보 -->
                                                    <tr>
                                                        <th colspan="3" style="font-weight:bold; width: 150px; text-align: center;">게시글 번호</th>
                                                        <th colspan="3" style="font-weight:bold; width: 200px; text-align: center;">등록 일자</th>
                                                        <th colspan="3" class="mobile" style="font-weight:bold; width: 200px; text-align: center;">작성자</th>
                                                        <th colspan="3" style="font-weight:bold; width: 150px; text-align: center;">공개 여부</th>
                                                        
                                                    </tr>
                                                    
                                                     
                                                    <tr>
                                                        <td colspan="3" style="text-align: center;">${info.post_cd}</td>
                                                        <td colspan="3" style="text-align: center;">
                                                        	<fmt:parseDate value="${info.post_date}" var="post_date" pattern="yyyy-MM-dd" />
						                       				<fmt:formatDate value="${post_date}" pattern="yyyy-MM-dd" />
                                                        </td>
                                                        
                                                        <td colspan="3" class="mobile" style="text-align: center;">${info.user_id}</td>
                                                        <td colspan="3" style="text-align: center;">${info.post_check}</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <th colspan="12" style="font-weight:bold; text-align: center;">게시글 내용</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="12" style="text-align: center;">${info.opinion}</td>
                                                    </tr>
                                                    
                                                    <!-- 게시글 버튼 -->
                                                    <tr>
                                                        <td colspan="12">
                                                            <button class="btn" style="width: 100%;" onclick="getPost(${info.post_cd})">게시글 보러가기</button>
                                                        </td>
                                                    </tr>
                                                
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
            
                            
                            <!-- 신고1 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <div class="list-group">
                                    <br><br>
                                    <h4>신고 내역<small></small></h4>
            
                                        <div class="list-group-item">
                                            <table class="table">
                                                <tbody>
                                                
                                                    <!-- 신고 접수 -->
                                                    <tr>
                                                        <th colspan="4" style="font-weight:bold; text-align: center;">신고 번호</th>
                                                        <th colspan="4" style="font-weight:bold; text-align: center;">접수 일자</th>
                                                        <th colspan="4" class="mobile" style="font-weight:bold; text-align: center;">신고자</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="4" style="text-align: center;">${info.post_rept_cd}</td>
                                                        <td colspan="4" style="text-align: center;">${info.post_rept_date}</td>
                                                        <td colspan="4" class="mobile" style="text-align: center;">${info.rept_user_id}</td>
                                                    </tr>
                                                    
                                                    <!-- 승인 여부 -->
                                                    <tr>
                                                        <th colspan="4" style="font-weight:bold; text-align: center;">승인 여부</th>
                                                        <th colspan="4" style="font-weight:bold; text-align: center;">처리자</th>
                                                        <th colspan="4" class="mobile" style="font-weight:bold; text-align: center;">처리 일자</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="4" style="text-align: center;">${info.post_cnfm}</td>
                                                        <td colspan="4" style="text-align: center;">${info.ad_id}</td>
                                                        <td colspan="4" class="mobile" style="text-align: center;">${info.post_cnfm_date}</td>
                                                    </tr>
                                                    
                                                    <!-- 신고 내용 -->
                                                    <tr>
                                                        <th colspan="6"  style="font-weight:bold; text-align: center;">신고 카테고리</th>
                                                        <th colspan="6" style="font-weight:bold; text-align: center;">신고 세부 사유</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="6" style="text-align: center;">${info.rept_cate_cd}</td>
                                                        <td colspan="6" style="text-align: center;">${info.post_rept_detail}</td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            <!-- 돌아가기 -->
                            <div class="col-md-12">
                                <table class="table">
                                    <tbody>
                                            
                                        <!-- 돌아가기 버튼 -->
                                        <tr>
                                            <td colspan="12">
                                                <br><br>
                                                <button class="btn" style="width: 100%;" onclick="back()">돌아가기</button>
                                            </td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    
                    </c:forEach>    
                    
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