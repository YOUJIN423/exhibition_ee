<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_약관동의</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Member/member_deco_join_agreeform.css">
	 
<!--[체크 박스) 모두 선택 시 자동 선택 + 1개만 선택 시 유효성 검사]-->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#agree_all").click(function() {
		if($("#agree_all").is(":checked")) $("input[name=agree]").prop("checked", true);
		else $("input[name=agree]").prop("checked", false);
	});
	
	$("input[name=agree]").click(function() {
		var total = $("input[name=agree]").length;
		var checked = $("input[name=agree]:checked").length;
		
		if(total != checked) $("#agree_all").prop("checked", false);
		else $("#agree_all").prop("checked", true); 
	});
	
	$("form").submit(function(){
	
	if($(".agree1").is(":checked") == false ||
	   $(".agree2").is(":checked") == false ){
		alert("이용 약관에 동의해주세요.");
		return false;
	}	
	
	}); // submit() end
	
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
		<form  method="post" action="member_joinform.do">
			<div class="joinagreePageTitle">
				<ul>
					<h3>ee미술관 웹 회원가입</h3>
					<hr>
				</ul>
			</div>
					<div class="jaedan">
						<div class="agree_dt1">
							<dt><strong>ee문화 재단</strong></dt>
						</div>
						<div class="agree_ex1">
							<dt>고객님의 회원 가입을 위하여 아래 약관을 숙지하신 후 동의 버튼을 클릭하시면 회원 가입을 하실 수
								있습니다.</dt>
						</div>
					</div>
						<div class="agree_dt2">
							<dt><strong>이용약관</strong></dt>
						</div>
						<div class="agree_ex2">
							<li>
								<pre tabindex="0">여러분을 환영합니다. <br>ee미술관 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. <br>본 약관은 다양한 ee미술관 서비스의 이용과 관련하여 ee미술관 서비스를 제공하는 ee미술관 주식회사(이하 ‘ee미술관’)와 이를 이용하는 ee미술관 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,아울러 여러분의 ee미술관 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.<br>ee미술관 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
								</pre>
							</li>
							<li class="agree_ex3"><label for="agree"> <input
									type="checkbox" name="agree" value="1" class="agree1" > 
									<span>이용약관에 동의합니다.</span>
							</label></li>
						</div>
						<div class="agree_dt3">
							<dt><strong>개인 정보 수집 이용에 대한 동의[필수]</strong></dt>
						</div>
						<div class="agree_ex4">
							<li>
								<pre tabindex="0">ee미술관 개인정보 처리방침
ee미술관은 개인정보 보호법 제30조 등 관련법령상의 개인정보 보호규정을 준수하며, 개인정보 처리방침은 아래와 같습니다.
제1조. 개인정보의 처리목적, 항목, 보유기간
A. ee미술관은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 목적이외 용도로는 사용되지 않으며 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행합니다.

B. 개인정보파일의 처리목적, 항목, 보유기간 등은 아래와 같습니다.2020. 06. 20. ~ 2021. 04. 19. (클릭 ee미술관 개인정보 처리방침)

2015. 11. 11. ~ 2020. 06. 19. (클릭 ee미술관 개인정보 처리방침)

2013. 11. 27. ~ 2015. 11. 10. (클릭 ee미술관 개인정보 처리방침)

2011. 11. 11. ~ 2013. 11. 26. (클릭 ee미술관 개인정보 처리방침)
								</pre>
							</li>
							<li class="agree_ex5">
								<label for="agree"> 
									<input type="checkbox" name="agree" value="2" class="agree2"> 
									<span>개인 정보 수집, 이용에 동의 합니다.</span>
								</label>
						  </li>
					</div>
							<li class="agree_ex6">
								<label for="agree_all"> 
									<input type="checkbox" name="agree_all" id="agree_all"> 
										<span>모두 동의합니다.</span>
								</label>
							</li>
							<li class="agree_ex7">
								<input type="submit" class="btn_agree" value="회원가입 페이지로 이동          →" />
							</li>
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