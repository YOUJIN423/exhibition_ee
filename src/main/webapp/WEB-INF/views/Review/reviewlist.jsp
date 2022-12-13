<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: ee Museum of Art ::</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common_nosidebar.css">
	
<script>
$(document).ready(function(){
	/* 리뷰 */
	/* book_state에 따라 모달창 활성/비활성 ajax */
	$.ajax({
		type : "POST",
		url : "<%=request.getContextPath()%>/reviewCheck.do",
		data : "ex_num=${ex_num}&mem_id=${mem_id}",
		success : function(data) {
			if (data >= 1) {
				$("#review_btn").attr(
						"data-bs-target",
						"#exampleModal")
			} else if (data == -1) {
				$("#review_btn").attr(
						"data-bs-target", "#none");
			} else {
				$("#review_btn").attr(
						"data-bs-target", "#none");
			}
		}
	});

	/* 인터셉터 적용이 안돼서 alert창으로 함 */
	/* 내 회원 정보 + 예약 정보 확인해서 리뷰 작성 가능하면 작성창으로 이동하고, 작성 불가능하면 불가능 하다는 alert창  */
	$("#review_btn").click(function() {
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/reviewCheck.do",
			data : "ex_num=${ex_num}&mem_id=${mem_id}",
			success : function(data) {
				if (data >= 1) {
					$("#review_btn")
							.attr(
									"data-bs-target",
									"#exampleModal")
				} else if (data == -1) {
					alert("로그인을 해야 이용 가능합니다.");
					$("#review_btn")
							.attr(
									"data-bs-target",
									"#none");
				} else {
					alert("리뷰 작성을 할 수 없습니다.");
					$("#review_btn")
							.attr(
									"data-bs-target",
									"#none")
					}
				}
			});
		});
	});
		
		function delete_btn(clicked_id) {
			if (confirm("정말 삭제하시겠습니까? 삭제 후 리뷰를 다시 작성할 수 없습니다.")) {
				location.href = "reviewDelete.do?rev_num="+ clicked_id + "&ex_num=" + ${ex_num};
			} else {
				return false;
				}
			}
		
		function update_btn(clicked_id) {
			$.ajax({
				type : "POST",
				url : "rev_title_load.do?rev_num="+clicked_id,
				success: function(data) {
					var title = document.getElementById("recipient-name_"+clicked_id);
					title.value = data;
				}
			});
			
			$.ajax({
				type : "POST",
				url : "rev_content_load.do?rev_num="+clicked_id,
				success: function(data) {
					var content = document.getElementById("message-text_"+clicked_id);
					content.value = data;
				}
			});
		}
	
</script>
</head>
<body>

	<!-- ajax + 댓글 형식 -->
	<div class="contrainer-fluid mb-3">
		<button type="button" id="review_btn" style="width: 200px"
			class="btn btn-dark btn-sm" data-bs-toggle="modal"
			data-bs-whatever="@mdo">
			<b>리뷰 작성</b>
		</button>
	</div>

	<!-- 입력 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form action="review.do" method="post">
						<input type="hidden" name="mem_id" value="${mem_id}"> <input
							type="hidden" name="ex_num" value="${ex_num}">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">제목 :</label>
							<input type="text" class="form-control" id="recipient-name"
								name="rev_title" required="required">
						</div>

						<div class="mb-3">
							<label for="message-text" class="col-form-label">내용 :</label>
							<textarea class="form-control" id="message-text"
								name="rev_content" required="required"></textarea>
						</div>

						<div class="modal-footer">
							<input type="submit" id="re_write_btn" class="btn btn-dark"
								value="리뷰입력">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<c:forEach var="list" items="${list}" varStatus="status">
		<!-- 수정 모달창 -->
		<div class="modal fade" id="updateModal_${list.rev_num}" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<form action="reviewUpdate.do" method="post">
							<input type="hidden" id="rev_num" name="rev_num" value="${list.rev_num}">
							<input type="hidden" id="ex_num" name="ex_num" value="${list.ex_num}">

							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">제목 :</label>
								<input type="text" class="form-control" id="recipient-name_${list.rev_num}"
									name="rev_title" required="required">
							</div>

							<div class="mb-3">
								<label for="message-text" class="col-form-label">내용 :</label>
								<textarea class="form-control" id="message-text_${list.rev_num}"
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

		<div class="review_f mb-3">
			<div class="col-10 p-3 pb-0 border">
				<div class="d-flex">
					<h6 class="col-1"><b><i class="bi bi-person-circle"></i>&nbsp;&nbsp;${list.mem_id}</b></h6>
					<h6 class="col-1" style="font-size: 15px"><fmt:formatDate value="${list.rev_date}" pattern="yy-MM-dd"/></h6>
					<div class="col-10 text-end" style="height: 20px;">
						<c:set var="mem_id" value="${sessionScope.mem_id}" />
						<c:if test="${list.mem_id == mem_id}">
							<form>
								<input type="hidden" id="r_num" value="${list.rev_num}">
								<input type="hidden" id="e_num" value="${list.ex_num}">
								
								<button type="button" id="${list.rev_num}" class="btn btn-sm"
									onclick="update_btn(this.id)"
									style="height:30px;"
									data-bs-toggle="modal" data-bs-whatever="@mdo"
									data-bs-target="#updateModal_${list.rev_num}">리뷰 수정</button>
									
								<button type="button" id="${list.rev_num}" class="btn btn-sm"
									onclick="delete_btn(this.id)"
									style="height:30px;">리뷰삭제</button>
							</form>
								
						</c:if>
					</div>
				</div>
				<h5><b>${list.rev_title}</b></h5>
				<pre style="font-size: 18px">${list.rev_content}</pre>
			</div>
		</div>
	</c:forEach>
	
	<!-- 페이징 처리 -->
	<div class="text-center pt-5 page_f fw-semibold">
		<c:if test="${listcount>0}">
			<!-- 1페이지로 이동 -->
			<a href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${ex_num}&rev_page=1#review"" style="text-decoration:none">
				<i class="bi bi-chevron-double-left"></i>
			</a>
				
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${startPage > 10}">
				<a href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${ex_num}&rev_page=${stratPage-10}#review"">
					<i class="bi bi-chevron-left"></i>
				</a>
			</c:if>
			
			<!-- 각 블럭에 10개의 페이지 출력 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i==page}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</c:if> <!-- 현재페이지 -->
				<c:if test="${i!=page}"><a href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${ex_num}&rev_page=${i}#review"">
				&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></c:if> <!-- 현재페이지가 아닌 경우 -->
			</c:forEach>
			
			<!-- 다음 블럭으로 이동 -->
			<c:if test="${endPage < pageCount}">
				<a href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${ex_num}&rev_page=${startPage+10}#review"">
					<i class="bi bi-chevron-right"></i>
				</a>
			</c:if>
			
			<!-- 마지막페이지로 이동 -->
			<a href="<%=request.getContextPath()%>/exhibition_detail.do?ex_num=${ex_num}&rev_page=${pageCount}#review" style="text-decoration:none">
				<i class="bi bi-chevron-double-right"></i>
			</a>
		</c:if>
	</div>
</body>
</html>