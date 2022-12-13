<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   
    
<c:if test="${result == 1 }">
	<script>
		alert("글작성 성공");
		location.href="<%=request.getContextPath()%>/master/master_notice.do";	
	</script>
</c:if>

<c:if test="${result != 1 }">
	<script>
		alert("글작성 실패");
		history.go(-1);
	</script>
</c:if>