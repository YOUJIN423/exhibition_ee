<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_updateform</title>
 
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

<script>
	$(document).ready(function(){
		$("#mem_passwd").keypress(function(){
			$("#mem_passwd2").val('');
		});
		
		if(${result==1}) {
			alert("정보수정 성공!");
		}
	});
	

	function domain_list() {
		var num = member_join_F.mail_select_list.selectedIndex;
		if (num == -1) {
			return true;
		}
		if (member_join_F.mail_select_list.value == "0") // 직접입력
		{
			member_join_F.mem_domain.value = "";
			member_join_F.mem_domain.readOnly = false;
			member_join_F.mem_domain.focus();
		}

		else {
			member_join_F.mem_domain.value = member_join_F.mail_select_list.value;
			member_join_F.mem_domain.readOnly = true;
		}
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
					<h3><b>회원정보수정</b></h3>
				</ul>
			</div>
			<div>
				<form name="member_join_F" method="post" action="<%=request.getContextPath()%>/mypage/updateMember.do"
					onsubmit="return check()">
					<li class="arc">
						<dt>아이디</dt>
						<dd>
							<input type="text" class="id_area" name="mem_id" id="mem_id" size="14"  value="${member.mem_id}" readonly> 
						</dd>
					</li>
					<li class="arc">
						<dt>비밀번호</dt>
						<dd>
							<input type="password" name="mem_passwd" id="mem_passwd" size="12" 
							value="${member.mem_passwd}">
						</dd>
					</li>
					<li class="arc">
						<dt>비밀번호 확인</dt>
						<dd>
							<input type="password" name="mem_passwd2" id="mem_passwd2" size="12"
							value="${member.mem_passwd}">
						</dd>
					</li>
					<li class="arc">
						<dt>회원 이름</dt>
						<dd>
							<input type="text" class="name_area" name="mem_name" 
							id="mem_name" size="14" placeholder="이름을 입력하세요."
							value="${member.mem_passwd}"
							>
						</dd>
					</li>
	
					<li class="arc">
						<dt>성별</dt>
						<dd>
							<c:if test="${member.mem_gender == '남자' }">
								<input type=radio id="male" name="mem_gender" value="남자" checked="checked">남자
								<input type=radio id="female" name="mem_gender" value="여자">여자
							</c:if>
							<c:if test="${member.mem_gender == '여자' }">
								<input type=radio id="male" name="mem_gender" value="남자">남자
								<input type=radio id="female" name="mem_gender" value="여자" checked="checked">여자
							</c:if>
						</dd>
					</li>
	
					<li class="arc">
						<dt>주민등록번호</dt>
						<dd>
							<input type=text class="jumin1_area" name="mem_jumin1" id="mem_jumin1" size="6"
								maxlength="6" value="${member.mem_jumin1}">   -   <input type=text class="jumin2_area"
								name="mem_jumin2" id="mem_jumin2" size="7" maxlength="7" value="${member.mem_jumin2}">
						</dd>
					</li>
	
					<li class="arc">
						<dt>이메일</dt>
						<dd>
							<input type="text" class="email_area" name="mem_email" id="mem_email" size="10" value="${member.mem_email}"/>   @   <input type="text"
								name="mem_domain" class="domain_area" value="${member.mem_domain}"
								size="20" placeholder="도메인을 선택하세요." id="mem_domain" readonly/> 
							<select name="mail_select_list" id="mail_select_list" onchange="domain_list()">
								<option value="">=이메일선택=</option>
								<option value="daum.net"
									<c:if test="${member.mem_domain == 'daum.net'}">${'selected'}
									            </c:if>>daum.net</option>
								<option value="nate.com"
									<c:if test="${member.mem_domain == 'nate.com'}">${'selected'}
									            </c:if>>nate.com</option>
								<option value="naver.com"
									<c:if test="${member.mem_domain == 'naver.com'}">${'selected'}
									            </c:if>>naver.com</option>
								<option value="hotmail.com"
									<c:if test="${member.mem_domain == 'hotmail.com'}">${'selected'}
									            </c:if>>hotmail.com</option>
								<option value="gmail.com"
									<c:if test="${member.mem_domain == 'gmail.com'}">${'selected'}
									            </c:if>>gmail.com</option>
								<option value="0">직접입력</option>
							</select>
						</dd>
					</li>
	
					<li class="arc">
						<dt>우편번호</dt>
						<dd>
							<input type="text" class="post_area" name="mem_post" id="mem_post" size="5"  readonly
								onclick="post_search()" value="${member.mem_post}"> <input type="button"
								value="우편번호 검색" class="post_search_btn" onclick="openDaumPostcode()">
						</dd>
					</li>
	
					<li class="arc">
						<dt>주소</dt>
						<dd>
							<input type="text" class="addr1_area" name="mem_addr1" id="mem_addr1" size="50" readonly
								onclick="post_search()" value="${member.mem_addr1}">
						</dd>
					</li>
	
					<li class="arc">
						<dt>상세 주소</dt>
						<dd>
							<input type="text" class="addr2_area" name="mem_addr2" id="mem_addr2" 
							size="50" value="${member.mem_addr2}">
						</dd>
					</li>
	
					<li class="arc">
						<dt>핸드폰</dt>
						<dd>
							<%@ include file="../Member/tel_number_selectlist.jsp"%>
							<select name="mem_tel1">
								<c:forEach var="t" items="${tel}" begin="0" end="5">
										<option value="${t}" <c:if test="${member.mem_tel1 == t}">${'selected'}
								          </c:if>>${t}
								        </option>
								</c:forEach>
							</select>   -   <input type="text" class="tel2_area" name="mem_tel2" id="mem_tel2" 
							size="4" maxlength="4" value="${member.mem_tel2}"/>   -   <input type="text"
								class="tel3_area" name="mem_tel3" id="mem_tel3" maxlength="4" value="${member.mem_tel3}"/>
						</dd>
					</li>
					<div>
						<h5 class="text-end"><a href="<%=request.getContextPath()%>/mypage/exitForm.do"><b>회원탈퇴하기</b></a></h5>
					</div>
					<div class="mem_joinform_menu">
						<input type="reset"	value="취소                        →"  class="cancel_btn "onclick="$('#mem_id').focus();">
						<input type="submit" value="정보수정                   →" class="input_join_btn" id="submit_btn"> 
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