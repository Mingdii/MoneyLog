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

<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
/*
	function newPage()
	{
	  window.location.href = "./adUserList.jsp"
	}
	
	function newPage2()
	{
	  window.location.href = "./myInfoModifyOk.jsp"
	}
*/
	
	$(document).ready(function()
	{	
		init(); //사용자의 db에 저장된 초기값으로 화면 최초 접근시 세팅  ---> 아래에 init()함수 만들어놧어유..
		
		// 수정 버튼이 클릭되었을 때 수행 해야 할 코드 처리
		$("#info_modifyBtn").click(function()
		{
			
 			// $("#myInfoModifyOk_userInfoForm").submit();	// 서브밋 하면 myinfomodifyok.action 처리 (전화번호 수정 불가)
			$('[name=area_sec]:hidden').remove(); //사용자가 최종 select한것만 넘기기 위해서 안보이면서 select된 select태그 자체를 삭제
			$('[name=job_sec]:hidden').remove();  //사용자가 최종 select한것만 넘기기 위해서 안보이면서 select된 select태그 자체를 삭제
			
			$("#myInfoModifyOk_userPlusForm").submit();	    // 서브밋 하면 myinfomodifyok.action 처리
			
		});
		
		$('#area_fst').on('change',function() //지역1차 변경시에 --> 지역1차에 해당하는 지역2차 불러오기 
		{
			var area_fst_cd = $('#area_fst').val();
			$('[name=area_sec]').hide();    //area_sec를 name으로 갖는 select 태그 전부 감춤
			$('#area_sec_'+area_fst_cd).show();
		});
		
		$('#job_fst').on('change',function() //직업1차 변경시, 변경한 직업1차에 해당하는 직업2차 불러오기 
		{
		    var job_fst_cd = $('#job_fst').val();
		    $('[name=job_sec]').hide();      //job_sec를 name으로 갖는 select 태그 전부 감춤
		    $('#job_sec_'+job_fst_cd).show();
		});

	});
	
	function init() 
	{
		//-- 페이지 최초요청되면 원래의 사용자 활용정보 뿌려주는 함수      --> 여기 실행 제대로 되는데 빨간줄 떠.. 무시...ㅎㅎ
		$('#marry_yn'  ).val( ${mrg_cd} );
		$('#child_num' ).val( ${child_cd} );
		$('#fml_num'   ).val( ${fml_cd} );
		$('#house_type').val( ${house_cd} );
		$('#pet_num'   ).val( ${pet_cd} );
		$('#car_num'   ).val( ${car_cd} );
		
		var area_fst_cd = ${area_fst_cd };
		$('#area_fst').val( area_fst_cd );
		$('#area_sec_'+area_fst_cd).show();
		$('#area_sec_'+area_fst_cd).val(${area_sec_cd });
		
		var job_fst_cd = ${job_fst_cd };
		$('#job_fst').val( job_fst_cd );
		$('#job_sec_'+job_fst_cd).show();
		$('#job_sec_'+job_fst_cd).val(${job_sec_cd });
    }
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMp.jsp"></jsp:include>
	
	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    	<div class="row d-flex d-md-block flex-nowrap wrapper">
            <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            	<!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./UserMenuMp.jsp"></jsp:include>
            </nav>
        </div>
		
		<div class="container">
			<div class="row">
				<!-- 계정정보 -->
				<div class="col-md-12">

					<div class="list-group">
						<br>
						<h4>계정정보<small> [ ${user_name } ] 님의 기본 계정정보 입니다.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
							    <form action="myinfomodifyok.action" id="myInfoModifyOk_userInfoForm">
								    <table class="table">
								    	<tbody>
								    	
								    		<!-- 계정 정보 -->
								    		<tr>
								    			<th style="width: 80px; text-align: center;">이름</th>
								    			<th class="mobile" style="width: 120px; text-align: center;">주민번호</th>
								    			<th class="mobile" style="width: 120px; text-align: center;">아이디</th>
								    			<th class="mobile" style="width: 120px; text-align: center;">전화번호</th>
								    			<th class="mobile" style="width: 120px; text-align: center;">번호수정</th>
								    		</tr>
								    		
								    		<!--  
								    		<tr>
								    			<td style="text-align: center;">이윤윤</td>
								    			<td class="mobile" style="text-align: center;">990501-1*****</td>
								    			<td class="mobile" style="text-align: center;">test@test.com</td>
								    			<td class="mobile" style="width: 100px; text-align: center;">
								    				<input type="text" name="tel" class="text-field form-control" value="010-2222-2222" disabled="disabled">
								    			</td>
								    			<td class="mobile" style="text-align: center;">
								    				<button type="button" class="btn btn-success" onclick="newPage()"> 본인인증 </button>
								    			</td>
								    		</tr>
								    		-->
								    		
								    		<tr>
								    			<td style="text-align: center;">${user_name }</td>
								    			<td class="mobile" style="text-align: center;">${ssn }******</td>
								    			<td class="mobile" style="text-align: center;">${user_id }</td>
								    			<td class="mobile" style="width: 100px; text-align: center;">
								    				<input type="text" name="tel" class="text-field form-control" value="${user_tel }"  disabled="disabled">
								    			</td>
								    			<td class="mobile" style="text-align: center;">
								    				<button type="button" class="btn btn-success" onclick="newPage()"> 본인인증 </button>
								    			</td>
								    				
								    		</tr>
								    
								    	</tbody>
								    </table>
								</form>
								
							</div>
						</div>
					</div>
				</div>
						
						
				<!-- 활용정보1 -->
				<div class="col-md-12">
					<br>
					<div class="list-group">
						<h4>활용정보<small> [ ${user_name } ] 님의 활용정보 입니다.</small></h4>
						<div class="list-group-item">
							<div class="list-group">
							<form action="myinfomodifyok.action" id="myInfoModifyOk_userPlusForm">
								<table class="table">
									<tbody>
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">결혼여부</th>
											<th style="text-align: center;">자녀수</th>
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name="mrg_cd" id="marry_yn">
												    <option value="1" selected="selected">기혼</option>
											    	<option value="2">미혼</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name="child_cd" id="child_num">
												    <option value="1" selected="selected">없음</option>
											    	<option value="2">1명</option>
												    <option value="3">2명</option>
												    <option value="4">3명 이상</option>
											  	</select>
											</td>
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">총가구구성원수</th>
											<th style="text-align: center;">주거형태</th>
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name="fml_cd" id="fml_num">
												    <option value="1" selected="selected">1인</option>
											    	<option value="2">2인</option>
												    <option value="3">3인</option>
												    <option value="4">4인</option>
												    <option value="5">5인 이상</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name="house_cd" id="house_type">
												    <option value="1" selected="selected">월세</option>
											    	<option value="2">전세</option>
												    <option value="3">자가</option>
											  	</select>
											</td>
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">반려동물</th>
											<th style="text-align: center;">차량운용대수</th>
											
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name="pet_cd" id="pet_num">
												    <option value="1" selected="selected">없음</option>
											    	<option value="2">1마리</option>
												    <option value="3">2마리</option>
												    <option value="4">3마리 이상</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name="car_cd" id="car_num">
												    <option value="1" selected="selected">없음</option>
											    	<option value="2">1대</option>
												    <option value="3">2대</option>
												    <option value="4">3대 이상</option>
											  	</select>
											</td>
											
										</tr>
										
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">지역 1차</th>
											<th style="text-align: center;">지역 2차</th>
										</tr>
												
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" id="area_fst">
												    <option value="1" selected="selected">서울</option>
											    	<option value="2">경기</option>
												    <option value="3">인천</option>
												    <option value="4">부산</option>
												    <option value="5">대구</option>
												    <option value="6">광주</option>
												    <option value="7">대전</option>
												    <option value="8">울산</option>
												    <option value="9">세종</option>
												    <option value="10">강원</option>
												    <option value="11">경남</option>
												    <option value="12">경북</option>
												    <option value="13">전남</option>
												    <option value="14">전북</option>
												    <option value="15">충남</option>
												    <option value="16">충북</option>
												    <option value="17">제주</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name = "area_sec" id="area_sec_1" style="display:none;">
											    	<option value="1" selected="selected">강남구</option>
												    <option value="2">강동구</option>
												    <option value="3">강북구</option>
												    <option value="4">강서구</option>
												    <option value="5">관악구</option>
												    <option value="6">광진구</option>
												    <option value="7">구로구</option>
												    <option value="8">금천구</option>
												    <option value="9">노원구</option>
												    <option value="10">도봉구</option>
												    <option value="11">동대문구</option>
												    <option value="12">동작구</option>
												    <option value="13">마포구</option>
												    <option value="14">서대문구</option>
												    <option value="15">서초구</option>
												    <option value="16">성동구</option>
												    <option value="17">성북구</option>
												    <option value="18">송파구</option>
												    <option value="19">양천구</option>
												    <option value="20">영등포구</option>
												    <option value="21">용산구</option>
												    <option value="22">은평구</option>
												    <option value="23">종로구</option>
												    <option value="24">중구 </option>
												    <option value="25">중랑구</option> 
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_2" style="display:none;">
											    	<option value="26" selected="selected">고양시</option>
												    <option value="27">과천시</option>
												    <option value="28">광명시</option>
												    <option value="29">광주시</option>
												    <option value="30">구리시</option>
												    <option value="31">군포시</option>
												    <option value="32">김포시</option>
												    <option value="33">남양주시</option>
												    <option value="34">동두천시</option>
												    <option value="35">부천시</option>
												    <option value="36">성남시</option>
												    <option value="37">수원시</option>
												    <option value="38">시흥시</option>
												    <option value="39">안산시</option>
												    <option value="40">안성시</option>
												    <option value="41">안양시</option>
												    <option value="42">양주시</option>
												    <option value="43">양평시</option>
												    <option value="44">여주시</option>
												    <option value="45">오산시</option>
												    <option value="46">용인시</option>
												    <option value="47">의왕시</option>
												    <option value="48">의정부시</option>
												    <option value="49">이천시</option>
												    <option value="50">파주시</option>
												    <option value="51">평택시</option>
												    <option value="52">포천시</option>
												    <option value="53">하남시</option>
												    <option value="54">화성시</option>
												    <option value="55">가평군</option>
												    <option value="56">연천군</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_3" style="display:none;">
											    	<option value="57" selected="selected">계양구</option>
												    <option value="58">남동구</option>
												    <option value="59">동구</option>
												    <option value="60">미추홀구</option>
												    <option value="61">부평구</option>
												    <option value="62">서구</option>
												    <option value="63">연수구</option>
												    <option value="64">중구</option>
												    <option value="65">강화군</option>
												    <option value="66">옹진군</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_4" style="display:none;">
											    	<option value="67" selected="selected">강서구</option>
												    <option value="68">금정구</option>
												    <option value="69">기장군</option>
												    <option value="70">남구</option>
												    <option value="71">동구</option>
												    <option value="72">동래구</option>
												    <option value="73">부산진구</option>
												    <option value="74">북구</option>
												    <option value="75">사상구</option>
												    <option value="76">사하구</option>
												    <option value="77">서구</option>
												    <option value="78">수영구</option>
												    <option value="79">연제구</option>
												    <option value="80">영도구</option>
												    <option value="81">중구</option>
												    <option value="82">해운대구</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_5" style="display:none;">
											    	<option value="83" selected="selected">남구</option>
												    <option value="84">달서구</option>
												    <option value="85">달성구</option>
												    <option value="86">동구</option>
												    <option value="87">북구</option>
												    <option value="88">서구</option>
												    <option value="89">수성구</option>
												    <option value="90">중구</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_6" style="display:none;">
											    	<option value="91" selected="selected">광산구</option>
												    <option value="92">남구</option>
												    <option value="93">동구</option>
												    <option value="94">북구</option>
												    <option value="95">서구</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_7" style="display:none;">
											    	<option value="96" selected="selected">동구</option>
												    <option value="97">대덕구</option>
												    <option value="98">서구</option>
												    <option value="99">유성구</option>
												    <option value="100">중구</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_8" style="display:none;">
											    	<option value="101" selected="selected">남구</option>
												    <option value="102">동구</option>
												    <option value="103">북구</option>
												    <option value="104">중구</option>
												    <option value="105">울주군</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_9" style="display:none;">
											    	<option value="106" selected="selected">세종특별자치시</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_10" style="display:none;">
											    	<option value="107" selected="selected">강릉시</option>
												    <option value="108">동해시</option>
												    <option value="109">삼척시</option>
												    <option value="110">속초시</option>
												    <option value="111">원주시</option>
												    <option value="112">춘천시</option>
												    <option value="113">태백시</option>
												    <option value="114">고성군</option>
												    <option value="115">양구군</option>
												    <option value="116">양양군</option>
												    <option value="117">영월군</option>
												    <option value="118">인제군</option>
												    <option value="119">정선군</option>
												    <option value="120">철원군</option>
												    <option value="121">평창군</option>
												    <option value="122">홍천군</option>
												    <option value="123">화천군</option>
												    <option value="124">횡성군</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_11" style="display:none;">
											    	<option value="125" selected="selected">거제시</option>
												    <option value="126">김해시</option>
												    <option value="127">밀양시</option>
												    <option value="128">사천시</option>
												    <option value="129">양산시</option>
												    <option value="130">진주시</option>
												    <option value="131">창원시</option>
												    <option value="132">통영시</option>
												    <option value="133">거창군</option>
												    <option value="134">고성군</option>
												    <option value="135">남해군</option>
												    <option value="136">산청군</option>
												    <option value="137">의령군</option>
												    <option value="138">창녕군</option>
												    <option value="139">하동군</option>
												    <option value="140">함안군</option>
												    <option value="141">함양군</option>
												    <option value="142">합천군</option>
											  	</select> 
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_12" style="display:none;">
											    	<option value="143" selected="selected">경산시</option>
												    <option value="144">경주시</option>
												    <option value="145">구미시</option>
												    <option value="146">김천시</option>
												    <option value="147">문경시</option>
												    <option value="148">상주시</option>
												    <option value="149">안동시</option>
												    <option value="150">영주시</option>
												    <option value="151">영천시</option>
												    <option value="152">포항시</option>
												    <option value="153">고령군</option>
												    <option value="154">군위군</option>
												    <option value="155">봉화군</option>
												    <option value="156">성주군</option>
												    <option value="157">영덕군</option>
												    <option value="158">영양군</option>
												    <option value="159">예천군</option>
												    <option value="160">울릉군</option>
												    <option value="161">울진군</option>
												    <option value="162">의성군</option>
												    <option value="163">청도군</option>
												    <option value="164">청송군</option>
												    <option value="165">칠곡군</option>
											  	</select>  
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_13" style="display:none;">
											    	<option value="166" selected="selected">광양시</option>
												    <option value="167">나주시</option>
												    <option value="168">목포시</option>
												    <option value="169">순천시</option>
												    <option value="170">여수시</option>
												    <option value="171">강진군</option>
												    <option value="172">고흥군</option>
												    <option value="173">곡성군</option>
												    <option value="174">구례군</option>
												    <option value="175">담양군</option>
												    <option value="176">무안군</option>
												    <option value="177">보성군</option>
												    <option value="178">신안군</option>
												    <option value="179">영광군</option>
												    <option value="180">영암군</option>
												    <option value="181">완도군</option>
												    <option value="182">장성군</option>
												    <option value="183">장흥군</option>
												    <option value="184">진도군</option>
												    <option value="185">함평군</option>
												    <option value="186">해남군</option>
												    <option value="187">화순군</option>
											  	</select>  
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_14" style="display:none;">
											    	<option value="188" selected="selected">군산시</option>
												    <option value="189">김제시</option>
												    <option value="190">남원시</option>
												    <option value="191">익산시</option>
												    <option value="192">전주시</option>
												    <option value="193">정읍시</option>
												    <option value="194">고창군</option>
												    <option value="195">무주군</option>
												    <option value="196">부안군</option>
												    <option value="197">순창군</option>
												    <option value="198">완주군</option>
												    <option value="199">임실군</option>
												    <option value="200">장수군</option>
												    <option value="201">진안군</option>
											  	</select> 
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_15" style="display:none;">
											    	<option value="202" selected="selected">계룡시</option>
												    <option value="203">공주시</option>
												    <option value="204">논산시</option>
												    <option value="205">당진시</option>
												    <option value="206">보령시</option>
												    <option value="207">서산시</option>
												    <option value="208">아산시</option>
												    <option value="209">천안시</option>
												    <option value="210">금산군</option>
												    <option value="211">부여군</option>
												    <option value="212">서천군</option>
												    <option value="213">예산군</option>
												    <option value="214">청양군</option>
												    <option value="215">태안군</option>
												    <option value="216">홍성군</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_16" style="display:none;">
											    	<option value="217" selected="selected">제천시</option>
												    <option value="218">청주시</option>
												    <option value="219">충주시</option>
												    <option value="220">괴산군</option>
												    <option value="221">단양군</option>
												    <option value="222">보은군</option>
												    <option value="223">영동군</option>
												    <option value="224">옥천군</option>
												    <option value="225">음성군</option>
												    <option value="226">증평군</option>
												    <option value="227">진천군</option>
											  	</select>
											  	<select class="form-control selectpicker" name = "area_sec" id="area_sec_17" style="display:none;">
											    	<option value="228" selected="selected">서귀포시</option>
												    <option value="229">제주시</option>
											  	</select>
											</td>
										</tr>
																
										<!-- 계정 정보 -->
										<tr>
											<th style="text-align: center;">직업 1차</th>
											<th style="text-align: center;">직업 2차</th>
										</tr>
												
										<tr>
											<td style="text-align: center;">
												<select class="form-control selectpicker" id="job_fst">
											    	<option value="1" selected="selected">기획/전략</option>
												    <option value="2">마케팅/홍보/조사</option>
												    <option value="3">회계/세무/재무</option>
												    <option value="4">인사노무/HRD</option>
												    <option value="5">총무/법무/사무</option>
												    <option value="6">IT개발/데이터</option>
												    <option value="7">디자인</option>
												    <option value="8">영업판매/무역</option>
												    <option value="9">상담/TM</option>
												    <option value="10">구매/자재/물류</option>
												    <option value="11">상품기획/MD</option>
												    <option value="12">운전/운송/배송</option>
												    <option value="13">서비스</option>
												    <option value="14">생산</option>
												    <option value="15">건설/건축</option>
												    <option value="16">의료</option>
												    <option value="17">연구/개발</option>
												    <option value="18">교육</option>
												    <option value="19">미디어/문화/스포츠</option>
												    <option value="20">금융/보험</option>
												    <option value="21">공공/복지</option>
												    <option value="22">요식업</option>
												    <option value="23">학생</option>
												    <option value="24">기타</option>
											  	</select>
											</td>
											<td style="text-align: center;">
												<select class="form-control selectpicker" name ="job_sec" id="job_sec_1" style="display:none;">
												    <option value="1" selected="selected">게임기획 </option>
												    <option value="2">경영기획</option>
												    <option value="3">광고기획</option>
												    <option value="4">교육기획</option>
												    <option value="5">기술기획</option>
												    <option value="6">문화기획</option>
												    <option value="7">법인장</option>
												    <option value="8">브랜드기획</option>
												    <option value="9">사업기획</option>
												    <option value="10">상품기획</option>
												    <option value="11">서비스기획</option>
												    <option value="12">앱기획</option>
												    <option value="13">웹기획</option>
												    <option value="14">인사기획 </option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_2" style="display:none;">
												    <option value="15" selected="selected">광고PD</option>
												    <option value="16">광고마케팅</option>
												    <option value="17">글로벌마케팅</option>
												    <option value="18">기업홍보</option>
												    <option value="19">디지털마케팅</option>
												    <option value="20">마케팅기획</option>
												    <option value="21">마케팅전략</option>
												    <option value="22">모바일마케팅</option>
												    <option value="23">미디어플래너</option>
												    <option value="24">바이럴마케팅</option>
												    <option value="25">병원마케팅</option>
												    <option value="26">브랜드마케팅</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_3" style="display:none;">
												    <option value="27" selected="selected">감사</option>
												    <option value="28">경리사무원</option>
												    <option value="29">공인회계사</option>
												    <option value="30">관계사</option>
												    <option value="31">관세사무원</option>
												    <option value="32">세무사</option>
												    <option value="33">재무</option>
												    <option value="34">전산회계</option>
												    <option value="35">행정사</option>
												    <option value="36">회계</option>
												    <option value="37">회계사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_4" style="display:none;">
												    <option value="38" selected="selected">노무사</option>
												    <option value="39">인사</option>
												    <option value="40">잡매니저</option>
												    <option value="41">직업상담사</option>
												    <option value="42">채용담당자</option>
												    <option value="43">헤드헌터</option>
												    <option value="44">ER(노무관리)</option>
												    <option value="45">HRD/HRM</option>
												    <option value="46">HR컨설팅</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_5" style="display:none;">
												    <option value="47" selected="selected">법률사무원</option>
												    <option value="48">법무</option>
												    <option value="49">법무사</option>
												    <option value="50">변리사</option>
												    <option value="51">변호사</option>
												    <option value="52">비서</option>
												    <option value="53">일반사무원</option>
												    <option value="54">서무</option>
												    <option value="55">총무</option>
												    <option value="56">특허명세사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_6" style="display:none;">
												    <option value="57" selected="selected">게임개발</option>
												    <option value="58">기술지원</option>
												    <option value="59">데이터분석가</option>
												    <option value="60">데이터엔지니어</option>
												    <option value="61">백엔드/서버개발</option>
												    <option value="62">보안컨설팅</option>
												    <option value="63">앱개발</option>
												    <option value="64">웹개발</option>
												    <option value="65">웹마스터</option>
												    <option value="66">유지보수</option>
												    <option value="67">정보보안</option>
												    <option value="68">퍼블리셔</option>
												    <option value="69">프론트엔드</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_7" style="display:none;">
												    <option value="70" selected="selected">가구디자인</option>
												    <option value="71">건축디자인</option>
												    <option value="72">게임디자인</option>
												    <option value="73">경관디자인</option>
												    <option value="74">공간디자인</option>
												    <option value="75">공공디자인</option>
												    <option value="76">공예디자인</option>
												    <option value="77">광고디자인</option>
												    <option value="78">그래픽디자인</option>
												    <option value="79">그림작가</option>
												    <option value="80">디지털디자인</option>
												    <option value="81">로고디자인</option>
												    <option value="82">모바일디자인</option>
												    <option value="83">무대디자인</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_8" style="display:none;">
												    <option value="84" selected="selected">가구판매</option>
												    <option value="85">가전판매</option>
												    <option value="86">건강식품판매</option>
												    <option value="87">건설영업</option>
												    <option value="88">관세사</option>
												    <option value="89">관세사무원</option>
												    <option value="90">광고영업</option>
												    <option value="91">국제무역사</option>
												    <option value="92">귀금속판매</option>
												    <option value="93">기계판매</option>
												    <option value="94">기술영업</option>
												    <option value="95">네트워크영업</option>
												    <option value="96">무역MR</option>
												    <option value="97">무역경리/사무원</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_9" style="display:none;">
												    <option value="98" selected="selected">상담원</option>
												    <option value="99">섭외TM</option>
												    <option value="100">아웃바운드</option>
												    <option value="101">이미지컨설턴트</option>
												    <option value="102">인바운드</option>
												    <option value="103">텔레마케터</option>
												    <option value="104">CS/CX매니저</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_10" style="display:none;">
												    <option value="105" selected="selected">구매</option>
												    <option value="106">구매관리</option>
												    <option value="107">구매기획</option>
												    <option value="108">국제물류</option>
												    <option value="109">물류관리</option>
												    <option value="110">물류기획</option>
												    <option value="111">물류사무원</option>
												    <option value="112">보세사</option>
												    <option value="113">유통관리</option>
												    <option value="114">자재관리</option>
												    <option value="115">재고/창고관리</option>
												    <option value="116">품질관리</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_11" style="display:none;">
												    <option value="117" selected="selected">기획MD</option>
												    <option value="118">리테일MD</option>
												    <option value="119">바잉MD</option>
												    <option value="120">브랜드MD</option>
												    <option value="121">슈퍼바이저</option>
												    <option value="122">영업MD</option>
												    <option value="123">오프라인MD</option>
												    <option value="124">마케팅MD</option>
												    <option value="125">유통MD</option>
												    <option value="126">패션MD</option>
												    <option value="127">매장관리연출기획자</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_12" style="display:none;">
												    <option value="128" selected="selected">납품운전원</option>
												    <option value="129">대리운전</option>
												    <option value="130">배달원</option>
												    <option value="131">물류기사</option>
												    <option value="132">배송기사</option>
												    <option value="133">배차관리</option>
												    <option value="134">보세/육상운송</option>
												    <option value="135">선적</option>
												    <option value="136">수행기사</option>
												    <option value="137">운전기사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_13" style="display:none;">
												    <option value="138" selected="selected">가사도우미</option>
												    <option value="139">가전제품설치</option>
												    <option value="140">검침원</option>
												    <option value="141">경비원</option>
												    <option value="142">경호원</option>
												    <option value="143">관광가이드</option>
												    <option value="144">관광통역안내사</option>
												    <option value="145">나레이터</option>
												    <option value="146">미용관리사</option>
												    <option value="147">룸메이드</option>
												    <option value="148">매장매니저</option>
												    <option value="149">매표/검표</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_14" style="display:none;">
												    <option value="150" selected="selected">계장설계</option>
												    <option value="151">공장장</option>
												    <option value="152">공정관리</option>
												    <option value="153">공정설계</option>
												    <option value="154">공정엔지니어</option>
												    <option value="155">구조해석/설계</option>
												    <option value="156">금형설계</option>
												    <option value="157">기계설계</option>
												    <option value="158">기계조작원</option>
												    <option value="159">기구설계</option>
												    <option value="160">기술설계</option>
												    <option value="161">기술엔지니어</option>
												    <option value="162">단순생산직</option>
												    <option value="163">미싱사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_15" style="display:none;">
												    <option value="164" selected="selected">가스기능사</option>
												    <option value="165">감리원</option>
												    <option value="166">감정평가사</option>
												    <option value="167">건물관리사</option>
												    <option value="168">건설견적원</option>
												    <option value="169">건설경리</option>
												    <option value="170">건축가</option>
												    <option value="171">건축구조설계</option>
												    <option value="172">건축기사</option>
												    <option value="173">검침원</option>
												    <option value="174">공무</option>
												    <option value="175">공인중개사</option>
												    <option value="176">공조냉동기사</option>
												    <option value="177">기계기사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_16" style="display:none;">
												    <option value="178" selected="selected">간호사</option>
												    <option value="179">간호조무사</option>
												    <option value="180">도수치료사</option>
												    <option value="181">마취간호사</option>
												    <option value="182">물리치료사</option>
												    <option value="183">심리치료사</option>
												    <option value="184">방사선사</option>
												    <option value="185">보건의료정보관리사</option>
												    <option value="186">보험심사청구사</option>
												    <option value="187">수의사</option>
												    <option value="188">위생사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_17" style="display:none;">
												    <option value="189" selected="selected">대기측정분석사</option>
												    <option value="190">엔지니어</option>
												    <option value="191">연구원</option>
												    <option value="192">인증심사원</option>
												    <option value="193">임상DM/STAT</option>
												    <option value="194">환경측정분석사</option>
												    <option value="195">임상PM/CRA</option>
												    <option value="196">개발</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_18" style="display:none;">
												    <option value="197" selected="selected">공부방교사</option>
												    <option value="198">과외</option>
												    <option value="199">교육컨설턴트</option>
												    <option value="200">교육컨텐츠개발/기획</option>
												    <option value="201">교직원</option>
												    <option value="202">대학강사</option>
												    <option value="203">돌봄교사</option>
												    <option value="204">방과후교사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_19" style="display:none;">
												    <option value="205" selected="selected">가수</option>
												    <option value="206">기상캐스터</option>
												    <option value="207">기술감독</option>
												    <option value="208">기자</option>
												    <option value="209">도슨트</option>
												    <option value="210">리포터</option>
												    <option value="211">방송BJ</option>
												    <option value="212">방송엔지니어</option>
												    <option value="213">사운드엔지니어</option>
												    <option value="214">선수</option>
												    <option value="215">성우</option>
												    <option value="216">쇼호스트</option>
												    <option value="217">스크립터</option>
												    <option value="218">스포츠강사</option>
												    <option value="219">아나운서</option>
												    <option value="220">에디터</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_20" style="display:none;">
												    <option value="221" selected="selected">금융사무</option>
												    <option value="222">금융상품영업</option>
												    <option value="223">대출상담사</option>
												    <option value="224">보험상담/설계</option>
												    <option value="225">보험상품개발</option>
												    <option value="226">보험심사</option>
												    <option value="227">손해사정사</option>
												    <option value="228">애널리스트</option>
												    <option value="229">은행원</option>
												    <option value="230">펀드매니저</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_21" style="display:none;">
												    <option value="231" selected="selected">군인/부사관</option>
												    <option value="232">도서관사서</option>
												    <option value="233">돌봄교사</option>
												    <option value="234">목회자</option>
												    <option value="235">병역특례</option>
												    <option value="236">보험상담원</option>
												    <option value="237">공무원</option>
												    <option value="238">사무직</option>
												    <option value="239">사회/생활복지사</option>
												    <option value="240">생활지도원/지원사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_22" style="display:none;">
												    <option value="241" selected="selected">주방장</option>
												    <option value="242">조리사</option>
												    <option value="243">바리스타</option>
												    <option value="244">제과제빵사</option>
												    <option value="245">영양사</option>
											  	</select>
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_23" style="display:none;">
												    <option value="246" selected="selected">초/중/고등학생</option>
												    <option value="247">대학/대학원생</option>
											  	</select>	
											  	<select class="form-control selectpicker" name ="job_sec" id="job_sec_24" style="display:none;">
												    <option value="248" selected="selected">무직</option>
												    <option value="249">프리랜서</option>
												    <option value="250">자영업</option>
												    <option value="251">아르바이트</option>
												    <option value="252">주부</option>
											  	</select>	
											  			
											</td>
										</tr>
										
									</tbody>
								</table>
								
								<div>
									 <button type="button" class="btn btn-success" id="info_modifyBtn" style="width: 100%;"> 수정하기 </button>
									<!-- <button type="button" class="btn btn-success" style="width: 100%;" onclick="newPage2()"> 수정하기 </button> -->
								</div>
								
							</form>
							</div>
						</div>
					</div>
				</div>
				
			
				
			</div>
			
			
			<!-- 밑에 공백만드는용 ㅠ -->
			<br><br><br><br><br><br><br><br><br><br>
			
			
		</div>
	</div>


	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		머니로그의 푸터 부분입니다. </footer>


	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- MDB 라이브러리 추가하기 <== chart!!!! **** -->
	<script src="./js/mdb.min.js"></script>

</body>
</html>