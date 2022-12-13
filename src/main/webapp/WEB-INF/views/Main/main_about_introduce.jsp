<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_Info_introduce</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Main/main_deco_about_introduce.css">

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
		<div class="introduce_wrap">
			<div class="watching_title">
				<ul>
					<h3>ee 미술관 소개</h3>
				</ul>	
			</div>
			<div class="watching_notice_list">
				<li class="arc1">
					<dt>
						<h4><strong>ee 아이덴티티<br>EE MUSEUM IDENTITY</strong></h4>
					</dt>
					<dd>
						<img src="<%=request.getContextPath() %>/images/EELOGO_TEXTONLY_BK_2.png" width=580 height=60  style="margin-left: 20px">
						<p class="plus">&nbsp;&nbsp;&nbsp; ee 미술관은 "An Extraordinary Exhibition"의 약자로 "특별한 전시", "특정 계층"의 향유물인 예술을 부정함으로써 대중 예술을 이끌어가는 미술관 입니다.</p>
					</dd>		
						<div class="small_wrap">
							<p class="plus">

							</p>
						</div>	
						<div class="small_wrap">
							<p class="plus"></p>
						</div>	
					</dd>
				</li>
				<li class="arc2">
						<h4><strong>ee 핵심 가치</strong></h4>	
							<div class="point_group">
								<ul class="point_obj">
									<img src="<%=request.getContextPath() %>/images/point_3.png" width=270 height=270>
									<span> AN EXTRAORDINARY EXHIBITION</span>
								</ul>
								<ul class="point_obj">
									<img src="<%=request.getContextPath() %>/images/point_1.png" width=270 height=270>
									<span>X EXTRAORDINARY</span>
								</ul>	
								<ul class="point_obj">
									<img src="<%=request.getContextPath() %>/images/point_2.png" width=270 height=270>
									<span>X EXHIBITION</span>
								</ul>																		
							</div>					
						<div class="small_wrap">
							<p class="plus_big">ee는 관객과 소통하는 미술관으로서 예술과 삶을 더욱 풍부하게 하는 데 기여하고자 합니다.</p>
						</div>
						<div class="small_wrap">
							<p class="plus">&nbsp;&nbsp;&nbsp;대중과 함께 호흡하며 문화를 선도하고 대중과 소통하는 것은 미술관으로서 ee의 가장 중요한 역할 입니다.<br>
											이를 위해 ee는 전시와 교육, 미술품 보존 등 각 분야의 전문적인 연구를 바탕으로 시의성 있는 주제와 중요 작가를 조명하는 기획전, 심도 있는 학술 행사와 교육 프로그램 등을 선보여 왔습니다.<br> 
											앞으로도 ee는 우리 시대얘술의 지평을 넓히고 미래의 문화를 선도하는 미술관의 역할을 더욱 충실히 할 것입니다.</p>
						</div>																								
				</li>				
				<li class="arc3">
					<dt><h4><strong>건축 디자인</strong></h4>	</dt>				
					<dd>
						<img src="<%=request.getContextPath() %>/images/ee_building.png" width=580 height=400 style="margin:0px 0px 30px 20px">
						<img src="<%=request.getContextPath() %>/images/ee_building_sketch.png" width=580 height=350 style="margin-left: 20px">
						<div class="small_wrap">
							<p class="plus_second">&nbsp;&nbsp;&nbsp; ee미술관은 몇 개의 덩어리로 축적된 ee 미술관 건물은 다양한 재료와 각기 다른 <br>
													공간으로 ee만의 이념을 담아낸 오브제입니다. 스페인산 라임스톤(석회암)과 흔히 볼 수<br> 
													없는 값비싼 신소재 티타늄 그리고 유리 세 가지 희귀한 소재들의 어우러짐으로 우아한 성질을 드러냅니다.<br>
													&nbsp;&nbsp;&nbsp; 전시 공간은 티타늄 패널이며, 유리 커튼 월의 개방된 부분은 관객들이 이동하는 공간입니다.
													미술관의 심장인 중앙 아트리움은 동심원 모양으로, 다시 여러 방향의 전시 공간으로 이동할 수 있도록 설계되었습니다.</p>
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