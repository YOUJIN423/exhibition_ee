<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: ee Museum of Art ::</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common_nosidebar.css">

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
				<a href="<%=request.getContextPath()%>/mypage/mypage.do"
					class="icon1"> <img
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

	<main class="mypage_f" >
		<div class="container-fluid">
			<div class="row" style="margin-top: 80px">
				<div class="col-12 p-4"
					style="height: 120px; background-color: black;">
					<h2 style="color: white">
						<b class="text-truncate">${mem_id}님의 MYPAGE</b>
					</h2>
					<div class="d-flex">
						<a href="<%=request.getContextPath()%>/mypage/memberInfo.do" style="color: white">회원정보관리</a>
						<p style="color: white">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
						<a href="<%=request.getContextPath()%>/mypage/qnaList.do"
							style="color: white">1:1문의</a>
						<p style="color: white">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
						<a href="<%=request.getContextPath()%>/mypage/myreviewList.do"
							style="color: white">내가 쓴 리뷰 관리</a>
					</div>
				</div>
			</div>

			<div class="row mt-5">
				<div class="col-12 pb-5">
					<div class="pb-1">
						<h5 style="margin:30px 0px 70px 0px;">
							<strong>최근 예매 내역</strong>
						</h5>
					</div>
					<div>
						<table class="table align-middle mb-4">
							<tr class="text-center">
								<th width="15%">예약번호</th>
								<th width="30%">전시명</th>
								<th width="10%">관람일</th>
								<th width="10%">매수</th>
								<th width="10%">결제금액</th>
								<th width="10%">결제일</th>
								<th width="15%">예약상태</th>
							</tr>

							<c:forEach var="ex" items="${ex}" varStatus="status">
								<tr>
									<td class="text-center"><a
										href="<%=request.getContextPath()%>/mypage/bookDetail.do?bo_num=${book[status.index].bo_num}">
											${book[status.index].bo_re_num}</a></td>
									<td class="text-center"><a
										href="<%=request.getContextPath()%>/mypage/bookDetail.do?bo_num=${book[status.index].bo_num}">
											<div class="d-flex align-items-center">
												<img src="<%=request.getContextPath()%>/upload/${ex.ex_poster}"
													class="img-fluid" width="100px">
												<p style="margin: 0px;">&nbsp;&nbsp;${ex.ex_name}</p>

											</div>
									</a></td>

									<td class="text-center">									
									${book[status.index].bo_date}
									
									<%-- <fmt:formatDate		value="${book[status.index].bo_date}" pattern="yyyy-MM-dd   HH:mm:ss "  /> --%>
									</td>
									<td class="text-center">${book[status.index].bo_count}</td>
									<td class="text-center">${book[status.index].bo_price}</td>

									<td class="text-center">
								<%-- 	${pay[status.index].pay_date} --%>
									<fmt:formatDate 	value="${pay[status.index].pay_date}" pattern="yyyy-MM-dd " />
									</td>
									<td class="text-center"><c:if
											test="${book[status.index].bo_state==1}">
											<a class="btn btn-dark" id="cancle_btn"
												href="<%=request.getContextPath()%>/mypage/bookDetail.do?bo_num=${book[status.index].bo_num}#cancle">취소</a>
										</c:if> <c:if test="${book[status.index].bo_state==2}">
											<a class="btn btn-dark"
												href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${ex.ex_num}&ex_end_state=${ex.ex_end_state}#review">리뷰작성</a>
										</c:if> <c:if test="${book[status.index].bo_state==3}">
								취소된 예매
							</c:if> <c:if test="${book[status.index].bo_state==4}">
										<a class="btn btn-dark" 
										href="<%=request.getContextPath()%>/mypage/myreviewList.do">내 리뷰 관리</a>
										</c:if>
										
										<c:if test="${book[status.index].bo_state==5}"></c:if>
										</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="text-end">
						<a href="<%=request.getContextPath()%>/mypage/bookList.do" style="text-decoration: none">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="row mt-4">
				<div class="col-12 pt-3">
					<div class="pb-1">
						<h5 style="margin:30px 0px 30px 0px;">
							<strong>최근 좋아요 리스트</strong>
						</h5>
					</div>

					<div class="row text-center pt-3">
						<c:forEach var="mylike" items="${mylike}">
							<div class="col-4">
								<a
									href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${mylike.ex_num}&ex_end_state=${mylike.ex_end_state}"
									style="text-decoration: none;"> <img
									src="<%=request.getContextPath()%>/upload/${mylike.ex_poster}"
									class="img-fluid">
									<div class="pt-2 d-flex justify-content-between">
										<p class="h6">${mylike.ex_name}</p>
										<p class="h6">
											<fmt:formatDate value="${mylike.ex_start}" pattern="yy-MM-dd" />
											~
											<fmt:formatDate value="${mylike.ex_end}" pattern="yy-MM-dd" />
										</p>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-12 text-end">
					<a href="<%=request.getContextPath()%>/mypage/mylikeList.do" style="text-decoration: none">더보기 ></a>
				</div>
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