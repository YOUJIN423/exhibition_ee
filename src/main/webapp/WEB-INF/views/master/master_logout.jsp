<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>   

<script>
  alert("로그아웃 되었습니다.");
  location.href="<%=request.getContextPath() %>/master/master_index.do";
</script>