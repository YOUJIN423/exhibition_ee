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

	<main class="mypage_f">
	<div class="container-fluid pt-5">
		<div class="row justify-content-center border">
			<div class="col-8 text-center pt-5 pb-3">
				<h2 style="background-color: black; color:white">
					<strong>예매 내역 확인</strong>
				</h2>
			</div>
			<div class="col-8 pt-3">
				<table class="table table-border align-middle">
					<tr>
						<td rowspan="7"><a
							href="/semi_project/exhibition_detail.do?
						ex_num=${exhibition.ex_num}&ex_end_state=${exhibition.ex_end_state}">
								<img src="/semi_project/upload/${exhibition.ex_poster}"
								width="400px">
						</a></td>
					</tr>

					<tr>
						<th width="50%">전시명</th>
						<td width="50%"><a
							href="/semi_project/exhibition_detail.do?
						ex_num=${exhibition.ex_num}&ex_end_state=${exhibition.ex_end_state}"
							style="text-decoration: none; color: black">
								${exhibition.ex_name}</a></td>
					</tr>

					<tr>
						<th>예약번호</th>
						<td>${book.bo_re_num}</td>
					</tr>
					<tr>
						<th>예약날짜</th>
						<td>${book.bo_date}</td>
					</tr>

					<tr>
						<th>예약시간</th>
						<td><c:if test="${book.bo_time==1}">10:00 ~ 12:00</c:if> <c:if
								test="${book.bo_time==2}">12:00 ~ 14:00</c:if> <c:if
								test="${book.bo_time==3}">14:00 ~ 16:00</c:if> <c:if
								test="${book.bo_time==4}">16:00 ~ 18:00</c:if></td>
					</tr>

					<tr>
						<th>예약인원</th>
						<td>${book.bo_count}명</td>
					</tr>
					<tr>
						<th>인원상세</th>
						<td style="line-height: 15px; padding-top: 20px"><c:if
								test="${book.bo_a_adult!=0}">
								<p>일반 ${book.bo_a_adult}명</p>
							</c:if> <c:if test="${book.bo_a_freshman!=0}">
								<p>청년 ${book.bo_a_freshman}명</p>
							</c:if> <c:if test="${book.bo_a_teen!=0}">
								<p>청소년 ${book.bo_a_teen}명</p>
							</c:if> <c:if test="${book.bo_a_senior!=0}">
								<p>시니어 ${book.bo_a_senior}명</p>
							</c:if> <c:if test="${book.bo_a_free!=0}">
								<p>무료대상자 ${book.bo_a_free}명</p>
							</c:if></td>
					</tr>
				</table>
				<br>
			</div>

			<div class="col-8 text-center pt-5">
				<h3>
					<b>결제 내역</b>
				</h3>
			</div>

			<div class="col-8 pt-3">
				<br>
				<table class="table table-border align-middle">
					<tr>
						<th width="50%">결제일자</th>
						<td width="50%"><fmt:formatDate value="${pay.pay_date}"
								pattern="yyyy.MM.dd" /></td>
					</tr>
					<tr>
						<th>결제상세</th>
						<td style="line-height: 15px; padding-top: 20px"><c:if
								test="${book.bo_a_adult!=0}">
								<p>일반 12,000원 x ${book.bo_a_adult}명 =
									${book.bo_a_adult*12000}원</p>
							</c:if> <c:if test="${book.bo_a_freshman!=0}">
								<p>청년 6,000원 x ${book.bo_a_freshman}명 =
									${book.bo_a_freshman*6000}원</p>
							</c:if> <c:if test="${book.bo_a_teen!=0}">
								<p>청소년 6,000원 x ${book.bo_a_teen}명 = ${book.bo_a_teen*6000}원</p>
							</c:if> <c:if test="${book.bo_a_senior!=0}">
								<p>시니어 6,000원 x ${book.bo_a_teen}명 = ${book.bo_a_teen*6000}원</p>
							</c:if> <c:if test="${book.bo_a_free!=0}">
								<p>무료대상자 무료 = ${book.bo_a_free}명</p>
							</c:if></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td>${book.bo_price}원</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td>${pay.pay_payment}</td>
					</tr>
					<tr>
						<th>취소가능일</th>
						<td><fmt:formatDate value="${cancleDate}"
								pattern="yyyy.MM.dd" /> 23:59:00까지</td>
					</tr>
					<tr>
						<th>예매취소</th>
						<td><c:if test="${book.bo_state==1}">
								<button type="button" class="btn btn-dark"
									data-bs-toggle="modal" data-bs-target="#cancleModal"
									id="cancle">예매취소</button>
							</c:if> <c:if test="${book.bo_state==2}">취소 불가</c:if> <c:if
								test="${book.bo_state==3}">취소 완료</c:if> <c:if
								test="${book.bo_state==4}">취소 불가</c:if>
								<c:if
								test="${book.bo_state==5}">취소 불가</c:if></td>
					</tr>
					<tr>
						<th>예매 취소일</th>
						<td><fmt:formatDate value="${pay.pay_canceldate}"
								pattern="yyyy.MM.dd" /></td>
					</tr>
				</table>
			</div>

			<!-- 취소 모달창 -->
			<div class="modal fade" id="cancleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">취소내역 확인</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<table class="table table-border align-middle">
								<tr>
									<th width="20%">전시명</th>
									<td width="50%">${exhibition.ex_name}</td>
								</tr>
								<tr>
									<th>예약번호</th>
									<td>${book.bo_re_num}</td>
								</tr>
								<tr>
									<th>예약날짜</th>
									<td>${book.bo_date}</td>
								</tr>
								<tr>
									<th>예약시간</th>
									<td><c:if test="${book.bo_time==1}">10:00 ~ 12:00</c:if> <c:if
											test="${book.bo_time==2}">12:00 ~ 14:00</c:if> <c:if
											test="${book.bo_time==3}">14:00 ~ 16:00</c:if> <c:if
											test="${book.bo_time==4}">16:00 ~ 18:00</c:if></td>
								</tr>
								<tr>
									<th>예약인원</th>
									<td>${book.bo_count}명</td>
								</tr>
								<tr>
									<th>인원상세</th>
									<td style="line-height: 15px; padding-top: 20px"><c:if
											test="${book.bo_a_adult!=0}">
											<p>일반 ${book.bo_a_adult}명</p>
										</c:if> <c:if test="${book.bo_a_freshman!=0}">
											<p>청년 ${book.bo_a_freshman}명</p>
										</c:if> <c:if test="${book.bo_a_teen!=0}">
											<p>청소년 ${book.bo_a_teen}명</p>
										</c:if> <c:if test="${book.bo_a_senior!=0}">
											<p>시니어 ${book.bo_a_senior}명</p>
										</c:if> <c:if test="${book.bo_a_free!=0}">
											<p>무료대상자 ${book.bo_a_free}명</p>
										</c:if></td>
								</tr>
								<tr>
									<th>결제금액</th>
									<td>${book.bo_price}원</td>
								</tr>
								<tr>
									<th>결제수단</th>
									<td>${pay.pay_payment}</td>
								</tr>
								<tr>
									<th>결제일자</th>
									<td><fmt:formatDate value="${pay.pay_date}"
											pattern="yyyy.MM.dd" /></td>
								</tr>
							</table>
							<p class="text-center">환불금은 카드사 익영업일 1~3일 소요됩니다.</p>
						</div>
						<div class="modal-footer">
							<form action="bookCancle.do">
								<input type="hidden" value="${book.bo_num}" name="bo_num" /> <input
									type="button" class="btn btn-dark" data-bs-dismiss="modal"
									value="창닫기" /> <input type="submit" class="btn btn-dark"
									value="예매 취소" />
							</form>
						</div>
					</div>
				</div>
			</div>


			<div class="col-8 pt-5 text-center">
				<h3>
					<b>유의 사항</b>
				</h3>
			</div>

			<div class="col-8 pt-3 pb-4">
				<br>
				<table class="table table-border align-middle">
					<tr>
						<th width="30%">취소 마감시간</th>
						<td width="70%">관람일 전날 23:59까지</td>
					</tr>
					<tr>
						<th>환불금 입금</th>
						<td></td>
					</tr>
					<tr>
						<th>예매 변경</th>
						<td>예매 변경은 불가능하며, 기존 예매를 취소하고 재예매를 해야합니다.</td>
					</tr>
				</table>
			</div>

		</div>
		<!-- row -->
	</div>
	<!-- container -->	
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