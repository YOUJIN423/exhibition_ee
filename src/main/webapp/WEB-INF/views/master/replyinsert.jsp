<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/commonConfig.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${replyResult == 1}">
	<script>
		alert("답변이 완료되었습니다.");
		location.href = "qnalist.do?page=${page}";
	</script>
	
</c:if>
</body>
</html>