<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_개인정보처리방침</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Main/ee_common_deco.css">
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
		<div>
			<div style="margin-top:20px; margin-bottom: 50px">
				<h3><strong>개인정보처리방침</strong></h3>
			</div>
			<br>
				<p>
					리움미술관은 고객님의 개인정보를 중요시하며 「개인정보 보호법」 및 관계 법령이 정한 바를 준수하기 위하여 노력하고 있습니다. 
					리움미술관은 고객님의 개인정보 처리에 관한 기준을 안내하고, 
					이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 
					「개인정보처리방침」을 수립하여 준수하고 있으며
				</p>
				<p style="margin:0px 0px 70px 20px;">
					리움미술관 홈페이지(www.leeum.org)에 공개하여 고객님께서 언제나 쉽게 열람하고 확인할 수 있도록 하고 있습니다. 
					리움미술관의 「개인정보처리방침」은 관련 법령 및 내부 운영 방침의 변경에 따라 개정될 수 있으며,
					「개인정보처리방침」이 변경되는 경우에는 변경된 사항을 홈페이지에 공지합니다.
				</p>
				<br>
				<h4><strong>1.개인정보의 처리목적</strong></h4>
				<div style="margin:50px 0px 0px 20px">
					<p>미술관은 다음의 목적을 위하여 개인정보를 처리합니다. 
					처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 
					「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</p>
					<br>
					<p>1) 홈페이지 회원 가입 및 관리</p>
					<div style="margin-left: 20px">
						<p>회원 가입의사 확인, 
						멤버십 서비스 제공에 따른 본인 식별·인증, 
						회원자격 유지·관리, 
						서비스 부정 이용 방지, 
						만 14세 미만 아동의 개인정보 처리 시 법정대리인의 동의 여부 확인, 
						각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다.</p>
					</div>
					<p>2) 멤버십 회원 가입 및 서비스 제공</p>
					<div style="margin-left: 20px;">
						<p>리움/호암미술관 입장, 멤버십 카드 발급 및 발송, 멤버십 전용 프로그램 참여, 
						문화 예술 관련 온라인 뉴스레터 제공 목적으로 개인정보를 처리합니다.</p>
					</div>
					<p>3) 전시 관람 및 예약</p>
					<div style="margin-left: 20px">
						<p>미술관 전시 관람 예약 등록, 발권 목적으로 개인정보를 처리합니다.</p>
					</div>
					<p>4) 이메일 문의</p>
					<div style="margin:0px 0px 70px 20px;">
						<p>리움/호암미술관 홈페이지를 통한 문의나 민원에 대한 응대 목적으로 개인정보를 처리합니다.</p>
					</div>
				</div>
				<h4><strong>2. 처리하는 개인정보 항목 및 보유기간</strong></h4>
				<div style="margin:50px 0px 0px 20px">
					<p>미술관은 법령에 따른 개인정보 보유·이용기간 또는 고객님으로부터 개인정보를 수집 시에 
					동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
					각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>
					<br>
					<p>1) 회원</p>
					<div style="margin-left: 20px">
						<p>- 수집목적 : 홈페이지 회원 가입 및 관리</p>
						<p>- 수집항목 : [필수] 성명, 성별, 생년월일, 휴대전화번호, 아이디, 주소, 이메일, 법정대리인 정보(14세 미만), 접속로그, 쿠키, 접속IP</p>
						<p>- 보유기간 : 회원 탈퇴 시 까지 (홈페이지 1년이상 미이용 시 개인정보 파기)</p>
						
						<br>
						<p>- 수집목적 : 멤버십 회원 가입 및 서비스 제공</p>
						<p>- 수집항목 : [필수] 성명, 성별, 생년월일, 휴대전화번호, 이메일, 주소, 전화번호, 결제기록(결제시), 접속로그, 쿠키, 접속IP</p>
						<p>- 보유기간 : 멤버십 회원 종료시 까지</p>
						
						<br>
						<p>- 수집목적 : 프로그램 참가 접수 및 확인</p>
						<p>- 수집항목 : [필수] 이름, 연락처, 이메일, 접속IP</p>
						<p>- 보유기간 : 프로그램 종료일 이후 1개월까지 (단, 프로그램명/접수일은 회원탈퇴 시 까지)</p>
						
						<br>
						<p>- 수집목적 : 미술관 관람 예약·예매</p>
						<p>- 수집항목 : [필수] 성명, 휴대폰, 이메일, 생년월일, 성별, 비밀번호, 접속로그, 쿠키, 접속IP</p>
						<p>- 보유기간 : 관람 또는 취소 후 7일까지</p>
					</div>
					<p>2) 비회원</p>
					<div style="margin-left: 20px">
						<p>- 수집목적 : 프로그램 참가 접수 및 확인</p>
						<p>- 수집항목 : [필수] 이름, 연락처, 이메일, 접속IP</p>
						<p>- 보유기간 : 프로그램 종료일 이후 1개월까지</p>
						<br>
						<p>- 수집목적 : 미술관 관람 예약·예매</p>
						<p>- 수집항목 : [필수] 성명, 휴대폰, 이메일, 생년월일, 성별, 비밀번호, 접속로그, 쿠키, 접속</p>
						<p>- 보유기간 : 관람 또는 취소 후 7일까지</p>
					</div>
					<p>3) 이메일문의</p>
					<div style="margin-left: 20px">
						<p>- 수집목적 : 이메일 문의 접수</p>
						<p>- 수집항목 : [필수] 성명, 이메일, 휴대폰번호, 접속로그, 쿠키, 접속IP</p>
						<p>- 보유기간 : 3개월</p>
					</div>
				</div>
			<div>
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
				</a><br> <a href="<%=request.getContextPath()%>/program.do" class="private">개인정보 처리 방침</a><br>
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