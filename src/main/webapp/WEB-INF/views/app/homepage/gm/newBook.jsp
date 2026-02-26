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
<div>
	<a class="goDetail" href="">
		<img src="${newBookList.dsNewBookList[0].COVER_SMALLURL ne '' ? newBookList.dsNewBookList[0].COVER_SMALLURL : '/resources/homepage/gm/img/noimg1.png' }" alt="${newBookList.dsNewBookList[0].TITLE}"/>
		<span>
			<b>${newBookList.dsNewBookList[0].TITLE}</b>
			<i>${newBookList.dsNewBookList[0].AUTHOR}</i>
			<i>${newBookList.dsNewBookList[0].PUBLER} / ${newBookList.dsNewBookList[0].PUBLER_YEAR}</i>
			<i>${newBookList.dsNewBookList[0].LOCA_NAME}</i>
			<em>${newBookList.dsNewBookList[0].CALL_NO}</em>
		</span>
	</a>
</div>
<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12" class="more">+ 전체보기</a>

