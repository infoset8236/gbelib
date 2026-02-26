<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${!sessionScope.member.login}">
<script>
	alert('로그인 후 이용 가능합니다.');
	location.href = '//www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=8';
</script>
</c:when>
<c:otherwise>
<script>
	alert('로그인 완료.');
</script>

</c:otherwise>
</c:choose>
