<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_info_watching</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Main/main_deco_info_watching.css">
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
					<h3>관람 안내</h3>
				</ul>	
			</div>
			<div class="watching_notice_list">
				<li class="arc1">
					<dt>운영 시간 안내</dt>
					<dd>
						<div class="small_wrap">
							<p class="small_title_1">운영 시간</p>
							<p class="small_title_2">10:00 - 18:00</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">매표 마감</p>
							<p class="small_title_2">17:00</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">휴관일</p>
							<p class="small_title_2">매년 설날(음력)및 추석 당일</p>
						</div>
					</dd>
				</li>
				<li class="arc2">
					<dt>관람 시 유의 사항</dt> 
					<dd>
						<div class="small_wrap">
							<p class="plus">1. 작품을 손으로 만지지 마시기 바랍니다.</p>
						</div>
						<div class="small_wrap">
							<p class="plus">2. 음식물 반입과 애완 동물 출입은 금지되어 있습니다.(안내견 제외)</p>
						</div>
						<div class="small_wrap">
							<p class="plus">3. 소지품과 코트는 물품 보관함에 맡겨 주세요.</p>
						</div>				
						<div class="small_wrap">
							<p class="plus">4. 타 관람객의 관람을 방해하지 않도록 조용히 관람해주세요.</p>
						</div>	
						<div class="small_wrap">
							<p class="plus">5. 어린이를 동반할 경우 보호자 분의 각별한 주의를 부탁드립니다.</p>
						</div>		
						<div class="small_wrap">
							<p class="plus">6. 우천, 설천시 바닥이 미끄러운 관계로 야외 데크 진입이 제한될 수 있으니<br>&nbsp;&nbsp;&nbsp;관람시 참고 바랍니다.</p>
						</div>																				
					</dd>
				</li>				
				<li class="arc3">
					<dt>도슨트</dt> 
					<dd>
						<div class="small_wrap">
							<p class="small_title_1">도슨트 운영 시간</p>
							<p class="small_title_2">10:00 - 18:00</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">도슨트 마감</p>
							<p class="small_title_2">17:00</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">언어 지원</p>
							<p class="small_title_2">한 / 영</p>
						</div>
					</dd>
				</li>
				<li class="arc4">
					<dt>ee미술관 건물 구조</dt>				
					<dd>
						<img src="./images/ee_map.png" width=600 height=350>
					</dd>
				</li>
				<li class="arc5">
					<dt>오시는 길</dt>
					<dd class="kakaomap_control">
						<div class="small_wrap">
							<p class="small_title_1">ee 미술관</p>
							<p class="small_title_2">서울특별시 마포구 신촌로176</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">대중 교통</p>
							<p class="small_title_2">지하철 2호선 이대역 6번 출구에서 25m 이동</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">주차</p>
							<p class="small_title_2">지하 주차장 이용</p>
						</div>																		
							<p style="margin-top: -12px">
								<em class="link"> 
									<a href="javascript:void(0);"
										onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
									 </a>
								</em>
							</p>
							<div id="map" style="width: 580px; height: 350px; margin-left: 20px" ></div>

								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68f9c5345138515ff90a07af36fa931d&libraries=services"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};
								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption);
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch('마포구 신촌로176',function(result, status) {
													// 정상적으로 검색이 완료됐으면 
													if (status === kakao.maps.services.Status.OK) {
														var coords = new kakao.maps.LatLng(
																result[0].y, result[0].x);
														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker({
															map : map,
															position : coords
														});
														// 인포윈도우로 장소에 대한 설명을 표시합니다
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : '<div style="width:150px;text-align:center;padding:6px 0;">ee 미술관</div>'
																});
														infowindow.open(map, marker);
														// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
														map.setCenter(coords);
													}
												});
							</script>
					</dd>	
				</li>
				<li class="arc6">
					<dt>연락처</dt>
					<dd>
						<div class="small_wrap">
							<p class="plus">ee 뮤지엄에 대해 문의 사항이 있으시면 아래 연락처로  연락주십시오.</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">ee 미술관 대표 전화 </p>
							<p class="small_title_2">Tel : 02 - 1234 - 1234</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">입주 작가 신청 안내</p>
							<p class="small_title_2">Tel : 02 - 1234 - 1234</p>
						</div>
						<div class="small_wrap">
							<p class="small_title_1">큐레이션</p>
							<p class="small_title_2">Tel : 02 - 1234 - 1234</p>
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