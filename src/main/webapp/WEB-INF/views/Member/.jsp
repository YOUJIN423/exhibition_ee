<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_main_joinform</title>
</head>
<body>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- [구글 폰트]
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
 -->

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
		
</script>

<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Member/member_deco_joinform.css">
</head>
<body>
	<div class="container">
		<div class="header">
			<a href="https://www.seoul.go.kr"> <img
				src="./images/EELOGO_TEXTONLY_WW.png" width=700 height=150 >
			</a>
		</div>
		<div class="sidebar">
						<div class="flex-shrink-0 p-3 bg-white" >
				<a href="/"
					class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
					<svg class="bi pe-none me-2" width="30" height="24">
				<use xlink:href="#bootstrap"></use></svg> 
				<a href="https://www.seoul.go.kr"> <img src="./images/EELOGO_TEXT_BK.png" width=250 height=250>
				</a> 
				<!-- <span class="fs-5 fw-semibold">eeMuseum of Art</span> -->
				</a>
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="true"><strong>INFORMATION</strong></button>
						<div class="collapse show" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="main_info_introduce.do";
									class="link-dark d-inline-flex text-decoration-none rounded">미술관 소개
										</a></li>
								<li><a href="main_info_watching.do"
									class="link-dark d-inline-flex text-decoration-none rounded">관람
										안내</a></li>
								<li><a href="main_info_booking.do"
									class="link-dark d-inline-flex text-decoration-none rounded">예매 안내</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false"><strong>NOTICE</strong></button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="main_notice.do"
									class="link-dark d-inline-flex text-decoration-none rounded">공지</a></li>
								<li><a href="main_notice_faq.do"
									class="link-dark d-inline-flex text-decoration-none rounded">FAQ</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#orders-collapse"
							aria-expanded="false"><strong>EXHIBITION</strong></button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="main_exhibition_ing.do"
									class="link-dark d-inline-flex text-decoration-none rounded">진행
										중인 전시</a></li>
								<li><a href="main_exhibition_end.do"
									class="link-dark d-inline-flex text-decoration-none rounded">종료
										전시</a></li>
							</ul>
						</div>
					</li>
					<li class="border-top my-3"></li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false"><strong>Account</strong></button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="member_loginform.do"
									class="link-dark d-inline-flex text-decoration-none rounded">Login</a></li>
								<%--[-----------세션 설정 후 나타날 목록------------------] --%>
								<li><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">Logout</a></li>
								<li><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">Mypage</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="main">
			<section class="content">
				<div class="joinformTitle">
					<ul>
						<li><strong>ee미술관 웹 회원가입</strong></li>
					</ul>
				</div>	
				<div>
					<form id="joinform" name="joinform" action="main_joinform.do" method="post" onsubmit="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					<input type="" type="hidden" value="">
					
					<ul class="joinformPage">
						<div class="joinformPageContent">
							<div class="joinformPageNm">
								<dt>회원 정보 입력</dt>
							</div>
							<div class="joinformPageArc">
								<li class="arc">
									<dt>이름</dt>
									<dd>
										<input name="" type="hidden" value="" title="이름">
									</dd>
								</li>
								
									<li class="arc">
										<dt>생년월일</dt>
										<dd class="noInput">
											<span class="birthDate">년 월 일</span> 
											<span class="radioarc">
												<input type="radio" name="birthValue" id="sun" value="1"
												checked="true"> 
												<label for="sun">양력</label>
											</span> 
											
											<span class="radioarc">
												<input type="radio" name="birthValue" id="moon" value="2">
												<label for="moon">음력</label>
											</span>
										</dd>
									</li>

									<li class="arc">
										<dt>성별</dt>
										<dd>
											<input>
										</dd>
									</li>

									<li class="arc">
										<dt>아이디</dt>
										<dd>
											<input>
										</dd>
									</li>
									
									<li class="arc">
										<dt>비밀번호</dt>
										<dd>
											<input>
										</dd>
									</li>
									
									<li class="arc">
										<dt>핸드폰</dt>
										<dd>
											<input>
										</dd>
									</li>
									
									<li class="arc">
										<dt>이메일</dt>
										<dd>
											<input>
										</dd>
									</li>
									
									<li class="arc">
										<dt>도메인</dt>
										<dd>
											<input>
										</dd>
									</li>
									
									<li class="arc">
										<dt>주소</dt>
										<dd>
											<input>
										</dd>
									</li>
									
									<li class="arc">
										<dt>우편번호</dt>
										<dd>
											<input>
										</dd>
									</li>
									

									
									<li>
									<a href="#" onclick="">확인</a>
									<a href="">취소</a>
								</li>
							</div>
						</div>
					</ul>
					</form>
				</div>			
			</section>
		</div>

		<div class="bottom">
		<hr>
		ee Museum of Art<br> 
		서울특별시 마포구 신촌로176, 04104<br> 
		176,  Sinchon-ro,  Mapo-gu,  Seoul,  Republic of Korea,  04104<br>
		Tel) 02 - 1234 - 5678<br>
        &copy; An Extraordinary Exhibition Museum of Art. All Rights reserved.<br>
		</div>
		</div>
		
	</div>
</body>
</html>	 