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
     <script>
    function check() {
    	 $("#ex_regi_btn").click(function(){
    	    	if($("#ex_name").val()=="") {
    	    		alert("전시명을 입력하세요");
    	    		return false;
    	    	}
    	    	
    	    	if(result == 0) {
    	    		alert("날짜를 선택하세요.");
    	    		return false;
    	    	}
    	    	
    	    	if($("#mf_poster").val()=="") {
    	    		alert("포스터를 등록하세요");
    	    		return false;
    	    	}
    	    	
    	    	if($("#mf_img").val()=="") {
    	    		alert("전시 이미지를 등록하세요");
    	    		return false;
    	    	}
    });
  	 
    

      </script>
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
     <h2>전시 등록</h2>
		<form method="post" action="<%=request.getContextPath()%>/master/exhibitionRegi.do" name="f" enctype="multipart/form-data" >
		<div class="content">
				<table class="table table-hover" >
				<thead>
					<tr>
						<th>전시 명</th>
						<td><input type="text" name="ex_name" id="ex_name" size="14"></td>
					</tr>

					<tr>
							<th>전시 장소</th>
							<td><select name="ex_loc" id="ex_loc" value="${exhibition.ex_loc}">
									<option value="M1(고미술) 1전시실">M1(고미술) 1전시실</option>
									<option value="M1(고미술) 2전시실">M1(고미술) 2전시실</option>
									<option value="M1(고미술) 3전시실">M1(고미술) 3전시실</option>
									<option value="M1(고미술) 4전시실">M1(고미술) 4전시실</option>
									<option value="M2(현대미술) 1전시실">M2(현대미술) 1전시실</option>
									<option value="M2(현대미술) 2전시실">M2(현대미술) 2전시실</option>
							</select></td>
						</tr>


					<tr>
						<th>전시일</th>
						<td><input type="date" name="ex_start" id="ex_start"></td>
					</tr>


					<tr>
						<th>전시 전시 포스터</th>
						<td><input type="file" name="mf[]" id="mf_poster" ></td>
					</tr>

					<tr>
						<th>전시 전시 이미지</th>
						<td><input type="file" name="mf[]" id="mf_img" ></td>
					</tr>
					</table>
			</div>
				<div class="button_div"  style="text-align:center;">
				<button type="submit" class="button" >등록</button>
			</div>

		</form>
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