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

<script>
function content_down(qna_num) {
	var c = document.getElementById("content_"+qna_num.value);
	c.style.display = ((c.style.display!='none')?'none':'inline');
	$.ajax({
		type : "POST",
		url : "qna_re_load.do?qna_num="+qna_num.value,
		// data : {"qna_num":c},
		success: function(data) {
			var p = document.getElementById("pre_c_"+qna_num.value);
			p.innerHTML = data;
		}
	});
}
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

	<main class="mypage_f">
		<!-- 입력 모달창 -->
		<div class="modal fade" id="qnaModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<form action="qnaWrite.do" method="post">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label"><b>제목<b></label>
								<input type="text" class="form-control" id="recipient-name"
									name="qna_title" required="required">
							</div>

							<div class="mb-3">
								<label for="message-text" class="col-form-label">내용</label>
								<textarea class="form-control" id="message-text"
									name="qna_content" required="required"></textarea>
							</div>

							<div class="modal-footer">
								<input type="submit" id="re_write_btn" class="btn btn-dark"
									value="리뷰작성">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid pt-5">
			<div class="row justify-content-center">
				<div class="col-12">
					<h3 style="margin:30px 0px 0px 50px;"><strong>1:1문의</strong></h3>
				</div>
				<div class="col-12 text-end">
					<button type="button" class="btn" id="qna_btn"
						data-bs-toggle="modal" data-bs-whatever="@mdo"
						data-bs-target="#qnaModal">문의글 작성</button>
				</div>
				<div class="col-12 table-responsive mt-5">
					<table class="table align-middle">
						<thead>
							<tr class="text-center">
								<th scope="col" width="50%">문의글</th>
								<th scope="col" width="30%">작성일</th>
								<th scope="col" width="20%">답변 유무</th>
							</tr>
						</thead>

						<tbody class="table-group-divider">
							<c:forEach var="qna" items="${qna}">
								<tr class="text-center">
									<td>
										<button class="btn" type="text" onclick='content_down(this)'
											value="${qna.qna_num}">${qna.qna_title}</button>
									</td>
									<td><fmt:formatDate value="${qna.qna_date}"
											pattern="yyyy.MM.dd" /></td>
									<td><c:if test="${qna.qna_state=='y'}">
											<i class="bi bi-check-square"></i>
										</c:if> <c:if test="${qna.qna_state=='n'}">
											<i class="bi bi-square"></i>
										</c:if></td>
								</tr>

								<tr>
									<td id="content_${qna.qna_num}" colspan="3"
										style="display: none; border-bottom: 0">
										<div style="margin-left: 30px">
											<h6><b>${qna.qna_title}</b></h6>
											<pre>${qna.qna_content}</pre><br>
										</div> 
										<hr>
										<c:if test="${qna.qna_state=='y'}">
											<pre id="pre_c_${qna.qna_num}" style="margin-left: 30px;">
										</pre>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 페이징 처리 -->
				<div class="text-center pt-5 page_f fw-semibold">
					<c:if test="${listcount>0}">
						<!-- 1페이지로 이동 -->
						<a href="<%=request.getContextPath()%>/mypage/qnaList.do?page=1" style="text-decoration:none">
							<i class="bi bi-chevron-double-left"></i>
						</a>
							
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${startPage > 10}">
							<a href="<%=request.getContextPath()%>/mypage/qnaList.do?page=${stratPage-10}">
								<i class="bi bi-chevron-left"></i>
							</a>
						</c:if>
						
						<!-- 각 블럭에 10개의 페이지 출력 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==page}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</c:if> <!-- 현재페이지 -->
							<c:if test="${i!=page}"><a href="<%=request.getContextPath()%>/mypage/qnaList.do?page=${i}">
							&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></c:if> <!-- 현재페이지가 아닌 경우 -->
						</c:forEach>
						
						<!-- 다음 블럭으로 이동 -->
						<c:if test="${endPage < pageCount}">
							<a href="<%=request.getContextPath()%>/mypage/qnaList.do?page=${startPage+10}">
								<i class="bi bi-chevron-right"></i>
							</a>
						</c:if>
						
						<!-- 마지막페이지로 이동 -->
						<a href="<%=request.getContextPath()%>/mypage/qnaList.do?page=${pageCount}" style="text-decoration:none">
							<i class="bi bi-chevron-double-right"></i>
						</a>
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