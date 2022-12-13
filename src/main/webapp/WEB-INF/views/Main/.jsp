<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_약관동의</title>
</head>
<body>
	<div class="container">
		<%--상단 css 외부파일 출력 위치  --%>

		<form method=post action="main_join_agreeform.do">
			<div class="content_top">
					<p>ee 미술관 웹 회원가입</p>
					<hr>
			</div>
			<div class="memberagreepage">
				<p>고객님의 회원가입을 위하여 아래 약관을 숙지하신 후 동의 버튼을 클릭하시면 회원 가입을 하실 수 있습니다.</p>	
				<hr>			
			</div>
			<dlv class="agree_check1_title">
				<dt>이용약관</dt>
			</dlv>
			<div class="agree_check1_content">
				<textarea rows="10" cols="30">
					이용약관 리스트1
				</textarea><br>
				<input type="checkbox" id="chk1" name=chk1>이용 약관에 동의합니다.<br>
			</div>
			
			<hr>
			
			<div class="agree_check2_title">
				<dt>개인정보 수집 이용에 대한 동의[필수]</dt>
			</div>
			<div class="agree_check2_content">
				<textarea rows="10" cols="30">
					이용약관 리스트2
				</textarea><br>
				<input type="checkbox" id="chk2" name=chk2>이용 약관에 동의합니다.<br>
			</div>
			<hr>
			<input type="submit" value="회원 가입 페이지로 이동 →">
			</div>
			



			<%--푸터 css 외부파일 출력 위치 --%>
						<footer class="footer_full" style="font-size:0.8rem;">
				<div class="footer_c01">
					eeMuseum of Art<br> 서울특별시 마포구 신촌로176, 04104<br> 176,
					Sinchon-ro, Mapo-gu, Seoul, Republic of Korea, 04104<br>
					Tel)02-1234-5678<br>
				</div>
				<div class="footer_c02">
					&copy; An Extraordinary Exhibition Museum of Art. All Rights
					reserved.<br>
				</div>
			</footer>
		</form>
	</div>
</body>
</html>