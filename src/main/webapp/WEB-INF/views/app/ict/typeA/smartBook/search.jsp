<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
	<meta content="ie=edge" http-equiv="X-UA-Compatible" />
	<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/smartBook/css/type_a/styles.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
	<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
	<script src="/resources/ict/smartBook/js/type_a/script.js" type="text/javascript"></script>
	<title>스마트 도서 A 타입</title>
</head>
<body>

<script type="text/javascript">
	function showSlide(vLoca, vCtrl, count){
		let bci = $('#search_table'+ count);

		$(bci).load('searchDetail.do?vLoca='+vLoca+'&vCtrl='+vCtrl);
	}
</script>

<form:form modelAttribute="librarySearch" id="verDetailForm" action="detailVertical.do" method="post">
	<input type="hidden" id="vLoca" name="vLoca"/>
	<input type="hidden" id="vCtrl" name="vCtrl"/>
</form:form>

<form:form modelAttribute="librarySearch" id="horiDetailForm" action="detailHorizon.do" method="post">
	<input type="hidden" id="vLoca" name="vLoca"/>
	<input type="hidden" id="vCtrl" name="vCtrl"/>
</form:form>

<form:form modelAttribute="librarySearch" action="search.do" method="POST">
<form:hidden path="viewPage"/>
<form:hidden path="search_text"/>
<form:hidden path="search_type"/>

<div class="search_container">
	<div class="common_header_wrapper">
		<div class="common_header_kr">도서검색</div>
		<div class="common_header_en">BOOK SEARCH</div>
	</div>

	<c:if test="${fn:length(result.dsResult) < 1}">
		<div class="search_nodata_wrapper">
			<img alt="" src="/resources/ict/common/img/Astronaut.gif" />
			<div class="search_nodata_title">검색결과가 없어요</div>
			<div class="search_nodata_caption">다른 검색어로 다시 시도해보시는 건 어떨까요?</div>
			<div class="search_nodata_back" onclick="location.href='/${homepage.context_path}/ict/smartBook/main.do'">돌아가기</div>
		</div>
	</c:if>

	<c:if test="${result.code eq '0000'}">
		<div class="search_total">검색어 <span>‘${fn:escapeXml(librarySearch.search_text)}’</span> 에 대해 총 <span>${fn:escapeXml(result.totalCnt)}건</span> 검색되었습니다.</div>
	</c:if>

	<div class="search_scroll">
	  <c:forEach items="${result.dsResult}" var="i" varStatus="status">
		<div class="search-item_wrapper">
			
				<div class="search-item">
					<c:choose>
						<c:when test="${i.IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
							<img src="/resources/ict/common/img/noimg.png" alt="noImage" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');"/>
						</c:when>
						<c:otherwise>
							<img src="${fn:escapeXml(i.IMAGE_URL)}" alt="${fn:escapeXml(i.DISP02)}" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');"/>
						</c:otherwise>
					</c:choose>
					<div>
						<div class="search_book_title" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');">${fn:escapeXml(i.DISP01)}</div>
						<div class="search_book_writer">
							<c:set var="DISP02" value="${fn:replace(i.DISP02, '[32703m', '')}"></c:set>
							<c:set var="DISP02" value="${fn:replace(i.DISP02, '[32723m', '')}"></c:set>
							${DISP02}
						</div>
						<div class="search_book_year">${fn:escapeXml(i.DISP03)} • ${fn:escapeXml(i.DISP06)}</div>
						<div class="search_book_detail_wrapper">
							<div class="search_book_isbn"><span>ISBN</span>${fn:escapeXml(i.DISP08)}</div>
							<div class="search_action_wrapper">
								<div class="search_action_btn" onclick="showSlide('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}', '${status.count}')">
									<div class="search_action_btn_text">소장정보</div>
									<div class="search_action_btn_detail"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--TODO 슬라이드 부분 수정이 필요할것 같아요...-->
				<div class="search_table" id="search_table${status.count}">

				</div>
		</div>
		</c:forEach>
	</div>

	<div class="common_back_btn" onclick="location.href='/${homepage.context_path}/ict/smartBook/main.do'">
		<div class="common_back_btn_icon dark"></div>
		<div class="common_back_btn_text dark">이전</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

</div>
</form:form>

<script type="text/javascript">
	$(document).ready(function() {
		jQuery.ajaxSettings.traditional = true;

		$('#pagination a').on('click', function(e) {
			$('#viewPage').attr('value', parseInt($(this).attr('keyValue')));

			$('#librarySearch').submit();
			e.preventDefault();
		});
		$('body').scrollTop(0);
	});

	function goDetail(LOCA, CTRLNO) {
		const screenWidth = window.innerWidth;
		if (screenWidth === 3840) {
			$('#horiDetailForm #vLoca').val(LOCA);
			$('#horiDetailForm #vCtrl').val(CTRLNO);
			$('form#horiDetailForm').submit();
		} else if (screenWidth === 2160) {
			$('#verDetailForm #vLoca').val(LOCA);
			$('#verDetailForm #vCtrl').val(CTRLNO);
			$('form#verDetailForm').submit();
		} else if (screenWidth === 1920) {
			$('#horiDetailForm #vLoca').val(LOCA);
			$('#horiDetailForm #vCtrl').val(CTRLNO);
			$('form#horiDetailForm').submit();
		} else if (screenWidth === 1080) {
			$('#verDetailForm #vLoca').val(LOCA);
			$('#verDetailForm #vCtrl').val(CTRLNO);
			$('form#verDetailForm').submit();
		} else {
			$('#verDetailForm #vLoca').val(LOCA);
			$('#verDetailForm #vCtrl').val(CTRLNO);
			$('form#verDetailForm').submit();
		}
	}
</script>

</body>
</html>