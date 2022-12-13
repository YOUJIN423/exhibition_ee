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
					<a href="<%=request.getContextPath()%>/member_logout.do" class="icon1"> <strong>LOGOUT</strong></a>
					<a href="<%=request.getContextPath()%>/mypage/mypage.do"" class="icon1"> <img src="<%=request.getContextPath()%>/images/picto_ticket.png" width=40 height=40>
				</a>
			</c:if>
			
			<!-- 세션X -->
			<c:if test="${empty sessionScope.mem_id}">
				<a href="<%=request.getContextPath()%>/member_loginform.do" class="icon3"> <strong>LOGIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_join_agreeform.do" class="icon4"> <strong>JOIN</strong>
				</a>
				<a href="<%=request.getContextPath()%>/member_loginform.do" class="icon5"> 
					<img src="<%=request.getContextPath()%>/images/picto_ticket.png" width=40 height=40>
				</a>
			</c:if>
			
			<nav role="navigation">
				<ul id="main-menu">
					<li><a href="<%=request.getContextPath()%>/main_about_introduce.do"><strong>ABOUT</strong></a></li>
					<li><a href="#"><strong>EXHIBITION</strong></a>
						<ul id="sub-menu">
							<li><a href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=y" aria-label="subemnu">
									진행 중인 전시</a></li>
							<li><a href="<%=request.getContextPath()%>/exhibition.do?ex_end_state=n" aria-label="subemnu">
									종료 전시</a></li>
						</ul>
					</li>
						
					<li><a href="#"><strong>NOTICE</strong></a>
						<ul id="sub-menu">
							<li><a href="<%=request.getContextPath()%>/main_notice.do" aria-label="subemnu">공지 사항</a></li>
							<li><a href="<%=request.getContextPath()%>/main_notice_faq.do" aria-label="subemnu">FAQ</a></li>
						</ul>
					</li>
						
					<li><a href="#"><strong>INFORMATION</strong></a>
						<ul id="sub-menu">
							<li><a href="<%=request.getContextPath()%>/main_info_watching.do" aria-label="subemnu">관람
									안내</a></li>
							<li><a href="<%=request.getContextPath()%>/main_info_booking.do" aria-label="subemnu">예매
									안내</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</header>

	<main>
		<div class="container-fluid">
			<div class="row row-cols-2 pt-5">
				<div class="col-12 mb-1">
						<h3><b>${ex_title}</b></h3>
				</div>
				<c:forEach var="boardlist" items="#{boardlist}">
					<div class="pt-4">
						<a href="exhibition_detail.do?ex_num=${boardlist.ex_num}&page=${page}&ex_end_state=${boardlist.ex_end_state}" style="text-decoration: none;">
							<img src="upload/${boardlist.ex_poster}" class="img-fluid">
							<div class="pt-2 d-flex justify-content-between">
								<p class="h5">${boardlist.ex_name}</p>
								<p class="h6"><fmt:formatDate value="${boardlist.ex_start}" pattern="yyyy.MM.dd"/> - <fmt:formatDate value="${boardlist.ex_end}" pattern="yyyy.MM.dd"/></p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 페이징 처리 -->
		<div class="text-center pt-5 page_f fw-semibold">
			<c:if test="${listcount>0}">
				<!-- 1페이지로 이동 -->
				<a href="exhibition.do?page=1&ex_end_state=${ex_end_state}" style="text-decoration:none">
					<i class="bi bi-chevron-double-left"></i>
				</a>
					
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${startPage > 10}">
					<a href="exhibition.do?page=${stratPage-10}&ex_end_state=${ex_end_state}">
						<i class="bi bi-chevron-left"></i>
					</a>
				</c:if>
				
				<!-- 각 블럭에 10개의 페이지 출력 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i==page}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</c:if> <!-- 현재페이지 -->
					<c:if test="${i!=page}"><a href="exhibition.do?page=${i}&ex_end_state=${ex_end_state}">
					&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></c:if> <!-- 현재페이지가 아닌 경우 -->
				</c:forEach>
				
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${endPage < pageCount}">
					<a href="exhibition.do?page=${startPage+10}&ex_end_state=${ex_end_state}">
						<i class="bi bi-chevron-right"></i>
					</a>
				</c:if>
				
				<!-- 마지막페이지로 이동 -->
				<a href="exhibition.do?page=${pageCount}&ex_end_state=${ex_end_state}" style="text-decoration:none">
					<i class="bi bi-chevron-double-right"></i>
				</a>
			</c:if>
		</div>
	</main>

<footer>
	        <div class="footer_sns">
	        	<div class="inner_wrap">
	        		<a href="https://www.facebook.com/leeumofficial"> 
	        			<img src="./images/picto_twitter.png" width=40 height=40>
					</a>
	        		<a href="https://www.instagram.com/leeummuseumofart/"> 
	        			<img src="./images/picto_insta.png" width=40 height=40>
					</a>
	        		<a href="https://www.youtube.com/channel/UCyXVnJijxHsBrzN9AAZ-Yxw"> 
	        			<img src="./images/picto_youtube.png" width=40 height=40>
					</a><br>
					<a href="#" class="private">개인정보 처리 방침</a><br><br>							
				</div>
          </div>
		  <div class="footer_addr">
				<div class="inner_wrap">
					ee Museum of Art<br>
					서울특별시 마포구 신촌로176, 04104<br>
					176,  Sinchon-ro,  Mapo-gu,  Seoul,  Republic of Korea,  04104<br>
					Tel) 02 - 1234 - 5678<br>
			        &copy; An Extraordinary Exhibition Museum of Art. All Rights reserved.<br><br>
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