<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>  
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Museum of Art_notice</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Main/main_deco_notice_notice.css">

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
		<div class="container mt-3">
			<h3 style="margin:50px 0px 50px 0px;">공지 사항</h3>
		  <table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<!-- 화면 출력 번호 -->

				<c:set var="board_num" value="${listcount-(page-1)*4}" />
				<c:forEach var="b" items="${boardlist }">
					<tr>
						<td>${board_num}<c:set var="board_num" value="${board_num-1 }" />
						</td>
						<td><a
							href="boardcontent.do?board_num=${b.board_num}&page=${page}">
								${b.board_title } </a></td>
						<td>${b.board_name }</td>
						<td><fmt:formatDate value="${b.board_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>

			<!-- 페이지 처리  -->
			<center>
				<c:if test="${listcount > 0 }">

					<!-- 1페이지로 이동 -->
					<ul class="pagination"> </ul>

						<a href="main_notice.do?page=1" style="text-decoration: none"> << </a>

						<!-- 이전 블럭으로 이동 -->
						<c:if test="${startPage > 5 }">
							<a href="main_notice.do?page=${startPage-5}"> [이전] </a>
						</c:if>

						<!-- 각 블럭에 5개의 페이지 출력 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == page }">

								<!-- 현재 페이지 -->
		                            [${i}]
	                        </c:if>
							<c:if test="${i != page }">
								<!-- 현재 페이지가 아닌 경우 -->
								<a href="main_notice.do?page=${i}">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음 블럭으로 이동 -->
						<c:if test="${endPage < pageCount}">
							<a href="main_notice.do?page=${startPage+5}">[다음]</a>
						</c:if>

						<!-- 마지막 페이지로 이동 -->
						<a href="main_notice.do?page=${pageCount}"
							style="text-decoration: none"> >> </a>
				</c:if>
			</center>
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