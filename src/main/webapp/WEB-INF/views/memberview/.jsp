<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix=" fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix=" c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
</head>
<body>
	<form>
		<table border="1" width="700px" align="center">

			<caption>회원 상세</caption>

			<tr>
				<th>아이디</th>
				<td>${member.mem_id}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${member.mem_pwd}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${member.mem_name}</td>
			</tr>

			<tr>
				<th>성별</th>
				<td>${member.mem_gender}</td>
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
				<th>주소</th>
				<td>${member.addr}</td>
			</tr>
		</table>

		<c:if test="${sessionScope.role == 'master'}">
			<input type="submit" value="회원 목록"
				onclick="location.href='memberlist.do'"
				class="btn btn-outline-secondary">

		</c:if>


		<div class="title">예약 상세내역</div>
		<table class="table restable">
			<c:if test="${empty  reslist"}">
				<tr>
					<td colspan="12">예약 정보가 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty reslist}">
				<c:forEach var="book" items="${reslist}">
					<tr>
						<th>예약 번호</th>
						<td>${book.bo_num}</td>
					</tr>
					<tr>
						<th>전시번호</th>
						<td>${book.ex_num}</td>
					</tr>
					<tr>
						<th>예약 날짜</th>
						<td><fmt:formatDate value="${book.bo_date}"
								pattern="YYYY/MM/dd HH:mm EEE요일" /></td>
					</tr>

					<tr>
						<th>예약 시간</th>
						<td>${book.bo_time }</td>
					</tr>

					<tr>
						<th>인원</th>
						<td>${book.bo_tiem_count1}</td>
						<td>${book.bo_tiem_count2}</td>
						<td>${book.bo_tiem_count3}</td>
						<td>${book.bo_tiem_count4}</td>
					</tr>

					<tr>
						<th>예약 상태</th>
						 <td>
						   <c:if test="${book.bo_state eq '3' }"><span style="color: #828282"></span>취소된 예매 </c:if>
						 </td>
					</tr>
					
				</c:forEach>
			</c:if>
		</table>
	</form>
</body>
</html>