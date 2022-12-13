<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_notice_FAQ</title>


<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/master/master_deco_common.css">
	
</head>

<body>
	<header>
		<div class="logo">
			<a href="main_index.do"> <img
				src="./images/EELOGO_TEXTONLY_BK.png" width=800 height=160>
			</a>
		</div>

		<div class="account">
			<%--[세션 O]--%>
			<c:if test="${!empty sessionScope.id}">
				<a href="member_logout.do" class="icon1"> <strong>LOGOUT</strong>
				</a>
				<a href="#" class="icon1"> <img src="./images/picto_ticket.png"
					width=40 height=40>
				</a>
			</c:if>
			<%--[세션 X]--%>
			<c:if test="${empty sessionScope.id}">
				<a href="member_loginform.do" class="icon3"> <strong>LOGIN</strong>
				</a>
				<a href="member_join_agreeform.do" class="icon4"> <strong>JOIN</strong>
				</a>
				<a href="member_loginform.do" class="icon5"> <img
					src="./images/picto_ticket.png" width=40 height=40>
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
		<div class="content">
			<h3 style="width: 100%; margin: 0 auto; margin:30px 0px 50px 130px;"><strong>FAQ</strong></h3>
				<div class="accordion accordion-flush" id="accordionFlushExample" style="width: 80%; margin: 0 auto;">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								1. 관람시간은 어떻게 되나요?</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample" style="">
							<div class="accordion-body">"화요일~일요일 오전 10시부터 오후 6시까지 입니다."
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
								aria-expanded="false" aria-controls="flush-collapseTwo">
								2. 예약을 해야 하나요?</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="flush-headingTwo"
							data-bs-parent="#accordionFlushExample" style="">
							<div class="accordion-body">
								"사전예약제로 운영합니다."<br> "관람일 14일 전부터 예약이 가능하며. 예약 가능인원은 최대
								5명입니다."
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingThree">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
								aria-expanded="false" aria-controls="flush-collapseThree">
								3.휴관일은 언제 입니까?</button>
						</h2>
						<div id="flush-collapseThree" class="accordion-collapse collapse"
							aria-labelledby="flush-headingThree"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								"사전예약제로 운영합니다."<br> "매주 월요일, 매년 설날(음력) 및 추석 당일은 휴관입니다."<br>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingfour">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapsefour"
								aria-expanded="false" aria-controls="flush-collapsefour">
								4.단체 예약 문의는 어떻게 하나요?</button>
						</h2>
						<div id="flush-collapsefour" class="accordion-collapse collapse"
							aria-labelledby="flush-headingfour"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">"전화 상담 및 이메일 문의 하시면 예약 도와
								드리겠습니다."</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingfive">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapsefive"
								aria-expanded="false" aria-controls="flush-collapsefive">
								5.전시 설명회가 있나요?</button>
						</h2>
						<div id="flush-collapsefive" class="accordion-collapse collapse"
							aria-labelledby="flush-headingfive"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								" M1 고미술 전시실에 한하여 아래의 기간 동안 임시 운영 합니다."<br>"기간 : 2월 8일(화) ~
								4월 10일(일)"<br> "시간:(오전)10:30~11:30 / (오후) 3:00 ~4:00"<br>
								"대상: 전시 관람객 중 , 선착순 6명"
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingsix">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapsesix"
								aria-expanded="false" aria-controls="flush-collapsesix">
								6.전시장내 소지품 반입이 가능하나요?</button>
						</h2>
						<div id="flush-collapsesix" class="accordion-collapse collapse"
							aria-labelledby="flush-headingsix"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								" 배낭 크기 이상의 소지품은 전시장 내에 반입이 불가합니다.<br> 물품보관함 이용을 부탁 드립니다."
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingseven">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseseven"
								aria-expanded="false" aria-controls="flush-collapseseven">
								7.디지털 가이드를 이용할 수 있나요?</button>
						</h2>
						<div id="flush-collapseseven" class="accordion-collapse collapse"
							aria-labelledby="flush-headingseven"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								" 네 가능합니다. 디지털 가이드는 전시 작품 앞에 다가가면 자동으로 작품해설을 제공해주는 단말기로 무료로 대여하실
								수 있습니다.<br> 초등학생 이상 대여가 가능하며, 여권, 주민등록증 등 신분증을 맡기셔야 합니다."
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingeight">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseeight"
								aria-expanded="false" aria-controls="flush-collapseeight">
								8.유모차와 휠체어를 대여할 수 있나요?</button>
						</h2>
						<div id="flush-collapseeight" class="accordion-collapse collapse"
							aria-labelledby="flush-headingeight"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">" 영아를 동반한 관람객이나 장애인 관람객의 편안한 관람을
								돕기 위하여 1층 안내 데스크에서 유모차와 휠체어를 대여해 드리고 있습니다. "</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingnine">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapsenine"
								aria-expanded="false" aria-controls="flush-collapsenine">
								9.주차가 가능 합니까?</button>
						</h2>
						<div id="flush-collapsenine" class="accordion-collapse collapse"
							aria-labelledby="flush-headingnine"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								"주차공간이 협소하여 만차 되는 경우가 있을 수 있으므로,<br> 되도록 대중교통수단을 이용해 주시기
								바랍니다.<br> 6시까지만 주차 가능하며 미술관 관람 이외의 주차장 사용은 할 수 없습니다."<br>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingten">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseten"
								aria-expanded="false" aria-controls="flush-collapseten">
								10.대중교통으로 갈 수 있는 방법은 어떻게 되나요?</button>
						</h2>
						<div id="flush-collapseten" class="accordion-collapse collapse"
							aria-labelledby="flush-headingten"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								"지하철6호선 한강진역 1번 출구로 나와서, <br> 이태원방향으로 걷다가 오른쪽 첫번째 골목에서 우회전하여
								언덕길로 5분 정도 걸어 오시면 찾으실 수 있습니다. <br> 버스 110A, 110B, 400, 405번
								(한남동 새마을금고 정류장)이나 6호선 한강진 역에서 하차 (지하철역 1번 출구 기준으로 오는 방향 동일)."<br>
							</div>
						</div>
					</div>
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