<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function() {
	$('div.like_book_1 ul').bxSlider({
		auto:true,
		autoControls:true,
		autoHover:true,
		autoReload:true,
		moveSlides:1		
	});

	$('a.goDetail').on('click', function(e) {
		e.preventDefault();
		$('form#detailForm #vLoca').val($(this).attr('keyValue1'));
		$('form#detailForm #vCtrl').val($(this).attr('keyValue2'));
		$('form#detailForm').submit();
	});
	
		
});
</script>
<form id="detailForm" action="/${homepage.context_path}/intro/search/detail.do" method="get">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<input id="vLoca" name="vLoca" type="hidden" value="">
	<input id="vCtrl" name="vCtrl" type="hidden" value="">
	<input id="vImg" name="vImg" type="hidden" value="">
	<input id="detailMenuIdx" name="menu_idx" type="hidden" value="12">
</form>
<ul>
	<c:forEach var="i" items="${newBookList.dsNewBookList}" end="2">
		<li>
			<a class="goDetail" href="" keyValue1="${i.LOCA}" keyValue2="${i.CTRLNO}">
			<img src="${i.COVER_SMALLURL ne '' ? i.COVER_SMALLURL : '/resources/homepage/cs/img/noimg1.png' }" alt="${i.TITLE}" style="width: 87px; height: 115px"/>
			<span> 
			<b>${i.TITLE}</b>
				<div style="padding-top: 5px;"> 
					<b style="margin-right: 6px; float:left;">저자</b>${i.AUTHOR}<br/>
					<b style="margin-right: 6px; float:left;">출판사</b>${i.PUBLER}<br/>
					<b style="margin-right: 6px; float:left;">출판년도</b>${i.PUBLER_YEAR}<br/>
					<b style="margin-right: 6px; float:left;">청구기호</b>${i.CALL_NO}
				</div>
			</span>
			</a>
		</li>
	</c:forEach>
</ul>