<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String sym = request.getParameter("sym") == null ? "" : request.getParameter("sym");
	pageContext.setAttribute("sym", sym);
%>
<script>
$(document).ready(function(e) {
	$('select#library_code${sym}').select2();
});
</script>
<form:select class="selectmenu-search" style="width:200px" id="library_code${sym}" path="library_code">
	<option value="">도서관 선택</option>
	<c:forEach var="i" varStatus="status" items="${homepageList}">
		<c:choose>
			<c:when test="${i.homepage_code eq '00147020,00147006'}">
				<option value="00147020" <c:if test="${obj.library_code eq '00147020'}">selected="selected"</c:if>>${i.homepage_name}</option>
			</c:when>
			<c:otherwise>
				<option value="${i.homepage_code}" <c:if test="${i.homepage_code eq obj.library_code }">selected="selected"</c:if>>${i.homepage_name}</option>
			</c:otherwise>
		</c:choose>

	</c:forEach>
</form:select>
