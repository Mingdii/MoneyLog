<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String qna_cd = request.getParameter("qna_cd");
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 문의하기 열람</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script>
	
	// 답변코드 가져오기
	var ad_ansr_cd = '<c:out value="${adQnaView.ad_ansr_cd}"/>';
	var qna_cd = '<c:out value="${adQnaView.qna_cd}"/>';
	var ad_ansr_cont = '<c:out value="${adQnaView.ad_ansr_cont}"/>';
	
	
	// 답변 버튼을 눌렀을 때
	function regAnswer()
	{
		$(function()
		{
			//alert(qna_cd);
			
			var ad_ansr_cont = $("#newAnswer").val();
			
			// 답변 내용을 입력하지 않았을 때
			if ( ad_ansr_cont == "")
			{
				// 에러 메세지 표시
				$("#err1").css("display" ,"inline");
				$("#newAnswer").focus();
				return false;
			}
			else
			{
				// 컨트롤러의 문의글 답변 등록 메소드로 이동
				window.location.href = "./reganswer.action?ad_ansr_cont="+ad_ansr_cont+"&qna_cd="+qna_cd;
			}
		});
		
	}
	
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
              <form > <!-- action="/reganswer.action" method="get" id="regQna" -->
                <main id="adNotiList">
                    <section>
                        <div class="row">
                            <div class="col-12" id="List_title" style="margin-top: 30px;" >
                                <div class="list-title">
                                    문의글(관리자)
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <table id="cont" class="table2 col-12">
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                        <input type="text" value="${adQnaView.qna_title }" style="padding-left:15px; width: 500px; height:35px; border: 0px;" readonly="readonly">
                                        <td>
                                    </tr>
                                    <tr>    
                                        <th>문의자</th>
                                        <td>
                                        <input type="text"  value="${adQnaView.user_name }" style="padding-left:15px; width: 500px; height:35px; border:0 solid black;" readonly="readonly">
                                        <input type="text"  value="${adQnaView.user_id }" style="padding-left:15px; width: 500px; height:35px; border:0 solid black;" readonly="readonly">
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>문의일자</th>
                                        <td>
                                        <input type="text" value="${adQnaView.qna_date }" style="padding-left:15px; width: 500px; height:35px; border:0 solid black;" readonly="readonly">
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>내용</th>
                                        <td>
                                        <textarea name="content" rows="10" cols="60" class="textarea" readonly="readonly">${adQnaView.qna_cont }</textarea>
                                    </td>    
                                    </tr>
                            </table>
                        </div>
                    </section>
                    <section>
                        <div class="row" >
                            <div class="col-2" style="margin-top: 30px; text-align: right; font-weight: bold; font-size: 18px;" >
                                답변
                            </div>
                            <div class="col-8" style="margin-top: 20px; margin-bottom: 20px;" >
                                <div class="input-group">
                                
                                
                                <input type="text" id="newAnswer" class="form-control" style="height: 70px; border: 1px solid;" placeholder="내용을 입력해주세요.">
                                    <span class="input-group-btn">
                                     	<button class="btn btn-default" type="button" id="QnaRegBtn" style="background-color: skyblue; color: white;" data-toggle="modal" data-target="#modal">답변</button>
                                        <button class="btn btn-default" type="button" style="background-color: #F5CAC3; color: white;" disabled> 수정</button>
                                        <button class="btn btn-default" type="button" style="background-color: lightgray; color: white;" onclick="javascript:location.href='<%=cp%>/adqnalist.action'">목록</button>
                                    	
                                    	<input type="hidden" id="qna_cd" name="qna_cd" value=<%=qna_cd %> />
                                    	
                                    </span>
                                </div>
                            </div><!-- /.col-sm-8 -->
                            <div class="col-2" style="margin-top: 20px;" >
                                <img src="./img3/operator.png" width="80px;">
                            </div>
                        </div>
                        <div class="row" >
                    	    <div class="col-12" style="text-align: center;">
                    			<span id="err1" style="color: red; display: none;">※ 답변 내용을 입력해야 등록이 가능합니다.</span>
                    		</div>
                    	</div>
                    </section>
                </main>
                </form>
            </div>
        </div>
    </div>
</div>

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>



<!-- modal 만들기 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">등록되었습니다.</h4>
                
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidde="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body" style="text-align : center;">
                <form>
                    <img src="./img3/register.png" width="50%;">
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="regAnswer()">확인</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>