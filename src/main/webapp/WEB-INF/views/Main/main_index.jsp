<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_index</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Main/main_deco_index.css">

<script language="JavaScript">
	$(document).ready(
			function() {
				var $slider = $(".slider").find("ul");

				var $sliderWidth = $slider.children().outerWidth();//이미지의 폭
				var $sliderHeight = $slider.children().outerHeight(); // 높이
				var $length = $slider.children().length;//이미지의 갯수
				var rollingId;

				//정해진 초마다 함수 실행
				rollingId = setInterval(function() {
					rollingStart();
				}, 3000);//다음 이미지로 롤링 애니메이션 할 시간차

				function rollingStart() {
					$slider.css("width", $sliderWidth * $length + "px");
					$slider.css("height", $sliderHeight + "px");
					//alert(sliderHeight);
					//배너의 좌측 위치를 옮겨 준다.
					$slider.animate({
						left : -$sliderWidth + "px"
					}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
						//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
						$(this).append(
								"<li>" + $(this).find("li:first").html()
										+ "</li>");
						//뒤로 복사된 첫번쩨 이미지는 필요 없으니 삭제한다.
						$(this).find("li:first").remove();
						//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
						$(this).css("left", 0);
						//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
					});
				}
			});
</script>

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
		<div class="slider">
			<ul>
				<li>
					<a href="<%=request.getContextPath()%>/main_index.do"> 
						<img src="./images/EELOGO_SLIDER.jpeg" width=1180 height=500>
					</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/main_slider_program1.do"> 
						<img src="./images/main_program_1.jpg"  width=1180 height=500>
					</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/main_slider_program2.do"> 
						<img src="./images/main_program_2.jpg"  width=1180 height=500>
					</a>
				</li>								
			</ul>
		</div>
	</main>

	<div class="exhibition_gallery_ing">
		<h3>실시간 추천 전시 </h3><br>
			<div class="card-items">
				<c:forEach var="best" items="${exhibition_bestList}" > 
					<div class="card">
						<a href="<%=request.getContextPath() %>/exhibition_detail.do?ex_num=${best.ex_num}"> 
							<img src="<%=request.getContextPath() %>/upload/${best.ex_poster}" class="card-img-top" alt="..." width=350 height=400>		
						</a>	
							<div class="card-body">
								<p class="card-text1"><strong>${best.ex_name}</strong></p>
								<p class="card-text2"><fmt:formatDate value="${best.ex_start}" pattern="yyyy.MM.dd"/> - <fmt:formatDate value="${best.ex_end}" pattern="yyyy.MM.dd"/></p>
								<p class="card-text3">${best.ex_loc}</p>
							</div>					
						</div>	
				</c:forEach>		
			</div>
	</div>
	<div class="collection_list">
		<li>
			<h3>소장품</h3><br>
		</li>	
		<div class="c1">
			<dt>고미술 소장품</dt>
			<dd>
				<img src="./images/main_collection1.png" class="collection_img" width="880" height="270">
			</dd>
		</div>	
		<div class="c2">		
			<dt>현대미술 소장품</dt>
			<dd>
				<img src="./images/main_collection2.png" class="collection_img" width="880" height="270">
			</dd>
		</div>
	</div>

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