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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			location.href = "<%=request.getContextPath()%>/book/payForm.do?ex_num=${ex_num}&bo_num=${bo_num}";
		</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("예매에 실패하였습니다. 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>