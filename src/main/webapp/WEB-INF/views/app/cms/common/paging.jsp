<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String formId = request.getParameter("formId");
	String pagingUrl = request.getParameter("pagingUrl")==null?"index.do":request.getParameter("pagingUrl");
%>
<form:hidden path="viewPage"/>
<div id="cms_paging" class="dataTables_paginate">
<c:if test="${paging.firstPageNum > 0}">
	<a href="" class="paginate_button previous" keyValue="${paging.firstPageNum}" style="background-color: transparent; padding: 0;">
        <img src="/resources/cms/img/main/icon_line_left.svg" alt="">
    </a>
</c:if>
<c:if test="${paging.prevPageNum > 0}">
	<a href="" class="paginate_button previous" keyValue="${paging.prevPageNum}" style="background-color: transparent; padding: 0;">
        <img src="/resources/cms/img/main/prev.svg" alt="">
    </a>
</c:if>	
<c:forEach var="i" varStatus="status" begin="${paging.startPageNum}" end="${paging.endPageNum}">
<c:choose>
<c:when test="${i eq paging.viewPage}">	
	<a href="" class="paginate_button current" keyValue="${i}">${i}</a>
</c:when>
<c:otherwise>
	<a href="" class="paginate_button" keyValue="${i}">${i}</a>
</c:otherwise>
</c:choose>
</c:forEach>
<c:if test="${paging.nextPageNum > 0}">
	<a href="" class="paginate_button next" keyValue="${paging.nextPageNum}" style="background-color: transparent; padding: 0;">
        <img src="/resources/cms/img/main/next.svg" alt="">
    </a>
</c:if>
<c:if test="${paging.totalPageCount ne paging.lastPageNum}" >
	<a href="" class="paginate_button next" keyValue="${paging.totalPageCount}" style="background-color: transparent; padding: 0;">
        <img src="/resources/cms/img/main/icon_line_right.svg" alt="">
    </a>
</c:if>
</div>


<script type="text/javascript">
$(document).ready(function() {
	$('div#cms_paging a').on('click', function(e) {
		$('#viewPage').attr('value', $(this).attr('keyValue'));
		var param = $('<%=formId%>').serialize();
		doGetLoad('<%=pagingUrl%>', param);
		e.preventDefault();
	});
});
</script>