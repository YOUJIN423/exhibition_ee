<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>
<%@ include file="./calendar.jsp" %>
<%@ include file="./bookGetNum.jsp" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_book</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/book/book_deco_bookForm.css">
	<script src="<%=request.getContextPath() %>/js/book.js"></script>
		 
<script>
	$("#main-menu a").click(function() {
		$("#main-menu a").removeClass("active");
		$(this).addClass("active");
	});
	
</script>

</head>

<body>
	<header>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/main_index.do"> <img
				src="<%=request.getContextPath()%>/images/EELOGO_TEXTONLY_BK.png"
				width=800 height=160>
			</a>
		</div>

		<div class="account">
			<!-- 세션O -->
			<c:if test="${!empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_logout.do"
					class="icon1"> <strong>LOGOUT</strong></a>
				<a href="<%=request.getContextPath()%>/mypage/mypage.do" class="icon1"> <img
					src="<%=request.getContextPath()%>/images/picto_ticket.png"
					width=40 height=40>
				</a>
			</c:if>

			<!-- 세션X -->
			<c:if test="${empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_loginform.do"
					class="icon3"> <strong>LOGIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_join_agreeform.do"
					class="icon4"> <strong>JOIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_loginform.do"
					class="icon5"> <img
					src="<%=request.getContextPath()%>/images/picto_ticket.png"
					width=40 height=40>
				</a>
			</c:if>

			<nav role="navigation">
				<ul id="main-menu">
					<li><a
						href="<%=request.getContextPath()%>/main_about_introduce.do"><strong>ABOUT</strong></a></li>
					<li><a href="#"><strong>EXHIBITION</strong></a>
						<ul id="sub-menu">
							<li><a
								href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=y"
								aria-label="subemnu"> 진행 중인 전시</a></li>
							<li><a
								href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=n"
								aria-label="subemnu"> 종료 전시</a></li>
						</ul></li>

					<li><a href="#"><strong>NOTICE</strong></a>
						<ul id="sub-menu">
							<li><a href="<%=request.getContextPath()%>/main_notice.do"
								aria-label="subemnu">공지 사항</a></li>
							<li><a
								href="<%=request.getContextPath()%>/main_notice_faq.do"
								aria-label="subemnu">FAQ</a></li>
						</ul></li>

					<li><a href="#"><strong>INFORMATION</strong></a>
						<ul id="sub-menu">
							<li><a
								href="<%=request.getContextPath()%>/main_info_watching.do"
								aria-label="subemnu">관람 안내</a></li>
							<li><a
								href="<%=request.getContextPath()%>/main_info_booking.do"
								aria-label="subemnu">예매 안내</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>

	<main>
	<form name="book" method="post" action="<%=request.getContextPath()%>/book/bookInsert.do" onsubmit="return book_check()">
	<input type="hidden" name="mem_id" value="${sessionScope.mem_id}">
	<input type="hidden" name="ex_num" value="${exhibition.ex_num}">
	<input type="hidden" name="bo_re_num"  id="bo_re_num"  value="">
	
 	<!-- 예매할 전시 정보 출력 -->
 	<div class="exhibition">
 		<div class="card">
			<img src="<%=request.getContextPath() %>/upload/${exhibition.ex_poster}" class="card-img" alt="...">	
			<div class="card-body">
				<p class="card-text1"><strong>${exhibition.ex_name }</strong></p>
				<hr width="100%" align="center">
				<p class="card-text2">일시 : <fmt:formatDate value="${exhibition.ex_start}" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${exhibition.ex_end}" pattern="yyyy-MM-dd"/></p>
				<hr width="100%" align="center">
				<p class="card-text3">장소 : ${exhibition.ex_loc }</p>
			</div>
		</div>
	</div>
 	
 	<!-- 달력 출력 -->
 	<div class="hr">
 		<h4 class="text_h4">날짜 선택</h4>
 	</div>
 	
 	<div class="calendar1">
 	<div class="calendar_div">
	    <table class="Calendar" id="Calendar">
	    	<thead>
	    		<tr>
	    			<td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
	    			<td colspan="5">
	    				<span id="calYear"></span>년
	    				<span id="calMonth"></span>월
	    			</td>
	    			<td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
	    		</tr>
	    		<tr>
	    			<td>SUN</td>
	    			<td>MON</td>
	    			<td>TUE</td>
	    			<td>WED</td>
	    			<td>THU</td>
	    			<td>FRI</td>
	    			<td>SAT</td>
	    		</tr>
	    	</thead>
	
			<tbody></tbody>
		</table>
    </div>
    	<div class="booking_notice">
    		<p class="notice-text_bold">- 예매 및 관람 안내<p>
    		<p class="notice-text">온라인 개인예매는 관람일 14일 전부터 가능하며, 개인별 예매 가능한 인원은 최대 5명입니다.</p>
			<hr width="100%" align="center">
			<p class="notice-text">안전하고 쾌적한 관람을 위하여 반드시 예매 사항을 지켜주시기 바라며, 방문이 어려우시면 다른 관람객을 위해 반드시 예매를 취소해 주시기 바랍니다.</p>
			<hr width="100%" align="center">
			<p class="notice-text">선택하신 관람 시간부터 다음 관람 시간 전까지 입장 가능하며, 전시 관람은 18시까지 가능합니다.</p>
    	</div>
    </div>
    
	<!-- 시간 선택 -->
	<div class="hr">
		<h4 class="text_h4">시간 선택</h4>
	</div>
	<div class="clickTime" id="time_body" align="center"> 
		<div class="book_time" id="book_time">
			<div class="ul_list_left">
				<div class="time_part_1">
					<input type="radio" name="bo_time" id="select_time1" value=1>
						<label for="select_time1">10:00 ~ 12:00</label>
						<div class="time_text">
							<label for="select_time1" class="bo_text"></label>
							<label for="select_time1" class="bo_text1"></label>
						</div>
					<input type="hidden" id="bo_time_count1">
				</div>
				<div class="time_part_2">
					<input type="radio" name="bo_time" id="select_time3" value=3>
						<label for="select_time3">14:00 ~ 16:00</label>
						<div class="time_text">
							<label for="select_time3" class="bo_text"></label>
							<label for="select_time3" class="bo_text3"></label>
						</div>
					<input type="hidden" id="bo_time_count3">
				</div>			
			</div>
			<div class="ul_list_right">
				<div class="time_part_3">
					<input type="radio" name="bo_time" id="select_time2" value=2>
						<label for="select_time2">12:00 ~ 14:00</label>
						<div class="time_text">
							<label for="select_time2" class="bo_text"></label>
							<label for="select_time2" class="bo_text2"></label>	
						</div>
					<input type="hidden" id="bo_time_count2">	
				</div>		
				<div class="time_part_4">
					<input type="radio" name="bo_time" id="select_time4" value=4>
						<label for="select_time4">16:00 ~ 18:00</label>
						<div class="time_text">
							<label for="select_time4" class="bo_text"></label>
							<label for="select_time4" class="bo_text4"></label>
						</div>
					<input type="hidden" id="bo_time_count4">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 인원 선택 -->
	<div class="hr">
		<h4 class="text_h4">인원 선택</h4>
	</div>
	
	<div class="book_people" name="book_people" id="book_people">
		<div class="bo_a_adult"> 
			<div class="age1">
				<span class="age1-1">일반</span>
				<span class="age1-3">(만 25세~64세)</span>
				<strong class="age1-2">12,000원</strong>
			</div>
			<div class="age_radio1">
				<input type="radio" name="bo_a_adult" id="bo_a_adult0" value="0" checked="checked">
					<label for="bo_a_adult0">0</label>
				<input type="radio" name="bo_a_adult" id="bo_a_adult1" value="1" >
					<label for="bo_a_adult1">1</label>
				<input type="radio" name="bo_a_adult" id="bo_a_adult2" value="2" >
					<label for="bo_a_adult2">2</label>
				<input type="radio" name="bo_a_adult" id="bo_a_adult3" value="3" >
					<label for="bo_a_adult3">3</label>
				<input type="radio" name="bo_a_adult" id="bo_a_adult4" value="4" >
					<label for="bo_a_adult4">4</label>
				<input type="radio" name="bo_a_adult" id="bo_a_adult5" value="5" >
					<label for="bo_a_adult5">5</label>
			</div>
		</div>
		<div class="bo_a_freshman"> 
			<div class="age2">
				<span class="age2-1">청년</span>
				<span class="age2-3">(만 19~24세) 및 대학(원)생</span>
				<strong class="age2-2">6,000원</strong>
			</div>
			<div class="age_radio2">
				<input type="radio" name="bo_a_freshman" id="bo_a_freshman0" value="0" checked="checked">
					<label for="bo_a_freshman0">0</label>
				<input type="radio" name="bo_a_freshman" id="bo_a_freshman1" value="1" >
					<label for="bo_a_freshman1">1</label>
				<input type="radio" name="bo_a_freshman" id="bo_a_freshman2" value="2" >
					<label for="bo_a_freshman2">2</label>
				<input type="radio" name="bo_a_freshman" id="bo_a_freshman3" value="3" >
					<label for="bo_a_freshman3">3</label>
				<input type="radio" name="bo_a_freshman" id="bo_a_freshman4" value="4" >
					<label for="bo_a_freshman4">4</label>
				<input type="radio" name="bo_a_freshman" id="bo_a_freshman5" value="5" >
					<label for="bo_a_freshman5">5</label>
			</div>
		</div>
		<div class="bo_a_teen">
			<div class="age3">
				<span class="age3-1">청소년</span>
				<span class="age3-3">(만 7~18세)</span>
				<strong class="age3-2">6,000원</strong>
			</div>
			<div class="age_radio3">
				<input type="radio" name="bo_a_teen" id="bo_a_teen0" value="0" checked="checked">
					<label for="bo_a_teen0">0</label>
				<input type="radio" name="bo_a_teen" id="bo_a_teen1" value="1" >
					<label for="bo_a_teen1">1</label>
				<input type="radio" name="bo_a_teen" id="bo_a_teen2" value="2" >
					<label for="bo_a_teen2">2</label>
				<input type="radio" name="bo_a_teen" id="bo_a_teen3" value="3" >
					<label for="bo_a_teen3">3</label>
				<input type="radio" name="bo_a_teen" id="bo_a_teen4" value="4" >
					<label for="bo_a_teen4">4</label>
				<input type="radio" name="bo_a_teen" id="bo_a_teen5" value="5" >
					<label for="bo_a_teen5">5</label>
			</div>
		</div>
		<div class="bo_a_senior"> 
			<div class="age4">
				<span class="age4-1">시니어</span>
				<span class="age4-3">(만 65세 이상)</span>
				<strong class="age4-2">6,000원</strong>
			</div>
			<div class="age_radio4">
				<input type="radio" name="bo_a_senior" id="bo_a_senior0" value="0" checked="checked">
					<label for="bo_a_senior0">0</label>
				<input type="radio" name="bo_a_senior" id="bo_a_senior1" value="1" >
					<label for="bo_a_senior1">1</label>
				<input type="radio" name="bo_a_senior" id="bo_a_senior2" value="2" >
					<label for="bo_a_senior2">2</label>
				<input type="radio" name="bo_a_senior" id="bo_a_senior3" value="3" >
					<label for="bo_a_senior3">3</label>
				<input type="radio" name="bo_a_senior" id="bo_a_senior4" value="4" >
					<label for="bo_a_senior4">4</label>
				<input type="radio" name="bo_a_senior" id="bo_a_senior5" value="5" >
					<label for="bo_a_senior5">5</label>
			</div>
		</div>
		<div class="bo_a_free"> 
			<div class="age5">
				<span class="age5-1">무료 대상자</span>
				<strong class="age5-2">무료</strong>
			</div>
			<div class="age_radio5">
				<input type="radio" name="bo_a_free" id="bo_a_free0" value="0" checked="checked">
					<label for="bo_a_free0">0</label>
				<input type="radio" name="bo_a_free" id="bo_a_free1" value="1" >
					<label for="bo_a_free1">1</label>
				<input type="radio" name="bo_a_free" id="bo_a_free2" value="2" >
					<label for="bo_a_free2">2</label>
				<input type="radio" name="bo_a_free" id="bo_a_free3" value="3" >
					<label for="bo_a_free3">3</label>
				<input type="radio" name="bo_a_free" id="bo_a_free4" value="4" >
					<label for="bo_a_free4">4</label>
				<input type="radio" name="bo_a_free" id="bo_a_free5" value="5" >
					<label for="bo_a_free5">5</label>
			</div>		
		</div>
	</div>
	<div class="big_price">
		<h5 class="price-1">총 금액</h5><br> <!--제어 안될 시 제거 대상 1위  -->
		<div class="price-2" id="total_price">
			<p>0원</p>
		</div>
	</div>
	<div class="input_button_div">
		<input type="submit" class="input_button" value="결제하기">
	</div>

	<input type="hidden" name="bo_price" value="">
	<input type="hidden" name="bo_count" value="">
	
