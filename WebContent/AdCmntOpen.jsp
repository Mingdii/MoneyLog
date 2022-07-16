<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script type="text/javascript">
	function newPage()
	{
        window.location.href = "./AdPostList.jsp"
	}
	
	function newPage2()
	{
        window.location.href = "./AdCmntInfo.jsp"
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
                <main id="adCmntOpen">
                    <section>
                        <div class="row">
                            <div class="col-sm-10 m-3">
                                <div class="btn-group float-left">
                                    <button type="submit" class="btn btn-primary" style="width:100px; background-color: #F7EDE2; color: #000000;" onclick="newPage()">게시글</button>
                                    <button type="submit" class="btn btn-primary" style="width:100px; background-color: #F5CAC3; color: #000000;">댓글</button>
                                </div>
                                <div class="btn-group float-right">
                                    <button type="button" class="btn btn-success dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        공개 </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="./AdCmntList.jsp">전체</a>
                                        <a class="dropdown-item" href="./AdCmntOpen.jsp" style="background-color: #F5CAC3;">공개</a>
                                        <a class="dropdown-item" href="./AdCmntPrivate.jsp">비공개</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
			
                            <!-- 게시글 리스트 -->
                            <div class="col-md-12">
            
                                <div class="list-group">
                                    <h4> [공개] <small> 머니리뷰에 게시된 댓글 리스트입니다.</small></h4>
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
                                                    <tr>
                                                        <td scope="row" class="mobile" style="text-align:center;">5</td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./AdPostRept.jsp" style="color: #000000;">2032</a>
                                                        </td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./AdPostRept.jsp" style="color: #000000;">135</a>
                                                        </td>
                                                        <td class="mobile"> 잘보고갑니다~ </td>
                                                        <td class="mobile" scope="row" style="text-align:center;">test@test.com</td>
                                                        <td class="mobile" style="text-align:center;">2022-01-05</td>
                                                        <td scope="row" style="text-align:center;"> 공개 </td>
                                                        <td style="text-align: center;">
                                                            <button type="button" class="btn btn-success" onclick="newPage2()">보기</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row" class="mobile" style="text-align:center;">5</td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./AdPostRept.jsp" style="color: #000000;">2032</a>
                                                        </td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./AdPostRept.jsp" style="color: #000000;">135</a>
                                                        </td>
                                                        <td class="mobile"> 가게부 이상하게 썼네요! </td>
                                                        <td class="mobile" scope="row" style="text-align:center;">test@test.com</td>
                                                        <td class="mobile" style="text-align:center;">2022-01-05</td>
                                                        <td scope="row" style="text-align:center;"> 공개 </td>
                                                        <td style="text-align: center;">
                                                            <button type="button" class="btn btn-success" onclick="newPage2()">보기</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row" class="mobile" style="text-align:center;">5</td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./AdPostRept.jsp" style="color: #000000;">2032</a>
                                                        </td>
                                                        <td scope="row" style="text-align:center;">
                                                            <a href="./AdPostRept.jsp" style="color: #000000;">135</a>
                                                        </td>
                                                        <td class="mobile"> 재밌게 보고갑니다~ </td>
                                                        <td class="mobile" scope="row" style="text-align:center;">test@test.com</td>
                                                        <td class="mobile" style="text-align:center;">2022-01-05</td>
                                                        <td scope="row" style="text-align:center;"> 공개 </td>
                                                        <td style="text-align: center;">
                                                            <button type="button" class="btn btn-success" onclick="newPage2()">보기</button>
                                                        </td>
                                                    </tr>
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