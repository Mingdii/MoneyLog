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
<title>신고하기 - 댓글</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
<script type="text/javascript">

	function cmntRept()
	{
		// 신고자
		var user_dstn_cd = ${user_dstn_cd};
		
		// 신고 카테고리
		var cate = document.getElementById("cmntReptCate");
		var rept_cate_cd = cate.options[cate.selectedIndex].value;
		
		// 신고 내용 (기타)
		var ReptDtlCont =  document.getElementById("cmntReptDtlCont");
		var cmnt_rept_dtl_cont =  ReptDtlCont.value;
		
		if (rept_cate_cd == 5)
		{
			// 카테고리 기타일때
			window.location.href = "./usercmntrept5.action?cmnt_cd="+${cmnt_cd}+"&user_dstn_cd="+user_dstn_cd+"&rept_cate_cd="+rept_cate_cd+"&cmnt_rept_dtl_cont="+cmnt_rept_dtl_cont;
			
		}
		else if (rept_cate_cd != 5)
		{
			// 그 외
			window.location.href = "./usercmntrept.action?cmnt_cd="+${cmnt_cd}+"&user_dstn_cd="+user_dstn_cd+"&rept_cate_cd="+rept_cate_cd;
		} 
	}
	
	// 신고 취소하기
	function reptCancel()
	{
		window.location.href ="./userpostlist.action?pageNum=1";
	}
	
	// 기타 선택시 텍스트 쓸 수 있게
	function cmntReptDtlContBox()
	{
		var cate = document.getElementById("cmntReptCate");
		var rept_cate_cd = cate.options[cate.selectedIndex].value;
		var cmnt_rept_dtl_cont = document.getElementById("cmntReptDtlCont");
		if (rept_cate_cd == 5)
		{
			cmntReptDtlCont.style.display='inline';
		}
		else if (rept_cate_cd != 5)
		{
			cmntReptDtlCont.style.display='none';
		} 
	}
	
	

</script>
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
	<!-- 코드 들어가기 -->	
	
		<div class="container">
			<div class="row">
				<div class="col-12" id="List_title" style="margin-top: 30px;" >
					신고하기 - 댓글
				</div>
			</div>
		</div>
	
		<div class="container">
				<div class="row">
					<c:forEach var="rept" items="${cmntRept }">
						<table id="reptCont" class="table2 col-12">
						     <tr>
						         <th>댓글 내용</th>
						      	 <td>
						      	 	<input type="text" value="${rept.cmnt_cont}" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black" readonly="readonly">
						      	 <td>
						     </tr>
						     <tr>
						         <th>게시글번호</th><!-- value 확인 -->
						      	 <td>
						      	 	<input type="text" value="${rept.rnum}" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
						      	 <td>
						     </tr>
						     <tr>    
						         <th>신고구분</th>
						         <td>
						         	<select id="cmntReptCate" name="cmntReptCate" class="" style="padding-left:15px; width:500px;height:35px;" onchange="cmntReptDtlContBox()">
						               <option value="1" selected="selected">홍보/도배글</option>
						               <option value="2">음란물</option>
						               <option value="3">명예훼손/사생활침해</option>
						               <option value="4">욕설/생명경시/혐오/차별</option>
						               <option value="5">기타</option>
						            </select>
						         </td>
						     </tr>
						     <tr>    
						         <th><div style="display: none;">내용</div></th>
						         <td>
						         	<textarea name="content" cols="60" rows="7"
						         	 id="cmntReptDtlCont" style="display: none;"></textarea>
						     	</td>    
						     </tr>
						     <tr>    
						         <th>신고일자</th><!-- value 확인 -->
						      	 <td>
						      	 	<input type="text" value="${rept.sysdate}" style="padding-left:15px; width:500px;height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
						      	 </td>
						     </tr>	
						</table>
					</c:forEach>
				</div>
				<div class="row">
						<div class="col-12" style="margin-top: 20px;">
							<button type="reset" class="btn btn-primary" style="background-color: #1fa766; float: right;" onclick="reptCancel()">취소하기</button>
							<button type="submit" class="btn btn-secondary" style="background-color: skyblue; float: right;"  data-toggle="modal" data-target="#modal">신고하기</button>
						</div>
				</div>
		</div>
	</div>				

	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- MDB 라이브러리 추가하기 <== chart!!!! **** -->
	<script src="./js/mdb.min.js"></script>


   <!-- modal 만들기 -->
   <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
   aria-hidden="true" >
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" >정말 신고하실건가요?</h4>
               
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidde="true">&times;</span>
               </button>
            </div>
            
            <div class="modal-body" style="text-align : center;">
               <form>
                  <img src="./img3/warning.png" width="50%;">
                  
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                     <button type="button" class="btn btn-primary" onclick="cmntRept()">신고하기</button>
                  </div>
                  
               </form>
            </div>
         </div>
      </div>
   </div>


</body>
</html>