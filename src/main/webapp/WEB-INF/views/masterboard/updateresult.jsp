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

<c:if test="${result == 1}">
	<script>
		alert("글 수정 성공");
//		location.href="boardlist.do?page=${page}";		          
		location.href="<%=request.getContextPath()%>/master/master_boardcontent.do?board_num=${board.board_num}&page=${page}" ; // 상세 페이지
	</script>
</c:if>

<c:if test="${result > 0}">
	<script>
		alert("수정 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>