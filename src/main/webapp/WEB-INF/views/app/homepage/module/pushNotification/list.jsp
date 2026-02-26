<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/homepage/app/css/sub_layout.css"/>
<style>
input[type=checkbox].css-checkbox{
	visibility:hidden;
	position:absolute;
}

.css-label {
	position:absolute;right:18px;top:40px;
	width:36px;height:36px;
	background-image:url(/resources/homepage/app/img/check_off.png);
	background-repeat: no-repeat;
}

input[type=checkbox].css-checkbox:checked + label.css-label {
	width:36px;height:36px;
	background-image:url(/resources/homepage/app/img/check_on.png);
	background-repeat: no-repeat;
}
</style>
<script>
$(document).ready(function() {
	$('#check_all').on('click', function(e) {
		e.preventDefault();
		$('input.css-checkbox[type=checkbox]').prop('checked', true);
	});
	
	$('#delete_btn').on('click', function(e) {
		e.preventDefault();
		if($('input.css-checkbox[type=checkbox]:checked').length > 0) {
			doAjaxPost($('#pushNotification'), '#notification_list')
		}
	});
});
</script>
<form:form modelAttribute="pushNotification" action="delete.do">
<div class="alarm_list">
	<ul>
		<c:choose>
		<c:when test="${fn:length(pushNotificationList) eq 0}">
		<li>
			<p class="book_status">알림이 없습니다.</p>
			<p class="book_title"></p>
			<p class="date"></p>
		</li>
		</c:when>
		<c:otherwise>
		<c:forEach var="i" items="${pushNotificationList}" varStatus="status">
		<li>
			<p class="book_status">${i.title}</p>
			<p class="book_title">${i.body}</p>
			<p class="date">${i.dttm}</p>
			
			<input id="checkbox_${status.index}" type="checkbox" name="idx_arr" class="css-checkbox" value="${i.idx}">
    		<label for="checkbox_${status.index}" class="css-label"></label>
		</li>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</ul>

	<c:if test="${fn:length(pushNotificationList) > 0}">
	<div class="btn-section">
		<a href="" class="btn" id="check_all">전체선택</a>
		<a href="" class="btn btn01" id="delete_btn">삭제</a>
	</div>
	</c:if>
</div>
</form:form>