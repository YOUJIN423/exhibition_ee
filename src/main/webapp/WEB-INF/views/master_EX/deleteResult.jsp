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

<c:if test="${result ==1}">
	<script>
		alert("삭제 성공");
//		location.href="boardlist.do?page=${page}";		          
		location.href="exhibitionlist.do?page=${page}";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("삭제 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>