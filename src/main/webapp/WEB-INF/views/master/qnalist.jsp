<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Museum of Art_notice</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/master/master_deco_common.css">

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
 <!--문의 글 목록 -->
	<main>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 text-center mb-3">
					<h3 style="margin: 30px 0px 60px 130px; text-align: left;"><strong>고객 문의 목록</strong></h3>
				</div>
				
				<div class="col-12">
					<table class="table table-hover align-middle text-center text-truncate" style="width: 80%; margin: 0 auto;">
						<thead>
							<tr>
								<th width="10%">번호</th>
								<th width="20%">아이디</th>
								<th width="40%">제목</th>
								<th width="20%">작성일</th>
								<th width="10%">답변 여부</th>
							</tr>
						</thead>
						<!-- 화면 출력 번호 -->
			
						<c:set var="qna_num" value="${qnacount-(page-1)*5}" />
						<c:forEach var="q" items="${qnalist}">
							<tr>
								<td>${qna_num}<c:set var="qna_num" value="${qna_num-1 }" /></td>
								<td>${q.mem_id}</td>
								<td><a href="<%=request.getContextPath()%>/master/qnacontent.do?qna_num=${q.qna_num}&page=${page}">${q.qna_title}</a></td>
								<td><fmt:formatDate value="${q.qna_date}"
										pattern="yy-MM-dd" /></td>
								<td>
									<c:if test="${q.qna_state=='y'}">완료</c:if>
									<c:if test="${q.qna_state=='n'}"></c:if>
								</td>		
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이지 처리 -->

				<div class="col-12 text-center">
				<br>
				<br>
					<c:if test="${qnacount > 0 }">
						<!-- 1페이지로 이동 -->
						<a href="<%=request.getContextPath()%>/master/qnalist.do?page=1" style="text-decoration: none"> << </a>
		
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${startPage > 5 }">
							<a href="<%=request.getContextPath()%>/master/qnalist.do?page=${startPage-5}">[이전]</a>
						</c:if>
		
						<!-- 각 블럭에 5개의 페이지 출력 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == page }">
								<!-- 현재 페이지 -->
				                            [${i}]
			        </c:if>
							<c:if test="${i != page }">
								<!-- 현재 페이지가 아닌 경우 -->
								<a href="<%=request.getContextPath()%>/master/qnalist.do?page=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
		
						<!-- 다음 블럭으로 이동 -->
						<c:if test="${endPage < pageCount}">
							<a href="<%=request.getContextPath()%>/master/qnalist.do?page=${startPage+5}">[다음]</a>
						</c:if>
		
						<!-- 마지막 페이지로 이동 -->
						<a href="<%=request.getContextPath()%>/master/qnalist.do?page=${pageCount}"
							style="text-decoration: none"> >> </a>
					</c:if>
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