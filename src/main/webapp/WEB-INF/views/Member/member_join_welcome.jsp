<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<c:if test="${result == 1}">
	<script>
		alert("회원 가입을 축하합니다.")
		location.href = "main_index.do";  
	</script>
</c:if>

<c:if test="${reault != 1}">
	<script>
		alert("회원 가입에 실패했습니다. /n 다시 시도해주세요.")
		location.href = "member_join_agreeform.do"; 
	</script>
</c:if>