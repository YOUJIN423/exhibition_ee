<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_mastermode_index</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/master/master_deco_index.css">

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
		<div class="master_welcome">
	        <h1>관리자 페이지 입니다.</h1>
	        <h3>관리자님 환영합니다.</h3>    	
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