</form>
</main>

	<footer>
		<div class="footer_sns">
			<div class="inner_wrap">
				<a href="https://www.facebook.com/leeumofficial"> <img
					src="<%=request.getContextPath() %>/images/picto_twitter.png"
					width=40 height=40>
				</a> <a href="https://www.instagram.com/leeummuseumofart/"> <img
					src="<%=request.getContextPath() %>/images/picto_insta.png"
					width=40 height=40>
				</a> <a href="https://www.youtube.com/channel/UCyXVnJijxHsBrzN9AAZ-Yxw">
					<img src="<%=request.getContextPath() %>/images/picto_youtube.png"
					width=40 height=40>
				</a><br> <a href="<%=request.getContextPath()%>/main_ee_privacy.do" class="private">개인정보 처리 방침</a><br>
				<br>
			</div>
		</div>
		<div class="footer_addr">
			<div class="inner_wrap">
				ee Museum of Art<br> 서울특별시 마포구 신촌로176, 04104<br> 176,
				Sinchon-ro, Mapo-gu, Seoul, Republic of Korea, 04104<br> Tel)
				02 - 1234 - 5678<br> &copy; An Extraordinary Exhibition Museum
				of Art. All Rights reserved.<br>
				<br>
			</div>
		</div>
	</footer>

</body>
</html>