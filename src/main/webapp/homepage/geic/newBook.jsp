<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(function() {
	$('a.goDetail').on('click', function(e) {
		e.preventDefault();
		$('form#detailForm input#vLoca').val($(this).attr('vLoca'));
		$('form#detailForm input#vCtrl').val($(this).attr('vCtrl'));
		$('form#detailForm input#vImg').val($(this).attr('vImg'));
		$('form#detailForm').submit();
	});
	
	$(window).resize(function() {
		$('.grid4 li img').width($('.grid4 li').eq(0).width() * 1);           
   		$('.grid4 li img').height($('.grid4 img').eq(0).width() * 1.2);
   	});
   	$(window).trigger('resize');
});
</script>
<form id="detailForm" action="/${homepage.context_path}/intro/search/detail.do" method="get">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<input id="vLoca" name="vLoca" type="hidden" value="${newBookList.dsNewBookList[0].LOCA}">
	<input id="vCtrl" name="vCtrl" type="hidden" value="${newBookList.dsNewBookList[0].CTRLNO}">
	<input id="vImg" name="vImg" type="hidden" value="">
	<input id="detailMenuIdx" name="menu_idx" type="hidden" value="9">
</form>
<ul>
	<c:forEach var="i" begin="0" end="4">
		<li class="eventItem" id="newBookImg">
			<a href="" class="goDetail" vLoca="${newBookList.dsNewBookList[i].LOCA}" vCtrl="${newBookList.dsNewBookList[i].CTRLNO}"  vImg="${newBookList.dsNewBookList[i].COVER_SMALLURL}">
			<span class="thumb">
				<span class="noImg">
					<img src="${newBookList.dsNewBookList[i].COVER_SMALLURL ne '' ? newBookList.dsNewBookList[i].COVER_SMALLURL : '/resources/homepage/geic/img/noimg2.png' }" alt="${newBookList.dsNewBookList[i].TITLE}"/>
				</span>
			</span>
			<span class="entry">
				<span>
					<c:choose>
						<c:when test="${fn:length(newBookList.dsNewBookList[i].TITLE) > 20}">
							<b>${fn:substring(newBookList.dsNewBookList[i].TITLE, 0, 20)}...</b>
						</c:when>
						<c:otherwise>
							<b>${newBookList.dsNewBookList[i].TITLE }</b>
						</c:otherwise>
					</c:choose>
				</span>
				<span><em class="p1">저자: ${newBookList.dsNewBookList[i].AUTHOR}</em></span>
				<span><em class="p2">출판사: ${newBookList.dsNewBookList[i].PUBLER}</em></span>
			</span>
		</li>
	</c:forEach>
</ul>