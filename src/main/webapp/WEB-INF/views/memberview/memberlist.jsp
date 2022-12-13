<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	


	
	<main>
		<div class="container-fluid">
			<div class="row justify-content-center">
			<!-- 회원목록 -->
			  <div class="col-12">
			  	<div class="mb-3">
					<h3 style="margin:30px 0px 80px 130px; text-align: left;"><strong>회원 목록<strong></h3>
			  	</div>
			  	
			  	<div>
					<table class="table table-bordered text-truncate" style="width: 80%; margin: 0 auto;">
						<thead class="table-light">
						<tr class="text-center">
							<th width="20%">이름</th>
							<th width="25%">아이디</th>
							<th width="25%">이메일</th>
							<th width="20%">가입 날짜</th>
							<th width="10%">회원 상태</th>
						</tr>
						</thead>
						
						<tbody style="line-height: 25px">
						<c:if test="${empty memberlist}">
							<tr>
								<td colspan="12">데이터가 없습니다</td>
							</tr>
						</c:if>
				
						<c:if test="${not empty memberlist}">
							<c:forEach var="member" items="${memberlist}">
								<tr>
									<td class="text-center">${member.mem_name}</td>
									<td><a href="<%=request.getContextPath()%>/master/memberview.do?id=${member.mem_id}">${member.mem_id}</a></td>					
									<td class="text-center">${member.mem_email}@${member.mem_domain}</td>
									<td class="text-center"><fmt:formatDate value="${member.mem_reg}" pattern="yy.MM.dd" /></td>
									<td class="text-center">
									<c:if test="${member.mem_exit_state == 1}">가입</c:if>
									<c:if test="${member.mem_exit_state == 2}">탈퇴 </c:if>
									
									</td>
				
									<c:if test="${sessionScope.role == 'master'}"></c:if>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<!-- 페이징 -->
			<div class="col-12 text-center pb-5">
			<!-- 검색 했을 경우 -->
			  <c:if test=" ${not empty keyword }">
				  <c:if test=" ${pp.startPage > pp.pageBlk}">
					<a href="<%=request.getContextPath()%>/master/memberlist.do?pageNum=${pp.startPage-1 }&search=${search}&keyword=${keyword}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage }">
					<li><c:if test="${pp.currentPage==i}" ></c:if> 
					<a href="<%=request.getContextPath()%>/master/memberlist.do?pageNum=${i} &search=${search}&keyword=${keyword}">${i}</a></li>
	
				</c:forEach>
				
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a
						href="<%=request.getContextPath()%>/master/memberlist.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
		
		
			<!--  검색 하지 않았을 때   -->
		
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pageBlk}">
				<a href="<%=request.getContextPath()%>/master/memberlist.do?pageNum=${pp.startPage-1 }">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage }">
					<c:if test="${pp.currentPage==i}"></c:if>
					<a href="<%=request.getContextPath()%>/master/memberlist.do?pageNum=${i}">
					${i}</a>
				</c:forEach>
		
				<c:if test="${pp.endPage < pp.totalPage}">
					<a href="<%=request.getContextPath()%>/master/memberlist.do?pageNum=${pp.endPage + 1}">다음</a>
				</c:if>
			</c:if>
			</div>
			<!-- 검색 기능 -->
				<div class="col-12 justify-content-center">
					<form action="<%=request.getContextPath()%>/master/memberlist.do">
						<div class="search d-flex col-6 mx-auto">
								<div class="me-1">
									<select name="search" class="form-select">
										<option value="mem_id"
											<c:if test="${search=='mem_id'}">selected="selected" </c:if>>아이디</option>
										<option value="mem_name"
											<c:if test="${search=='mem_name'}">selected="selected" </c:if>>이름</option>
										<option value="subcon"
											<c:if test="${search=='subcon'}">selected="selected" </c:if>>아이디+이름</option>
									</select>
								</div>
							<div class="d-flex">
								<input type="text" name="keyword" class="form-control" style="margin-right: 5px"> 
								<input type="submit" value="확인" class="btn btn-dark">
							</div>
						</div>
					</form>
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