<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자로그인</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/admin.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	// 아이디 혹은 비밀번호 틀려서 다시 로그인 페이지로 돌아올 때 메세지 출력
	var msg = "<c:out value='${msg}'/>";
	if(!msg=="")
	{
		alert(msg);
	}
	
	$(function()
	{
		$("#loginBtn").click(function()
		{
			$("#err").css("display", "none");
					
			if($("#ad_id").val()=="" || $("#ad_pw").val()=="")
			{
					$("#err").html("※ 항목을 모두 입력하세요.").css("display", "inline");
					return;
			}
			$("#adLoginForm").submit();	
		});
	});
	
</script>
</head>
<body>
    <div class="wrap">
        <!-- ○ 상단 네비게이션 include -->
        <header>
            <jsp:include page="./AdNavGuest.jsp"></jsp:include>
        </header>

        <section>
            <div class="container">
                <div class="row login-title" >
                    <div class="col-12" >
                        <h1>MONEYLOG</h1>
                    </div>
                    
                </div>
                <div class="row pt-2" >
                    <div id="loginForm">
                        <form action="adlogin.action" method="POST" id="adLoginForm"> 
                            <input type="text" id="ad_id" name="ad_id" class="text-field form-control" value="${cookie.id.value}" placeholder="아이디" />
                            <input type="password" id="ad_pw" name="ad_pw" class="text-field form-control" placeholder="비밀번호" />
                            <button type="button" class="btn btn-primary" id="loginBtn">관리자 로그인</button>
                            <div>
								<label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "" : "checked"}> 아이디 저장</label>
							</div>
                			<span id="err" style="color: red; display: none;"></span>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>