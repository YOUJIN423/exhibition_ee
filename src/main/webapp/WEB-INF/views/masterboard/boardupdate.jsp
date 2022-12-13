<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Museum of Art_notice</title>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/master/board_boardupdate.css">
</head>

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
		<div class="content">
			<form method=post action="boardupdate.do" onsubmit="<%=request.getContextPath()%>/master/boardupdate.do">
				<input type="hidden" name="board_num" value="${board.board_num}">
	   			<input type="hidden" name="page" value="${page}">	
		
				<table class="table" style="width: 80%; margin: 0 auto;">
		
					<h3 style="margin: 30px 0px 60px 130px;"><strong>공지 수정</strong></h3>
						<tr>
							<td>작성자</td>
							<td>${board.board_name}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="board_title" id="board_title"
									value="${board.board_title}" 
									style="width:600px;height:25px;font-size:16px;"></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><fmt:formatDate value="${board.board_date}" pattern="yyyy년  MM월  dd일" type="date"/></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea cols=40 rows=5 name="board_content" id="board_content"
									style="width:600px;height:150px;">${board.board_content}</textarea></td>
						</tr>				
				</table>
		 <div class="button_div">
	    	<button type="button" class="button" onClick="location.href='<%=request.getContextPath()%>/master/master_boardcontent.do?board_num=${board.board_num}&page=${page}'">목록</button>
	    	<input type="submit"   class="button"  value="수정" >
		</div>
			</form>
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
				</a><br> <a href="<%=request.getContextPath()%>/program.do" class="private">개인정보 처리 방침</a><br>
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