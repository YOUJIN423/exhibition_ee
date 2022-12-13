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
	function delete_btn(clicked_id) {
		if (confirm("정말 삭제하시겠습니까? 삭제 후 리뷰를 다시 작성할 수 없습니다.")) {
			location.href = "<%=request.getContextPath()%>/reviewDelete2.do?rev_num="+ clicked_id;
		} else {
			return false;
			}
		}
	
	function update_btn(clicked_id) {
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/rev_title_load.do?rev_num="+clicked_id,
			success: function(data) {
				var title = document.getElementById("recipient-name_"+clicked_id);
				title.value = data;
			}
		});
		
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/rev_content_load.do?rev_num="+clicked_id,
			success: function(data) {
				var content = document.getElementById("message-text_"+clicked_id);
				content.value = data;
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
			<div class="row">
				<div class="col-12">
					<h3 style="margin:30px 0px 0px 50px;">
						<strong>내 리뷰 관리</strong>
					</h3>
				</div>
				<div class="col-12 justify-content-center mt-2">
					<c:forEach items="${review}" var="review" varStatus="status">
						<div class="mb-3">
							<div class="col-12 p-3 pb-0 border">
								<div class="d-flex">
									<h6 class="col-1"><b><i class="bi bi-person-circle"></i>&nbsp;&nbsp;${review.mem_id}</b></h6>
									<h6 class="col-1" style="font-size: 15px"><fmt:formatDate value="${review.rev_date}" pattern="yy-MM-dd"/></h6>
									<div class="col-10 text-end" style="height: 20px;">
										<form>	
											<button type="button" id="${review.rev_num}" class="btn btn-sm"
												onclick="update_btn(this.id)"
												style="height:30px;"
												data-bs-toggle="modal" data-bs-whatever="@mdo"
												data-bs-target="#updateModal_${review.rev_num}">리뷰 수정</button>
											<button type="button" id="${review.rev_num}" class="btn btn-sm"
												onclick="delete_btn(this.id)"
												style="height:30px;">리뷰삭제</button>
											<input type="hidden" id="r_num" value="${review.rev_num}">
											<input type="hidden" id="e_num" value="${review.ex_num}">
										</form>
									</div>
								</div>
								<h5><b>${review.rev_title}</b></h5>
								<pre style="font-size: 18px">${review.rev_content}</pre>
								<div>
									<p>전시명 : ${exhibition[status.index].ex_name}</p>
								</div>
							</div>
						</div>
						
						<!-- 수정 모달창 -->
						<div class="modal fade" id="updateModal_${review.rev_num}" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true"
							style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
				
									<div class="modal-body">
										<form action="<%=request.getContextPath()%>/reviewUpdate2.do" method="post">
											<input type="hidden" name="rev_num" value="${review.rev_num}">
											<input type="hidden" name="ex_num" value="${review.ex_num}">
				
											<div class="mb-3">
												<label for="recipient-name" class="col-form-label">제목 :</label>
												<input type="text" class="form-control" id="recipient-name_${review.rev_num}"
													name="rev_title" required="required">
											</div>
				
											<div class="mb-3">
												<label for="message-text" class="col-form-label">내용 :</label>
												<textarea class="form-control" id="message-text_${review.rev_num}"
													name="rev_content" required="required"></textarea>
											</div>
				
											<div class="modal-footer">
												<input type="submit" id="re_write_btn" class="btn btn-dark"
													value="리뷰수정">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 페이징 처리 -->
		<div class="text-center pt-5 page_f fw-semibold">
			<c:if test="${listcount>0}">
				<!-- 1페이지로 이동 -->
				<a href="<%=request.getContextPath()%>/mypage/myreviewList.do?page=1" style="text-decoration:none">
					<i class="bi bi-chevron-double-left"></i>
				</a>
					
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${startPage > 10}">
					<a href="<%=request.getContextPath()%>/mypage/myreviewList.do?page=${stratPage-10}">
						<i class="bi bi-chevron-left"></i>
					</a>
				</c:if>
				
				<!-- 각 블럭에 10개의 페이지 출력 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i==page}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</c:if> <!-- 현재페이지 -->
					<c:if test="${i!=page}"><a href="<%=request.getContextPath()%>/mypage/myreviewList.do?page=${page}">
					&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></c:if> <!-- 현재페이지가 아닌 경우 -->
				</c:forEach>
				
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${endPage < pageCount}">
					<a href="<%=request.getContextPath()%>/mypage/myreviewList.do?page=${startPage+10}">
						<i class="bi bi-chevron-right"></i>
					</a>
				</c:if>
				
				<!-- 마지막페이지로 이동 -->
				<a href="<%=request.getContextPath()%>/mypage/myreviewList.do?page=${pageCount}" style="text-decoration:none">
					<i class="bi bi-chevron-double-right"></i>
				</a>
			</c:if>
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