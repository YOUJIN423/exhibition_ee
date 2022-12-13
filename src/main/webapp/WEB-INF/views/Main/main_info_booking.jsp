<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_info_booking</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Main/main_deco_info_booking.css">
</head>

<body>
<header>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/main_index.do"> 
				<img src="<%=request.getContextPath()%>/images/EELOGO_TEXTONLY_BK.png" width=800 height=160>
			</a>
		</div>

		<div class="account">
			<!-- 세션O -->
			<c:if test="${!empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_logout.do" class="icon1"> 
					<strong>LOGOUT</strong></a>
				<a href="<%=request.getContextPath()%>/mypage/mypage.do" class="icon1"> 
					<img src="<%=request.getContextPath()%>/images/picto_ticket.png"	width=40 height=40>
				</a>
			</c:if>

			<!-- 세션X -->
			<c:if test="${empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_loginform.do" class="icon3"> 
					<strong>LOGIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_join_agreeform.do" class="icon4"> 
					<strong>JOIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_loginform.do" class="icon5"> 
					<img src="<%=request.getContextPath()%>/images/picto_ticket.png" width=40 height=40>
				</a>
			</c:if>

			<nav role="navigation">
				<ul id="main-menu">
					<li>
						<a href="<%=request.getContextPath()%>/main_about_introduce.do">
						<strong>ABOUT</strong></a>
					</li>
					<li>
						<a href="#">
						<strong>EXHIBITION</strong></a>
							<ul id="sub-menu">
								<li>
									<a href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=y" aria-label="subemnu"> 진행 중인 전시</a>
								</li>
								<li>
									<a href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=n" aria-label="subemnu"> 종료 전시</a>
								</li>
							</ul>
					</li>
					<li>
						<a href="#">
							<strong>NOTICE</strong>
						</a>
						<ul id="sub-menu">
							<li>
								<a href="<%=request.getContextPath()%>/main_notice.do" aria-label="subemnu">공지 사항</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/main_notice_faq.do" aria-label="subemnu">FAQ</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#">
							<strong>INFORMATION</strong>
						</a>
						<ul id="sub-menu">
							<li>
								<a href="<%=request.getContextPath()%>/main_info_watching.do" aria-label="subemnu">관람 안내</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/main_info_booking.do" aria-label="subemnu">예매 안내</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	
	<main>
		<div class="watching_wrap">
			<div class="watching_title">
				<ul>
					<h3>예매 안내</h3>
				</ul>	
			</div>
			<div class="watching_notice_list">
				<li class="arc1">
					<dt>입장료 안내</dt>
					<dd>
						<div class="small_s_wrap">
							<p class="small_s_title_1">일반</p>
							<p class="small_s_title_2">(만 25세~64세)</p>
							<p class="small_s_title_3">12,000원</p>
						</div>
						<div class="small_wrap">
							<p class="small_s_title_1">청년 및 대학(원)생  </p>
							<p class="small_s_title_2">(만 19~24세)</p>
							<p class="small_s_title_3">6,000원</p>
						</div>
						<div class="small_wrap">
							<p class="small_s_title_1">청소년  </p>
							<p class="small_s_title_2">(만 7~18세)</p>
							<p class="small_s_title_3">6,000원</p>
						</div>
						<div class="small_wrap">
							<p class="small_s_title_1">시니어  </p>
							<p class="small_s_title_2">(만 65세 이상)</p>
							<p class="small_s_title_3">6,000원</p>
						</div>
						<div class="small_wrap">
							<p class="small_s_title_1">무료 대상자</p>
							<p class="small_s_title_2">- </p>
							<p class="small_s_title_3">무료</p>
						</div>												
					</dd>
				</li>
				<li class="arc2">
					<dt>예매 유의사항</dt> 
					<dd>
						<div class="small_wrap">
							<p class="plus">1. 온라인 예매의 취소, 환불은  관람일 기준 전일까지 가능하며 , <br>그 이후 및 관람 일자 당일에 취소 처리는 불가합니다.</p>
						</div>
						<div class="small_wrap">
							<p class="plus">2. 관람 일자가 지난 티켓은 사용할 수 없습니다.</p>
						</div>
						<div class="small_wrap">
							<p class="plus">3. 현장에서는 당일 티켓만 구매 가능 합니다.</p>
						</div>																							
					</dd>
				</li>				
			</div>	
		</div>						
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