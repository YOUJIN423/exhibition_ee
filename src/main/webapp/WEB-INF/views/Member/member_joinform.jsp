<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_joinform</title>
 
<!--[우편 번호]-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('mem_post').value = data.zonecode;
			document.getElementById('mem_addr1').value = data.address;				
		}
	}).open();
}		
</script>

<script src="<%=request.getContextPath() %>/js/Member/member.js"></script>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Member/member_deco_joinform.css">	

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
		<div class="joinform_wrap">
			<div class="joinformTitle">
				<ul>
					<h3>ee미술관 웹 회원가입</h3>
				</ul>
			</div>
			<div>
				<form name="member_join_F" method="post" action="member_join_ok.do"
					onsubmit="return check()">
					<li class="arc">
						<dt>아이디</dt>
						<dd>
							<input type="text" class="id_area" name="mem_id" id="mem_id" size="14"  placeholder="아이디를 입력하세요."> 
							<input type="button" value="아이디 중복 체크" class="id_overlap_btn" onclick="id_check()">
							<div class="id_check_area" id="idcheck"></div>
							<%--div 영역에 나타남 --%>
						</dd>
					</li>
					<li class="arc">
						<dt>비밀번호</dt>
						<dd>
							<input type="password" name="mem_passwd" id="mem_passwd" size="12" placeholder="8-12자리 이내로 입력하세요." >
						</dd>
					</li>
					<li class="arc">
						<dt>비밀번호 확인</dt>
						<dd>
							<input type="password" name="mem_passwd2" id="mem_passwd2" size="12" placeholder="입력한 비밀번호를 재입력 해주세요." >
						</dd>
					</li>
					<li class="arc">
						<dt>회원 이름</dt>
						<dd>
							<input type="text" class="name_area" name="mem_name" id="mem_name" size="14" placeholder="이름을 입력하세요.">
						</dd>
					</li>
	
					<li class="arc">
						<dt>성별</dt>
						<dd>
							<input type="radio" name="mem_gender" id="male" value="남자">남자&nbsp;&nbsp;
							<input type="radio" name="mem_gender" id="female" value="여자">여자
						</dd>
					</li>
	
					<li class="arc">
						<dt>주민등록번호</dt>
						<dd>
							<input type=text class="jumin1_area" name="mem_jumin1" id="mem_jumin1" size="6"
								maxlength="6">   -   <input type=text class="jumin2_area"
								name="mem_jumin2" id="mem_jumin2" size="7" maxlength="7">
						</dd>
					</li>
	
					<li class="arc">
						<dt>이메일</dt>
						<dd>
							<input type="text" class="email_area" name="mem_email" id="mem_email" size="10" placeholder="이메일을 입력하세요." />   @   <input type="text"
								name="mem_domain" class="domain_area" id="mem_domain" size="20" placeholder="도메인을 선택하세요." readonly /> 
							<select	name="mail_select_list" id="mail_select_list">
								<option value="">-도메인 선택-</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="0">직접입력</option>
							</select>
						</dd>
					</li>
	
					<li class="arc">
						<dt>우편번호</dt>
						<dd>
							<input type="text" class="post_area" name="mem_post" id="mem_post" size="5"  readonly
								onclick="post_search()"> <input type="button"
								value="우편번호 검색" class="post_search_btn" onclick="openDaumPostcode()">
						</dd>
					</li>
	
					<li class="arc">
						<dt>주소</dt>
						<dd>
							<input type="text" class="addr1_area" name="mem_addr1" id="mem_addr1" size="50" readonly
								onclick="post_search()">
						</dd>
					</li>
	
					<li class="arc">
						<dt>상세 주소</dt>
						<dd>
							<input type="text" class="addr2_area" name="mem_addr2" id="mem_addr2" size="50" placeholder="상세 주소를 입력하세요.">
						</dd>
					</li>
	
					<li class="arc">
						<dt>핸드폰</dt>
						<dd>
							<%@ include file="./tel_number_selectlist.jsp"%>
							<select name="mem_tel1">
								<c:forEach var="t" items="${tel}" begin="0" end="5">
									<option value="${t}">${t}</option>
								</c:forEach>
							</select>   -   <input type="text" class="tel2_area" name="mem_tel2" id="mem_tel2" size="4" maxlength="4" />   -   <input type="text"
								class="tel3_area" name="mem_tel3" id="mem_tel3" maxlength="4" />
						</dd>
					</li>
	
					<div class="mem_joinform_menu">
						<input type="reset"	value="취소                        →"  class="cancel_btn "onclick="$('#mem_id').focus();">
						<input type="submit" value="회원가입                   →" class="input_join_btn"> 
					</div>
	
				</form>
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