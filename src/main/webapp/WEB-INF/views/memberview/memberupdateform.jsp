<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Main/main_deco_notice_notice.css">
</head>
<body>
<header>
		<div class="logo">
			<a href="main_index.do"> <img
				src="./images/EELOGO_TEXTONLY_BK.png" width=800 height=160>
			</a>
		</div>


		<body>
	<header>
		<div class="logo">
			<a href="<%=request.getContextPath()%>master/master_index.do"> 
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
	<form action="<%=request.getContextPath()%>/master/memupdate.do" method="post">
	   <input type="hidden" name="mem_id"  value="${member.mem_id}">
		<table align="center" width="800px">

			<caption>회원 정보 수정</caption>
			<tr>
				<th>아이디</th>
				<td>${member.mem_id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mem_name" id="mem_name" value=" ${member.mem_name}"></td>
			</tr>

			<tr>
				<th>성별</th>
				<td><input type="text" name="mem_gender" id="mem_gender"  value="${member.mem_gender}"></td>
			</tr>

			<tr>
				<th>휴대폰 번호</th>
				<td><input type="text" name="mem_tel1" id="mem_tel1"  value="${member.mem_tel1 }"></td>
				<td><input type="text" name="mem_tel2" id="mem_tel2"  value="${member.mem_tel2 }"></td>
				<td><input type="text" name="mem_tel3" id="mem_tel3"  value="${member.mem_tel3 }"></td>

			</tr>

			<tr>
				<th>가입일</th>
				<td><fmt:formatDate value="${member.mem_reg}"
						pattern="YYYY/MM/dd HH:mm EEE요일" /></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="text" name="mem_email" id="mem_email"  value="${member.mem_email }">@
				<td><input type="text" name="mem_domain" id="mem_domain" value="${member.mem_domain }">
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text " name="mem_addr1" id="mem_addr2" value="${member.mem_addr1 }"></td>
			</tr>

			<tr>
				<th>상세주소</th>
				<td><input type="text" name="mem_addr2" id="mem_addr2"  value="${member.mem_addr2 }"></td>
			</tr>
			<tr>
				<td><input tyep="submit" value="수정 완료 "></td>
			</tr>
		</table>
	</form>
</main>
	
</body>
</html>