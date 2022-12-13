<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
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
		<div class="col-12 text-center border p-5">
				<div class="mb-4"><h2><b>회원 상세</b></h2></div>
				<div class="col-10 border border-dark p-3 mx-auto">
				<table style="line-height: 30px">
					<tr>
						<th width="40%">아이디</th>
						<td>${member.mem_id}</td>
					</tr>
		
					<th>이름</th>
					<td>${member.mem_name}</td>
					</tr>
		
					<tr>
						<th>성별</th>
						<td>${member.mem_gender}</td>
					</tr>
		
					<tr>
						<th>휴대폰 번호</th>
						<td>${member.mem_tel1}-${member.mem_tel2}-${member.mem_tel3}</td>
					</tr>
		
					<tr>
						<th>가입일</th>
						<td><fmt:formatDate value="${member.mem_reg}"
								pattern="YYYY/MM/dd HH:mm EEE요일" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.mem_email}@${member.mem_domain}</td>
					</tr>
					<tr>
					<th>우편번호</th>
					<td>${member.mem_post }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${member.mem_addr1}</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>${member.mem_addr2}</td>
					</tr>
				</table>
			</div>
			<div class="mt-3">
				<%-- <c:if test="${sessionScope.id =='master'}"> --%>
				<input type="button" value="회원 목록" class="btn btn-dark" onclick="history.go(-1)"></td>
				<%-- </c:if> --%>
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