<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<h1>TEST PAGE</h1>
	<h2>ID : ${mem_id}</h2>
	<a href="loginForm.do">로그인</a>
	<a href="/semi_project/logout.do">로그아웃</a>
	<a href="https://kauth.kakao.com/oauth/logout?
		client_id=0bd8574fe41ad9e2b977ee43df4f41f5
		&logout_redirect_uri=http://localhost/semi_project/kakao/oauth/logout.do">카카오톡 로그아웃</a>
	
	<a href="exhibition.do?ex_end_state=y">현재 전시</a>
	<a href="exhibition.do?ex_end_state=n">종료 전시</a>
	<a href="joinForm.do">회원가입</a>
	<a href="exhibitionRegiForm.do">전시 등록</a>
	<br>
	<hr>
	<a href="mypage/mypage.do">마이페이지</a>
	<form action="searchExhibition.do">
		<input type="text" name="search" id="search">
		<input type="submit" value="검색">
	</form>
	
	<a href="socialLoginForm.do">소셜로그인</a>
</body>
</html>