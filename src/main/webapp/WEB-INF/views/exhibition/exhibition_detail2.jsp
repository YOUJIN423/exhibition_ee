<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: ee Museum of Art ::</title>

<%--[외부 파일] --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common_nosidebar.css">

<script>
$(document).ready(function(){
	/* 좋아요 버튼 + 인터셉터 */
	var mylike = ${mylike};
//	0 : 좋아요 안누른 상태
	//		1 : 좋아요 누른 상태
	//		2 : 기본 상태 (비로그인)
	//		3 : 좋아요 정보가 없는 상태 -> mem_id, ex_num 넣어서 좋아요 데이터 생성
	
	/* 좋아요 버튼 + 인터셉터 추가하기 */
	var mylike = ${mylike};
	//		0 : 좋아요 안누른 상태
	//		1 : 좋아요 누른 상태
	//		2 : 기본 상태 (비로그인)
	//		3 : 좋아요 정보가 없는 상태 -> mem_id, ex_num 넣어서 좋아요 데이터 생성

	$("#like_btn").click(function(){	// 좋아요 클릭
		location.href = "mylikeUpdate.do?ex_num=${exhibition.ex_num}&mem_id=${mem_id}&mylike_num=${mylike}";
	});
	
	if(mylike==0) { 		// 로그인 상태, 좋아요 안누른 상태 (빈하트)
		$("#like_btn").html('<i class="far fa-heart"></i>');
	
	} else if (mylike==1) { // 로그인 상태, 좋아요 누른 상태 (하트)
		$("#like_btn").html('<i class="fas fa-heart" style="color:red"></i>');
	
	} else if (mylike==2) { // 비로그인 상태 (빈하트)
		$("#like_btn").html('<i class="far fa-heart"></i>');
	}
	
	/* 예매 버튼 + 인터셉터 추가하기 */
	if(${exhibition.ex_end_state == 'y'}) {
		$("#book_btn").html('예매하기');
		$("#book_btn").click(function(){
			location.href = "<%=request.getContextPath()%>/book/bookForm.do?ex_num=${exhibition.ex_num}"; // 예매창으로 이동
		});
		
	} else {
		$("#book_btn").html('<i>예매가 불가능합니다.</i>');
	}
	
	/* 리뷰 리스트 */
		$("#review").load('<%=request.getContextPath()%>/reviewList.do?ex_num=${exhibition.ex_num}&rev_page=${rev_page}');
});
</script>
</head>
<body>
	<header>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/main_index.do"> <img
				src="<%=request.getContextPath()%>/images/EELOGO_TEXTONLY_BK.png"
				width=800 height=160>
			</a>
		</div>

		<div class="account">
			<!-- 세션O -->
			<c:if test="${!empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_logout.do"
					class="icon1"> <strong>LOGOUT</strong></a>
				<a href="<%=request.getContextPath()%>/mypage/mypage.do" class="icon1"> <img
					src="<%=request.getContextPath()%>/images/picto_ticket.png"
					width=40 height=40>
				</a>
			</c:if>

			<!-- 세션X -->
			<c:if test="${empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_loginform.do"
					class="icon3"> <strong>LOGIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_join_agreeform.do"
					class="icon4"> <strong>JOIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_loginform.do"
					class="icon5"> <img
					src="<%=request.getContextPath()%>/images/picto_ticket.png"
					width=40 height=40>
				</a>
			</c:if>

			<nav role="navigation">
				<ul id="main-menu">
					<li><a
						href="<%=request.getContextPath()%>/main_about_introduce.do"><strong>ABOUT</strong></a></li>
					<li><a href="#"><strong>EXHIBITION</strong></a>
						<ul id="sub-menu">
							<li><a
								href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=y"
								aria-label="subemnu"> 진행 중인 전시</a></li>
							<li><a
								href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=n"
								aria-label="subemnu"> 종료 전시</a></li>
						</ul></li>

					<li><a href="#"><strong>NOTICE</strong></a>
						<ul id="sub-menu">
							<li><a href="<%=request.getContextPath()%>/main_notice.do"
								aria-label="subemnu">공지 사항</a></li>
							<li><a
								href="<%=request.getContextPath()%>/main_notice_faq.do"
								aria-label="subemnu">FAQ</a></li>
						</ul></li>

					<li><a href="#"><strong>INFORMATION</strong></a>
						<ul id="sub-menu">
							<li><a
								href="<%=request.getContextPath()%>/main_info_watching.do"
								aria-label="subemnu">관람 안내</a></li>
							<li><a
								href="<%=request.getContextPath()%>/main_info_booking.do"
								aria-label="subemnu">예매 안내</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>

	<main>
		<div class="contrainer-fluid">
			<div class="row mt-5">
				<!-- 뒤로가기 버튼 -->
				<div class="mt-2">
					<a href="exhibition.do?ex_end_state=${exhibition.ex_end_state}&page=${page}" style="color:black">
						<i class='fas fa-angle-left' style='font-size:48px;'></i>
					</a>
				</div>
				
				<!-- 전시명, 전시기간, 전시장소, 리뷰링크 -->
				<div class="py-4">
					<h1 class="fw-bold" style="margin-bottom: 70px;">${exhibition.ex_name}</h1>
					<p class="h5"><fmt:formatDate value="${exhibition.ex_start}" pattern="yyyy.MM.dd"/> - <fmt:formatDate value="${exhibition.ex_end}" pattern="yyyy.MM.dd"/></p>
					<p class="h6">${exhibition.ex_loc}</p>
					
					<!-- 리뷰부분으로 이동 -->
					<a href="#review" style="text-decoration: none">리뷰</a>
				</div>
				
				<!-- 좋아요 버튼 + 인터셉터 -->
				<div class="mb-2 text-end mb-3">
					<form name="like_frm" id="like_frm">
						<button type="button" id="like_btn" style="width: 100px" class="btn btn-dark"></button>
					</form>
				</div>
			</div>
		</div>
		<hr>
		<div class="contrainer-fluid m-2">
			<div class="row">
				<div class="col-12 pe-3">
					<img src="upload/${exhibition.ex_poster}" class="img-fluid">
					<img src="upload/${exhibition.ex_con_img}" class="img-fluid">					
				</div>
				
				<!-- 예매하기 버튼 + 인터셉터 추가하기! -->
				<div class="mb-4">
					<form name="book_frm" id="book_frm">
						<button type="button" class="btn btn-dark" id="book_btn" style="width: 200px; margin-left: 50px;"></button>
					</form>
				</div>
			</div>
		</div>
		<hr>
		<div class="container-fluid m-5" id="detail_review">
			<div class="mt-4 mb-2">
				<h1 style="margin-bottom: 50px;"><strong>REVIEW</strong></h1>
			</div>
			<!-- 리뷰 제목, 내용, 작성자, 작성일 -->
			<div id="review"></div>
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