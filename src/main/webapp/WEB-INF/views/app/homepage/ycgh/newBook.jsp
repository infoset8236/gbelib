<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(function() {
	$('a.goDetail').on('click', function(e) {
		e.preventDefault();
		$('form#detailForm').submit();
	});
});
</script>
<form id="detailForm" action="/${homepage.context_path}/intro/search/detail.do" method="get">
	<input id="vLoca" name="vLoca" type="hidden" value="${newBookList.dsNewBookList[0].LOCA}">
	<input id="vCtrl" name="vCtrl" type="hidden" value="${newBookList.dsNewBookList[0].CTRLNO}">
	<input id="vImg" name="vImg" type="hidden" value="">
	<input id="detailMenuIdx" name="menu_idx" type="hidden" value="12">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
</form>
<div class="thumb">
<a href="" class="goDetail">
<img src="${newBookList.dsNewBookList[0].COVER_SMALLURL ne '' ? newBookList.dsNewBookList[0].COVER_SMALLURL : '/resources/homepage/gw/img/noimg2.png' }" alt="${newBookList.dsNewBookList[0].TITLE}" width="87px" height="106px"/>
</a>
</div>
<div class="snipet">
	<dl>
		<dt><a href="" class="goDetail">${newBookList.dsNewBookList[0].TITLE }</a></dt>
		<dd>
			<label>저자</label>
			<span>${newBookList.dsNewBookList[i].AUTHOR}</span>
		</dd>
		<dd>
			<label>출판사</label>
			<span>${newBookList.dsNewBookList[i].PUBLER}</span>
		</dd>
	</dl>
</div>


