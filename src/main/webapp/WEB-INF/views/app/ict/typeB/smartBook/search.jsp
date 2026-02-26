<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
	<title>B타입 스마트도서추천</title>
	<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
	<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/smartBook/css/type_b/common.css" rel="stylesheet" type="text/css " />
	<link href="/resources/ict/smartBook/css/type_b/searchList.css" rel="stylesheet" type="text/css " />
	<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
</head>
<body>
<script src="/resources/ict/smartBook/js/type_b/searchList.js" type="text/javascript"></script>
<link href="/resources/ict/smartBook/css/type_b/searchList.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function showSlide(vLoca, vCtrl, count){
		let bci = $('#info_fold'+ count);

		$(bci).load('searchDetail.do?vLoca='+vLoca+'&vCtrl='+vCtrl);
	}

	/*function showSlide(vLoca, vCtrl, count){
		fetch('/${homepage.context_path}/ict/smartBook/indexDetail.do?loca='+vLoca+'&ctrl='+vCtrl+'')
				.then(response => response.json())
				.then(data  => {
					if (data.dsItemDetail && data.dsItemDetail.length > 0) {
						loadTableData(data.dsItemDetail, count);
					} else {
						return;
					}
				})
				.catch(error => {
					return;
				});
	}

	function loadTableData(items, count) {
		const targetDiv = document.getElementById("info_fold"+count);

		let tableHTML = `
        <table class="own_book_info">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>소장위치</th>
                    <th>청구기호</th>
                    <th>등록정보</th>
                    <th>도서상태</th>
                </tr>
            </thead>
            <tbody>`;

		items.forEach((item, index) => {
			index += 1;
			tableHTML += `
            <tr>
                <td>`+ index +`</td>
                <td>`+item.SUB_LOCA_NAME+`</td>
                <td>`+item.CALL_NO+`</td>
                <td>`+item.ACSSON_NO+`</td>
                <td>`+item.BOOK_STATE+`</td>
            </tr>`;
		});

		tableHTML += `</tbody></table>`;

		targetDiv.innerHTML = tableHTML;
	}*/
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
	<div class="container search_wrap">
		<div class="header">
			<p class="sm_header_txt">book search</p>
			<h1 class="header_txt">도서검색</h1>
		</div>
		<div class="search_ment">
			<c:if test="${result.code eq '0000'}">
				<span>검색어&nbsp;<span class="search_ment_key bold">‘${fn:escapeXml(librarySearch.search_text)}’</span>&nbsp;에 대해 총&nbsp;<span class="search_ment_val bold">${fn:escapeXml(result.totalCnt)}건&nbsp;</span>검색되었습니다.
			</span>
			</c:if>

			<c:set var="showSmain" value="${(librarySearch.search_text ne null and librarySearch.search_text ne '') or (librarySearch.search_text eq null and librarySearch.search_type eq 'DETAIL')}"></c:set>
		</div>
		<div class="pager_wrap">
			<div class="search_wrapper overflow-y">
				<c:if test="${fn:length(result.dsResult) < 1}">
					<div class="no_content">
						<div class="no_wrapper">
						<img src="/resources/ict/common/img/Astronaut.gif" alt="">
						<h3>검색결과가 없어요</h3>
						<p>다른 검색어로 다시 시도해보시는 건 어떨까요?</p>
						</div>
					</div>
				</c:if>

				<c:forEach items="${result.dsResult}" var="i" varStatus="status">
				<div class="mylist mylist list_01">
					<div class="list_wrapper">
						<c:choose>
							<c:when test="${IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
								<img class="mybook_img" src="/resources/ict/smartBook/img/common/noimg.png" alt="noImage" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');"/>
							</c:when>
							<c:otherwise>
								<img class="mybook_img" src="${fn:escapeXml(i.IMAGE_URL)}" alt="${fn:escapeXml(i.DISP02)}" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';"/>
							</c:otherwise>
						</c:choose>
						<div class="mylist_wrap">
							<div class="mylist_txt" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');">
								<div class="title_info_0">${fn:escapeXml(i.DISP01)}</div>
								<div class="title_info_1">
									<div class="list_writer list_large">
										<div class="writer_name list_sm_tit">저자명</div>
										<div class="writer_name_intro list_sm_inner">
											<c:set var="DISP02" value="${fn:replace(i.DISP02, '[32703m', '')}"></c:set>
											<c:set var="DISP02" value="${fn:replace(i.DISP02, '[32723m', '')}"></c:set>
											${DISP02}
										</div>
									</div>

									<div class="list_when list_large">
										<div class="list_year list_sm_tit">발행처</div>
										<div class="list_year_number list_sm_inner">
											${fn:escapeXml(i.DISP03)}
										</div>
									</div>

									<div class="realease_info list_large">
										<div class="realease_place list_sm_tit">발행년도</div>
										<div class="realease_name list_sm_inner">
											${fn:escapeXml(i.DISP06)}
										</div>
									</div>
									<div class="list_isbn list_large list_right">
										<div class="tit_isbn list_sm_tit">ISBN</div>
										<div class="list_isbn_number list_sm_inner">
											${fn:escapeXml(i.DISP08)}
										</div>
									</div>
								</div>
							</div>
							<a href="javascript:void(0);" class="list_btn" id="listdiv_${status.count}" onclick="showSlide('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}', '${status.count}')">
								<div class="list_frame_line">
									<div class="info_own">소장정보</div>
								</div>
							</a>
						</div>
					</div>
					<div class="info_fold listdiv_${status.count}" id="info_fold${status.count}">

					</div>
				</div>
				</c:forEach>
			</div>
			<c:if test="${fn:length(result.dsResult) > 0}">
			<div id="pagination" class="pagination">
				<c:if test="${paging.firstPageNum > 0}">
					<a href="" class="first" keyValue="${paging.firstPageNum}"><img src="/resources/ict/smartBook/img/common/arr_double.svg"/></a>
				</c:if>
				<c:if test="${paging.prevPageNum > 0}">
					<a href="" class="prev" keyValue="${paging.prevPageNum}"><img src="/resources/ict/smartBook/img/common/arr_single.svg"/></a>
				</c:if>
				<c:forEach var="i" varStatus="status" begin="${paging.startPageNum}" end="${paging.endPageNum}">
					<c:choose>
						<c:when test="${i eq paging.viewPage}">
							<a id="${i}" href="" keyValue="${i}" <c:if test="${paging.viewPage eq i}">class="active"</c:if> >${i}</a>
						</c:when>
						<c:otherwise>
							<a id="${i}" href="" keyValue="${i}" <c:if test="${paging.viewPage eq i}">class="active"</c:if>>${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.nextPageNum > 0}">
					<a href="" class="next flip-horizontal" keyValue="${paging.nextPageNum}"><img src="/resources/ict/smartBook/img/common/arr_single.svg" alt="" /></a>
				</c:if>

				<c:if test="${paging.totalPageCount ne paging.lastPageNum}">
					<a href="" class="last flip-horizontal" keyValue="${paging.totalPageCount}"><img src="/resources/ict/smartBook/img/common/arr_double.svg" alt="" /></a>
				</c:if>
			</div>
			</c:if>
		</div>
	</div>
</form:form>

<script type="text/javascript">
	$(document).ready(function() {
		jQuery.ajaxSettings.traditional = true;

		$('div#pagination a').on('click', function(e) {
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

<jsp:include page="/WEB-INF/views/app/ict/typeB/smartBook/userNav.jsp"/>

</body>
</html>