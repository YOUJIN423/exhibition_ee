<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div style="margin-top:20px; margin-bottom: 15px">
				<h1 style="margin:30px 0px 50px 0px;"><strong>현재 프로그램</strong></h1>
			</div>
			<br>
			
			<div>
				<div style="margin-bottom: 20px">
					<h4 style="margin-bottom: 50px;"><strong>키즈랩 [북ㆍ키ㆍ움 - 경계를 넘어] 프로그램 안내</strong></h4>
				</div>
				<img src="<%=request.getContextPath()%>/images/main_program_1.jpg"  width="650" height="300" style="margin-bottom: 50px"><br>
				<p> "북ㆍ키ㆍ움"(Book Kids Museum)은 그림책을 통해 창의력을 키우는 미술관 프로그램입니다. </p>
				<br>
				<br>
				<b>프로그램 안내</b>
				<p>11월과 12월 프로그램 주제는 "경계를 넘어" 입니다. 예술가들은 경계 밖의 상상과 시도로 창의적인 작품을 만들어 냅니다. 장르의 경계를 넘어, 하나의 시선을 넘는 세계를 창조합니다. 이번 프로그램에서는 그림책을 통해 다양한 예술적 시도를 살펴보고 미술, 연극, 음악, 움직임으로 창의적인 표현을 해봅니다. </p>
				<br>
				<p>■ 대상: 초등학교 3~4학년, 각 12명</p>
				<p>■ 장소: 삼성아동교육문화센터 1층 키즈랩</p>
				<p>■ 일정 및 프로그램 구성: 매주 토요일 10:30-12:00, 14:00-15:30</p>
				<br>
				<table>
					<tr>
						<td>일정</td>
						<td>프로그램</td>
						<td>신청</td>
					</tr>
					<tr>
						<td>11월 5일, 12일</td>
						<td>경계를 넘나드는 선</td>
						<td>신청 페이지 가기</td>
					</tr>
					<tr>
						<td>11월 19일, 26일</td>
						<td>다른시선</td>
						<td>신청 페이지 가기</td>
					</tr>
					<tr>
						<td>12월 3일, 10일</td>
						<td>숨은 공간 찾기</td>
						<td>신청 페이지 가기</td>
					</tr>
				</table>
				<p>* 다른 주제의 프로그램은 복수 신청이 가능합니다. 같은 주제의 프로그램을 복수 신청 시 둘 중 뒤의 일정은 자동 취소됩니다. </p>
				<p>■ 접수: 10월 21일(금) 14:00 부터 홈페이지 선착순 접수</p>
				<p>■ 참가비: 무료</p>
				<p>■ 문의: 02-2014-6900</p>
				<p>■ 협력: 커넥티드 에이</p>
				<br>
				<p>▣ 상세 프로그램 소개</p>
				<p><경계를 넘나드는 선>&nbsp;#미술 #음악 #선&nbsp;<u>신청 페이지 가기</u></p>
				<img style="HEIGHT: 198px; WIDTH: 159px" src="<%=request.getContextPath()%>/images/program2/program2_2.jpg" width="377" height="491">
				<img style="HEIGHT: 199px; WIDTH: 166px" src="<%=request.getContextPath()%>/images/program2/program2_3.jpg" width="378" height="533">
				<p>『선』(이수지 글/그림)과 『누가 사자의 방에 들어왔지?』
				(아드리애애 파블랑주 글/그림)는 선의 변화무쌍한 모습을 발견할 수 있는 그림책입니다. 
				이 프로그램에서는 시각예술, 이야기, 음악(리듬)으로 신나게 선(Line)을 탐험해봅니다. 
				전시장을 직접 거닐며 공간과 공간을 잇는 동선의 의미를 발견하고 전시작품을 감상하는 시간도 갖습니다. 
				또한 자신만의 감각으로 드로잉을 하면서 리듬과 소리로 선을 새롭게 감각해봅니다. </p>
				<br>
				<p><다른 시선>&nbsp;#연극 #삶의여정 #시선&nbsp;<u>신청 페이지 가기</u></p>
				<img style="HEIGHT: 195px; WIDTH: 160px" src="<%=request.getContextPath()%>/images/program2/program2_4.jpg" width="519" height="730">
				<p>일러스트북 『A TRAVERS(~통해)』(톰 오고마 그림)는 알래스카에서 태어난 한 아이의 탄생부터 삶의 마지막(1956년~2026년)까지를 한 사람의 시선으로 소개됩니다. 
				우리는 어떤 시선으로 '나'의 삶을 살아갈까요? 
				이 프로그램에서는 그림책 속 주인공이 포착한 삶의 시선들을 통해 '나'의 삶도 상상해봅니다. '우주비행사'라는 꿈을 이룬 주인공의 삶을 살아봄으로써 타인의 삶을 이해하고, 
				나아가 내 삶의 여정까지 연결하여 연극, 그림, 신체 움직임으로 표현해봅니다. </p>
				<br>
				<p><숨은 공간 찾기>&nbsp;#미술 #무용 #상상의색 #숨은공간 &nbsp;<u>신청 페이지 가기</u> </p>
				<img style="HEIGHT: 198px; WIDTH: 159px" src="<%=request.getContextPath()%>/images/program2/program2_5.jpg" width="377" height="491">
				<img style="HEIGHT: 199px; WIDTH: 166px" src="<%=request.getContextPath()%>/images/program2/program2_6.jpg" width="378" height="533">
				<p>일러스트북『ET PUIS(이퓌)』, 
				『서울』(이치노리 그림)은 스페인계 일본인 마유미 오데로와 독일계 프랑스인 라파엘 위르빌레 듀오가 작업하여 4개국을 넘나드는 시선이 고루 담겨 있습니다. 
				이를 바탕으로 책에는 인간이 정해놓은 규칙 외 '개인의 색'과 '소외된 공간'에 대한 이야기를 나눕니다. 
				이 프로그램은 세상 속 나의 색을 찾으며 '존재하지 않는 공간'을 상상해보는 시간입니다. 
				우리의 상상을 더해 빨주노초파남보 사이에 존재하는 회색에 대한 이야기를 덧붙여 봅니다. 
				경계 넘어 존재하는 것을 들여다보며 '움직임'을 빌어 즉흥적인 미술 표현으로 확정해 보는 경험을 해봅니다.  </p>
				<br>
				<p>■ 유의 사항</p>
				<p>  - 프로그램은 1회로 구성되었고, 사전 신청자만 참여할 수 있습니다. </p>		
				<p>  - 프로그램의 세부 내용은 변동될 수 있습니다. </p>		
				<p>  - 프로그램 진행시 부모님과 함께하지 않는 프로그램입니다. </p>		
				<p>  - 프로그램 도중 촬영이 진행될 예정입니다. 촬영된 사진과 영상은 프로그램 홍보 등에 활용될 수 있습니다. </p>		
				<p>  - 참여 학생에게 활동하기 편한 옷을 입혀주세요.</p>		
				<p>  - 주차장이 협소하오니 대중교통을 이용하여 주시기 바랍니다. </p>		
				<br>
				<p>▣ 키즈랩 그림책 공간 안내 </p>
				<img style="HEIGHT: 165px; WIDTH: 387px" src="<%=request.getContextPath()%>/images/program2/program2_7.jpg" width="420" height="195">
				<p>키즈랩은 삼성생명공익재단과 리움미술관의 협업으로 탄생한 그림책 공간입니다. 
				그림책을 통해 미적 호기심과 상상력을 자극하는 키즈랩은 그림책 전문 큐레이터가 직접 구성한 500여 권의 책들로 구성되었습니다. 
				예술가를 주제로 제작된 그림책, 그림이 돋보이는 아트북, 신기한 모양의 입체북, 
				리움 전시와 관련된 그림책 등 평소에 쉽게 접할 수 없는 그림책들을 키즈랩에서 만나보세요. </p>
				<br>
				<p>- 장소: 삼성아동교육문화센터 1층 </p>
				<p>- 운영 일정: 2022년 9월 2일(금) ~ 2023년 1월 8일(일) </p>
				<p>                  (오전: 10:00-12:00, 오후 14:00-17:00)</p>
				<p>                  *프로그램 진행되는 토요일 이용 불가</p>
				<p>- 대상: 초등학생 이상(보호자 동반 필수)</p>
				<p>- 협력: 비플랫폼</p>
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