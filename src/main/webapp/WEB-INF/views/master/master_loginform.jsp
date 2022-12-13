<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_master_mode_로그인폼</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/master/master_deco_loginform.css
	">

<script>
	function check() {
		if($.trim($("#master_id").val())==""){
			alert("아이디를 입력해주세요.");
			$("#master_id").val("").focus();
			return false;
		}
		if($.trim($("#master_passwd").val())==""){
			alert("비밀번호를 입력해주세요.");
			$("#master_passwd").val("").focus();
			return false;	
	}
}			
</script>
</head>

<body>
	<header>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/master/master_index.do"> 
				<img src="<%=request.getContextPath()%>/images/EELOGO_TEXTONLY_BK.png" width=800 height=160>
			</a>
		</div>

		<div class="account">
			<!-- 세션O -->
			<c:if test="${!empty sessionScope.master_id}">
				<a href="<%=request.getContextPath()%>/master/master_logout.do" class="icon1"> 
					<strong>LOGOUT</strong>
				</a>
			</c:if>

			<!-- 세션X -->
			<c:if test="${empty sessionScope.master_id}">
				<a href="<%=request.getContextPath()%>/master/master_loginform.do" class="icon3"> 
					<strong>MASTER LOGIN</strong>
				</a>
			</c:if>	
			<nav role="navigation">
				<ul id="main-menu">
					<li>
						<a href="<%=request.getContextPath()%>/master/qnalist.do">
							<strong>고객 문의</strong>
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/master/exhibitionlist.do">
							<strong>전시 관리</strong>
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/master/master_notice.do"  aria-label="subemnu">
							<strong>공지 관리</strong>
						</a>
					</li>
					<li>
						<a href="#">
							<strong>회원 관리</strong>
						</a>
						<ul id="sub-menu">
							<li>
								<a href="<%=request.getContextPath()%>/master/memberlist.do" aria-label="subemnu">회원 정보</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/master/bookpage.do" aria-label="subemnu">회원 예약</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
	</header>

	<main>
		<div class=master_loginform_wrap">
			<h1 class="loginform_title"><strong>관리자 로그인</strong></h1>
				<form method="post" action="<%=request.getContextPath()%>/master/master_login.do"
					onsubmit="return check()">
						<li class="id_insert_part">
							<h5 class="id_title"><strong>아이디</strong></h5>
							<td><input type="text" name="master_id" id="master_id" size="20" class="input_box"
								required="required" style="border: none; background: transparent;" /></td>
						</li>
	
						<li class="id_passwd_part">
							<h5 class="passwd_title"><strong>비밀번호</strong></h5>
							<td><input type="password" name="master_passwd" id="master_passwd"
								size="20" class="input_box" required="required" style="border:0 solid black" /></td>
						</li>
						<div class="login_btn_menu">
								<input type="reset" value="취소" class="input_button" name="cancel_btn" onclick="$('#master_id').focus();" /> 
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