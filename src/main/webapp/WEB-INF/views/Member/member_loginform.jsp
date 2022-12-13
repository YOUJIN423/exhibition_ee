<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ include file="../common/commonConfig.jsp"%>     
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_로그인폼</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Member/member_deco_loginform.css">


<!-- ********** 소셜로그인 ********** -->

<!-- 카카오 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
	crossorigin="anonymous">
</script>

<script>
Kakao.init('0bd8574fe41ad9e2b977ee43df4f41f5'); // 사용하려는 앱의 JavaScript 키 입력

function loginWithKakao() {
	Kakao.Auth.authorize({
		redirectUri: 'http://localhost/semi_project/kakao/oauth.do',
	});
}

 // 아래는 데모를 위한 UI 코드입니다.
displayToken()
function displayToken() {
	var token = getCookie('authorize-access-token');
	
	if(token) {
		Kakao.Auth.setAccessToken(token);
	    Kakao.Auth.getStatusInfo()
	    .then(function(res) {
	    	if (res.status === 'connected') {
	    		document.getElementById('token-result').innerText
	    			= 'login success, token: ' + Kakao.Auth.getAccessToken();
	    		}
	    	})
	    	.catch(function(err) {
	    		Kakao.Auth.setAccessToken(null);
	    		});
	    }
	}

function getCookie(name) {
	var parts = document.cookie.split(name + '=');
	if (parts.length === 2) { return parts[1].split(';')[0]; }
}
</script>

<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 구글 -->
<!-- 클라이언트 라이브러리 로드 -->
<script src="https://accounts.google.com/gsi/client" async defer></script>

<script>
	function check() {
		if($.trim($("#id").val())==""){
			alert("아이디를 입력해주세요.");
			$("#id").val("").focus();
			return false;
		}
		if($.trim($("#passwd").val())==""){
			alert("비밀번호를 입력해주세요.");
			$("#passwd").val("").focus();
			return false;	
	}
}		
/*[비번 찾기창]*/
	function passwd_find(){
		window.open("member_pwd_find.do","비밀번호 찾기","width=500, height=500");
		}		
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
		<div class=member_loginform_wrap">
			<h1 class="loginform_title"><strong>로그인</strong></h1>
				<form method="post" action="member_login_ok.do"
					onsubmit="return check()">
						<li class="id_insert_part">
							<h5 class="id_title"><strong>아이디</strong></h5>
							<td><input type="text" name="id" id="id" size="20" class="input_box"
								required="required" style="border: none; background: transparent;" /></td>
						</li>
	
						<li class="id_passwd_part">
							<h5 class="passwd_title"><strong>비밀번호</strong></h5>
							<td><input type="password" name="passwd" id="passwd"
								size="20" class="input_box" required="required" style="border:0 solid black" /></td>
						</li>
						<div class="login_btn_menu">
								<input type="reset" value="취소" class="input_button" name="cancel_btn" onclick="$('#id').focus();" /> 
								<input type="text" value="회원가입" class="input_button" name="join_btn" onclick="location='member_join_agreeform.do'" />
								<input type="text" value="비밀번호 찾기" class="input_button" name="passwd_btn" onclick="passwd_find()" />
						</div>							
												
						<div class="social_icon_part">
								<div class="d-flex justify-content-center">
								<!-- 카카오 -->
								<div class="login_kakao m-2">
									<a onclick="javascript:loginWithKakao()" id="kakao-login-btn">
										<img alt="kakao" src="<%=request.getContextPath() %>/images/kakao.png" width="40px" height="40px">
									</a>
									<p id="token-result" style="display: none"></p>
								</div>
								
								<!-- 네이버 -->
								<%
									String clientId = "U36AmKq1EApAPBeDJePi";
								    String redirectURI = URLEncoder.encode("http://localhost/semi_project/naver/oauth.do", "UTF-8");
								    SecureRandom random = new SecureRandom();
								    String state = new BigInteger(130, random).toString();
								    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
										+ "&client_id=" + clientId
								        + "&redirect_uri=" + redirectURI
								        + "&state=" + state;
									session.setAttribute("state", state);
								%>
								
								<div class="login_naver m-2">
									<a href="<%=apiURL%>">
										<img class="naver_logo" alt="naver" src="<%=request.getContextPath() %>/images/pinto_naver.png" width="40px" height="40px">
									</a>
								</div>
								
								<!-- 구글 -->
								<div class="login_google m-2">
									<!-- 데이터 -->
									<div id="g_id_onload"
										data-client_id="888285871286-mtq9unv3oo6v718628avjd7evkr2iopo.apps.googleusercontent.com"
										data-context="use"
										data-ux_mode="popup"
										data-callback="handleCredentialResponse"
										data-auto_prompt="false">
									</div>
									
									<!-- 시각적 -->
									<div class="g_id_signin"
										data-type="icon"
										data-theme="outline"
										data-size="large"
										data-shape="circle" >
									</div>
								</div>
								
								<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
								<script>
								function decodeJwtResponse(token) {
									var base64Url = token.split('.')[1];
									var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
									var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
										
										return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
									}).join(''));
										
									return JSON.parse(jsonPayload);
								};
										
								function handleCredentialResponse(response) {
									const responsePayload = decodeJwtResponse(response.credential);
									console.log(responsePayload);
									console.log("ID: " + responsePayload.sub);
									console.log('Full Name: ' + responsePayload.name);
									console.log('Given Name: ' + responsePayload.given_name);
									console.log('Family Name: ' + responsePayload.family_name);
									console.log("Image URL: " + responsePayload.picture);
									console.log("Email: " + responsePayload.email);
										   
									var id = responsePayload.sub;
									var email = responsePayload.email;
										   
									location.href="google/oauth.do?email="+email+"&id="+id;
								}
								</script>
							</div>												
						</div>
	
					<li class="login_btn_btn">
						<input type="submit" value="로그인  →" class="input_login_button" name="login_btn" /> 
					</li>	
				</form>
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