<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<link rel="stylesheet" href="" type="text/css">

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Main/main_deco_notice_notice.css">

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
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
			<div class="mb-3">
				<h2 class="text-center"><b>예약페이지</b></h2>
			</div>
			<div>
				<table class="table table-hover text-center">
					<thead>
					<tr>
						<th width="40%">예약번호</th>
						<th width="20%">회원 아이디</th>
						<th width="20%">예약 날짜</th>
						<th width="20%">예약 상태</th>
					</tr>
					</thead>
					
					<tbody style="line-height: 30px">
					<c:forEach var="b" items="${booklist}">
						<tr>
							<td><a href="bookdetail.do?bo_num=${b.bo_num}&page=${page}">${b.bo_re_num}</a></td>
							<td>${b.mem_id}</td>
							<td>${b.bo_date}</td>
							<td>${b.bo_state}</td>
							
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		<!-- 페이지 처리  -->
			<div class="col-12 text-center pb-5">
				<c:if test="${bookcount > 0 }">
					
					<!-- 1페이지로 이동 -->
					<a href="bookpage.do?page=1" style="text-decoration: none"> << </a>
	
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage > 5}">
						<a href="bookpage.do?page=${startPage-5}">[이전]</a>
					</c:if>
	
					<!-- 각 블럭에 10개의 페이지 출력 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == page}">
							<!-- 현재 페이지 -->
							[${i}]
						</c:if>
						<c:if test="${i != page}">
							<!-- 현재 페이지가 아닌 경우 -->
							<a href="bookpage.do?page=${i}">${i}</a>
						</c:if>
					</c:forEach>
	
					<!-- 다음 블럭으로 이동 -->
					<c:if test="${endPage < pageCount}">
						<a href="bookpage.do?page=${startPage+5}">[다음]</a>
					</c:if>
	
					<!-- 마지막 페이지로 이동 -->
					<a href="bookpage.do?page=${pageCount}"
						style="text-decoration: none"> >> </a>
				</c:if>
			</div>
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

		</from>
</body>
</html>