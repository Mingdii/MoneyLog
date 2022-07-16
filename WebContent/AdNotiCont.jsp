<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 공지사항 열람</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">

	
</script>

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
                <main id="adNotiCont">
                    <section>
                        <div class="row">
                            <!-- <div class="col-12 notice-title" id="List_title"> -->
                            <div class="col-12 notice-title">
                                <div class="list-title">
                                    공지사항(관리자)
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12">
                                <table id="cont" class="table2">
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                            ${adNotiView.noti_title }
                                        </td>
                                        <th>작성일</th>
                                        <td>
                                            ${adNotiView.noti_date }
                                        <td>
                                    </tr>
                                    <tr>
                                        <th>공지유형</th>
                                        <td>
                                        	 <c:choose>
                                        	 	 <c:when test="${adNotiView.noti_pin eq 'N'}">
                                        	 	 	<label for="pin"><input type="checkbox" id="pin1" name="pin" disabled> 상단고정</label>
                                        	 	 </c:when>
                                        	 	 <c:otherwise>
                                        	 	 	<label for="pin"><input type="checkbox" id="pin2" name="pin" checked="checked" disabled> 상단고정</label>
                                        	 	 </c:otherwise>
                                        	 </c:choose>
                                        </td>
                                        <th>작성자</th>
                                        <td>
                                            ${adNotiView.ad_id }
                                        <td>	 
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                        <td colspan="4">
                                            <textarea class="table-content" name="content" rows="10" cols="60" readonly="readonly">${adNotiView.noti_cont }</textarea>
                                        </td>   
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12" style="margin-top: 20px;">
								<%--                             
                                <form id="UpdateForm" action="./adnotiupdateform.action" >
	                                <button type="button" id="updateBtn" class="btn btn-primary edit-btn">수정하기</button>
	                                <input type="hidden" name="noti_cd" id="noti_cd" value="${adNotiView.noti_cd }">
                                </form>
                                --%>
                                
                                <button type="submit" class="btn btn-primary edit-btn"
                                onclick="javascript:location.href='<%=cp%>/adnotiupdateform.action?noti_cd=${adNotiView.noti_cd}'">수정하기</button>
                                
                                <button type="submit" class="btn btn-secondary delete-btn"
                                data-toggle="modal" data-target="#modal">삭제하기</button>
                                
                                <button type="submit" class="btn btn-third return-btn"
                                onclick="javascript:location.href='<%=cp%>/adnotilist.action'">돌아가기</button>
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


<!-- modal 만들기 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">정말 삭제하실건가요?</h4>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidde="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align : center;">
                <form>
                    <img src="./img3/warning.png" width="50%;">
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" style="background-color: blue;" data-dismiss="modal">취소하기</button>
                        <button type="button" class="btn btn-primary" 
                        onclick="javascript:location.href='<%=cp%>/notidelete.action?noti_cd=${adNotiView.noti_cd}'">삭제하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>