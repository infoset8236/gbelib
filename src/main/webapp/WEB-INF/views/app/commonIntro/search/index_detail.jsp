<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	Date todayNow = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	String todays = sf.format(todayNow);
%>
<c:set var="todayCheck" value="<%=todays %>" />

<script type="text/javascript">
$(function() {
	$('a.resve-req').on('click', function(e) {
		e.preventDefault();
        $('#resveReqForm #menu_idx').val(new URLSearchParams(window.location.search).get('menu_idx'));
		if (!confirm('예약 신청 하시겠습니까?')) {
			return false;
		}
		$('#resveReqForm #editMode').val('ADD');
		$('#resveReqForm #vLoca').val($(this).attr('vLoca'));
		$('#resveReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#resveReqForm #vSubLoca').val($(this).attr('vSubLoca'));
		$('#resveReqForm #vCtrl').val($(this).attr('vCtrl'));
	
		if ( doAjaxPost($('#resveReqForm')) ) {
	
		}
	});
	
	$('a.app-resve-req').on('click', function(e) {
		e.preventDefault();
		var checkVal = $(this).attr('vLoca')+'^'+$(this).attr('vAccNo');
		window.HybridApp.sendMessage(checkVal);
/*
		if (!confirm('예약 신청 하시겠습니까?')) {
			return false;
		}
		$('#resveReqForm #editMode').val('ADD');
		$('#resveReqForm #vLoca').val($(this).attr('vLoca'));
		$('#resveReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#resveReqForm #vSubLoca').val($(this).attr('vSubLoca'));
		$('#resveReqForm #vCtrl').val($(this).attr('vCtrl'));
*/
	});

	$('a.pouch-req').on('click', function(e) {
		e.preventDefault();
		if (!confirm('야간예약대출 신청 하시겠습니까?')) {
			return false;
		}
		
		$('#pouchReqForm #editMode').val('ADD');
		$('#pouchReqForm #vLoca').val($(this).attr('vLoca'));
		$('#pouchReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#pouchReqForm #vSubLoca').val($(this).attr('vSubLoca'));

		if ( doAjaxPost($('#pouchReqForm')) ) {

		}
	});
	
	$('a.pouch-req-sj').on('click', function(e) {
		e.preventDefault();
		if (!confirm('밤새대출 신청 하시겠습니까?')) {
			return false;
		}
		
		$('#pouchReqForm #editMode').val('ADD');
		$('#pouchReqForm #vLoca').val($(this).attr('vLoca'));
		$('#pouchReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#pouchReqForm #vSubLoca').val($(this).attr('vSubLoca'));

		if ( doAjaxPost($('#pouchReqForm')) ) {

		}
	});
	
	$('a.pouch-req-yjpg').on('click', function(e) {
		e.preventDefault();
		if (!confirm('비치도서예약 신청 하시겠습니까?')) {
			return false;
		}
		
		$('#pouchReqForm #editMode').val('ADD');
		$('#pouchReqForm #vLoca').val($(this).attr('vLoca'));
		$('#pouchReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#pouchReqForm #vSubLoca').val($(this).attr('vSubLoca'));

		if ( doAjaxPost($('#pouchReqForm')) ) {

		}
	});
	
	$('a.pouch-muin-req').on('click', function(e) {
		e.preventDefault();
		if (!confirm('무인예약대출 신청 하시겠습니까?')) {
			return false;
		}
		
		$('#pouchReqForm #editMode').val('ADD');
		$('#pouchReqForm #vLoca').val($(this).attr('vLoca'));
		$('#pouchReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#pouchReqForm #vSubLoca').val($(this).attr('vSubLoca'));

		if ( doAjaxPost($('#pouchReqForm')) ) {

		}
	});

	$('a.pouch-req-geic').on('click', function(e) {
		e.preventDefault();
        $('#pouchReqForm #menu_idx').val(new URLSearchParams(window.location.search).get('menu_idx'));
		if (!confirm('비치도서예약 신청 하시겠습니까?\n* 대출 가능 권수가 부족하면 신청 후 대출이 불가할 수 있습니다.')) {
			return false;
		}

		$('#pouchReqForm #editMode').val('ADD');
		$('#pouchReqForm #vLoca').val($(this).attr('vLoca'));
		$('#pouchReqForm #vAccNo').val($(this).attr('vAccNo'));
		$('#pouchReqForm #vSubLoca').val($(this).attr('vSubLoca'));

		if ( doAjaxPost($('#pouchReqForm')) ) {

		}
	});

	$('a#delivery_save_btn').on('click', function (e) {
		e.preventDefault();
		if(!confirm('택배대출 신청 하시겠습니까?')) {
			return false;
		}
		$('#delivery #book_title').val($(this).attr('book_title'));
		$('#delivery #book_loca_name').val($(this).attr('book_loca_name'));
		$('#delivery #book_call_no').val($(this).attr('book_call_no'));
		$('#delivery #book_acsson_no').val($(this).attr('book_acsson_no'));
		document.getElementById('delivery').submit();
	});

    $('.driveThru-req').on('click', function (e) {
        e.preventDefault();
        $('#driveThruReqForm #menu_idx').val(new URLSearchParams(window.location.search).get('menu_idx'));
        if(!confirm('당일픽업예약 신청 하시겠습니까?\n* 대출 가능 권수가 부족하면 신청 후 대출이 불가할 수 있습니다.')) {
            return false;
        }
        $('#driveThruReqForm #editMode').val('ADD');
        $('#driveThruReqForm #vLoca').val($(this).attr('vLoca'));
        $('#driveThruReqForm #vAccNo').val($(this).attr('vAccNo'));
        $('#driveThruReqForm #vSubLoca').val($(this).attr('vSubLoca'));

		var baseUrl = window.location.origin;
        if ( doAjaxPost($('#driveThruReqForm')) ) {
			location.href= baseUrl + '/geic/intro/search/driveThru/index.do?menu_idx=319';
        }
    });
});
</script>
<style>
	.resve-req {display: block; margin-bottom: 6px}
	.driveThru-req {display:block;background:#f1b913;border:1px solid #f1b913;border-radius:2px;padding:3px 8px;font-size:88%;font-weight:bold;line-height:110%;color:#232323;margin-top: 6px;}
	.pouch-req, .pouch-req-sj, .pouch-req-yjpg, .pouch-req-geic {display:block;background:#f6fafb;border:1px solid #beccd9;border-radius:2px;padding:3px 8px;font-size:88%;font-weight:bold;line-height:110%;color:#1b5e89;}
</style>
<form:form id="resveReqForm" modelAttribute="librarySearch" action="/${homepage.context_path}/intro/search/resve/save.do">
	<form:hidden path="editMode" htmlEscape="true"/>
	<form:hidden path="vLoca" htmlEscape="true"/>
	<form:hidden path="vAccNo" htmlEscape="true"/>
	<form:hidden path="vSubLoca" htmlEscape="true"/>
	<form:hidden path="vCtrl" htmlEscape="true"/>
	<form:hidden path="menu_idx" htmlEscape="true"/>
</form:form>

<form:form id="pouchReqForm" modelAttribute="librarySearch" action="/${homepage.context_path}/intro/search/pouch/save.do">
	<form:hidden path="editMode" htmlEscape="true"/>
	<form:hidden path="vLoca" htmlEscape="true"/>
	<form:hidden path="vAccNo" htmlEscape="true"/>
	<form:hidden path="vSubLoca" htmlEscape="true"/>
	<form:hidden path="menu_idx" htmlEscape="true"/>
</form:form>

<form:form modelAttribute="delivery" action="/${homepage.context_path}/intro/search/delivery/edit.do?menu_idx=243">
	<form:hidden path="book_title" htmlEscape="true"/>
	<form:hidden path="book_loca_name" htmlEscape="true"/>
	<form:hidden path="book_call_no" htmlEscape="true"/>
	<form:hidden path="book_acsson_no" htmlEscape="true"/>
</form:form>

<form:form id="driveThruReqForm" modelAttribute="librarySearch" action="/${homepage.context_path}/intro/search/driveThru/save.do">
    <form:hidden path="editMode" htmlEscape="true"/>
    <form:hidden path="vLoca" htmlEscape="true"/>
    <form:hidden path="vAccNo" htmlEscape="true"/>
    <form:hidden path="vSubLoca" htmlEscape="true"/>
    <form:hidden path="vCtrl" htmlEscape="true"/>
    <form:hidden path="menu_idx" htmlEscape="true"/>
</form:form>
<table>
<caption>도서의 소장위치, 청구기호, 등록정보, 상태 등을 나타내는 표</caption>
	<thead>
		<tr>
			<th>No.</th>
			<c:if test="${librarySearch.vLoca ne '00000001'}">
			<th>소장위치</th>
			<th>서가명</th>
			</c:if>
			<th>청구기호</th>
			<th>등록정보</th>
			<th>상태</th>
			<c:choose>
				<c:when test="${homepage.context_path eq 'sj'}">
					<th>택배신청</th>
					<th>예약(예약가능인원)</th>
				</c:when>
				<c:otherwise>
					<th>예약(예약가능인원)</th>
				</c:otherwise>
			</c:choose>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${detail.dsItemDetail}" var="i" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<c:if test="${librarySearch.vLoca ne '00000001'}">
			<td class="txt-left">${fn:escapeXml(i.SUB_LOCA_NAME)}</td>
			<td class="txt-left">${fn:escapeXml(i.BOOKSH_NAME)}</td>
			</c:if>
			<td class="txt-left">${fn:escapeXml(i.LABEL_PLACE_NO_NAME)} ${fn:escapeXml(i.CALL_NO)}</td>
			<td>${fn:escapeXml(i.PRINT_ACSSON_NO)}</td>
			<td class="${i.LOAN_CHECK eq 'Y' ? 'y' : 'n'}">${fn:escapeXml(librarySearch.vLoca ne '00000001' ? i.DISPLAY_ITEM_STATUS : '대출가능')}</td>
			<c:if test="${homepage.context_path eq 'sj'}">
				<c:choose>
					<c:when test="${i.DISPLAY_ITEM_STATUS eq '대출가능' and fn:escapeXml(i.SUB_LOCA eq '00000001') and fn:contains(member.positn_name, '사랑의책배달') or i.DISPLAY_ITEM_STATUS eq '대출가능' and fn:escapeXml(i.SUB_LOCA eq '00000002') and fn:contains(member.positn_name, '사랑의책배달')}">
						<td><a href="" style="white-space: nowrap;" class="btn btn1" id="delivery_save_btn" book_title="${fn:escapeXml(i.TITLE)}" book_loca_name="${fn:escapeXml(i.LOCA_NAME)}" book_call_no="${fn:escapeXml(i.LABEL_PLACE_NO_NAME)} ${fn:escapeXml(i.CALL_NO)}" book_acsson_no="${fn:escapeXml(i.PRINT_ACSSON_NO)}"><i class="fa fa-pencil"></i><span>신청하기</span></a></td>
					</c:when>
					<c:otherwise>
                        <td style="white-space: nowrap">신청불가</td>
					</c:otherwise>
				</c:choose>
			</c:if>
			<td class="">
				<c:if test="${librarySearch.vLoca ne '00000001'}"><!-- vLoca : 소장처 코드 --> 
					<jsp:useBean id="toDay" class="java.util.Date"></jsp:useBean>
					<c:set var="startTime" value="09:00:00"></c:set>
					<c:set var="endTime" value="16:00:00"></c:set>
					<c:set var="endTime2" value="17:00:00"></c:set>
					<c:set var="endTime3" value="15:00:00"></c:set>
					<c:set var="endTime4" value="14:00:00"></c:set>
					<c:set var="endTime5" value="19:00:00"></c:set>
					<c:set var="endTime6" value="12:00:00"/>
					<fmt:parseDate var="dateStr1" value="${startTime}" pattern="HH:mm:ss"/>
					<fmt:parseDate var="dateStr2" value="${endTime}" pattern="HH:mm:ss"/>
					<fmt:parseDate var="dateStr4" value="${endTime2}" pattern="HH:mm:ss"/>
					<fmt:parseDate var="dateStr5" value="${endTime3}" pattern="HH:mm:ss"/>
					<fmt:parseDate var="dateStr6" value="${endTime4}" pattern="HH:mm:ss"/>
					<fmt:parseDate var="dateStr7" value="${endTime5}" pattern="HH:mm:ss"/>
                    <fmt:parseDate var="dateStr8" value="${endTime6}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="dateStr3" value="${toDay}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="startTime" value="${dateStr1}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="endTime" value="${dateStr2}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="endTime2" value="${dateStr4}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="endTime3" value="${dateStr5}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="endTime4" value="${dateStr6}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="endTime5" value="${dateStr7}" pattern="HH:mm:ss"/>
					<fmt:formatDate var="endTime6" value="${dateStr8}" pattern="HH:mm:ss"/>

					<c:choose>
					<c:when test="${homepage.context_path eq 'app'}">
						<c:choose>
							<c:when test="${i.LOCA eq '00147024'}">
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a class="app-resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										<!-- 예약불가(0) -->
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${i.LOCA eq '00147031'}"> <!-- 영덕도서관-->
								<c:choose>
									<c:when test="${20240902235900 <= todayCheck && todayCheck <= 20241015235900}">
									</c:when>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a class="app-resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:when>
                            <c:when test="${i.LOCA eq '00147046'}">
								<c:choose>
									<c:when test="${todayCheck >= 20250915000000 and todayCheck <= 20251215115959}">

									</c:when>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<a class="app-resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">
									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
                            </c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<a class="app-resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">
									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${i.LOCA eq '00147024'}">
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">
									</c:when>
									<c:otherwise>
										<!-- 예약불가(0) -->
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${i.LOCA eq '00147031'}"> <!-- 영덕도서관-->
								<c:choose>
									<c:when test="${20240902235900 <= todayCheck && todayCheck <= 20241015235900}">
									</c:when>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${i.LOCA eq '00147032'}">
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.RESERVATION_COUNT)} / ${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${i.LOCA eq '00147008'}">
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a style="padding: 5px 6px;" class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${i.LOCA eq '00147007'}">
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a style="padding: 5px 6px;" class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:when>
                            <c:when test="${homepage.context_path eq 'geic'}">
                                <c:choose>
                                    <c:when test="${todayCheck >= 20250915000000 and todayCheck <= 20251215115959}">

                                    </c:when>
                                    <c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
                                        <c:set var="is_reservable" value="true"/>
                                        <a class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
                                    </c:when>
                                    <c:when test="${is_reservable}">

                                    </c:when>
                                    <c:otherwise>
                                        예약불가(0)
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${i.RESVE_CHECK eq 'Y'}"><!-- RESVE_CHECK : 예약가능 여부 -->
										<c:set var="is_reservable" value="true"/>
										<a class="resve-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vCtrl="${i.CTRLNO}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}"><i class="fa fa-calendar-check-o"></i>예약하기(${fn:escapeXml(i.CAN_RESERVE_COUNT)})</a>
									</c:when>
									<c:when test="${is_reservable}">

									</c:when>
									<c:otherwise>
										예약불가(0)
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						
						<c:if test="${not isTodayClosed and i.LOCA eq '00147021' and i.LOAN_FLAG eq '0001'}">
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime}">
								<a class="pouch-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">야간대출<br />신청하기</a>
							</c:if>
						</c:if>
						<c:if test="${not isTodayClosed and homepage.homepage_code eq member.loca and member.login and i.LOCA eq '00147023' and fn:escapeXml(i.SUB_LOCA_NAME) eq '종합자료실' and i.LOAN_FLAG eq '0001'}">
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime}">
							<br/>
								<%
									org.joda.time.DateTime now = new org.joda.time.DateTime();
									int dayOfWeek = now.getDayOfWeek(); /* dayOfWeek 월 1 화 2 수 3 목 4 금 5 토 6 일 7 */
									//int hour = now.getHourOfDay();
									// 여기서 2025-06-04 날짜 비교
									org.joda.time.format.DateTimeFormatter formatter = org.joda.time.format.DateTimeFormat.forPattern("yyyy-MM-dd");
									org.joda.time.DateTime cutoffDate = formatter.parseDateTime("2025-06-04");
								// 6/4 일 이후 비활성화
								if (now.isBefore(cutoffDate)) {
									if(dayOfWeek == 1 || dayOfWeek == 6 || dayOfWeek == 7)
									{
								%>
								<%
									}
								else
									{
								%>
								<a class="pouch-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">야간대출<br />신청하기</a>
								<%
									}
								}
								%>

							</c:if>
						</c:if>
						<c:if test="${not isTodayClosed and homepage.homepage_code eq member.loca and member.login and i.LOCA eq '00147008' and i.LOAN_FLAG eq '0001'}">
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime3}">
							<br/>
							<a class="pouch-req-sj" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">밤새대출<br />신청하기</a>
							</c:if>
						</c:if>
						<c:if test="${not isTodayClosed and homepage.homepage_code eq member.loca and member.login and i.LOCA eq '00147020' and i.LOAN_FLAG eq '0001'}">
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime2}">
							<br/>
							<a class="pouch-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">야간대출<br />신청하기</a>
							</c:if>
						</c:if>
						
						<c:if test="${not isTodayClosed and homepage.homepage_code eq member.loca and member.login and i.LOCA eq '00147024' and i.LOAN_FLAG eq '0001'}">
							<%
							org.joda.time.DateTime now = new org.joda.time.DateTime();
							int dayOfWeek = now.getDayOfWeek(); /* dayOfWeek 월 1 화 2 수 3 목 4 금 5 토 6 일 7 */

							if( dayOfWeek == 1 || dayOfWeek == 7 )
							{
							%>
							<%
							}
							else if( dayOfWeek == 2 || dayOfWeek == 3 ||dayOfWeek == 4 ||dayOfWeek == 5)
							{
							%>
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime}">
								<!-- <a class="pouch-req-yjpg" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">비치도서예약</a> -->
							</c:if>
							<%
							}
							else if( dayOfWeek == 6 )
							{
							%>
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime4}">
								<!-- <a class="pouch-req-yjpg" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">비치도서예약</a> -->
							</c:if>
							<%
							}
							else
							{
							%>
							<%
							}
							%>
						</c:if>

						<c:if test="${not isTodayClosed and i.LOCA eq '00147046' and i.LOAN_FLAG eq '0001'}">
							<%
							org.joda.time.DateTime now = new org.joda.time.DateTime();
							int dayOfWeek = now.getDayOfWeek(); /* dayOfWeek 월 1 화 2 수 3 목 4 금 5 토 6 일 7 */

							if( dayOfWeek == 1 || dayOfWeek == 6 ||  dayOfWeek == 7 )
							{
							%>
							<%
							}
							else if( dayOfWeek == 2 || dayOfWeek == 3 ||dayOfWeek == 4 ||dayOfWeek == 5 )
							{
							%>
							<c:if test="${startTime <= dateStr3 and dateStr3 <= endTime and i.SUB_LOCA_NAME eq '종합자료실'}">
								<c:if test="${fn:escapeXml(i.LABEL_PLACE_NO_NAME) eq '' || fn:escapeXml(i.LABEL_PLACE_NO_NAME) eq null || fn:escapeXml(i.LABEL_PLACE_NO_NAME) eq 'null'}">
								<a class="pouch-req-geic" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">야간대출예약</a>
								</c:if>
							</c:if>
							<%
							}
							%>
						</c:if>
						<c:if test="${homepage.context_path eq 'geic' and todayCheck >= 20250915000000 and todayCheck <= 20251215115959 and startTime <= dateStr3 and dateStr3 <= endTime6}">
                            <c:if test="${i.SUB_LOCA_NAME eq '종합자료실' or i.SUB_LOCA_NAME eq '어린이자료실'}">
								<%
									org.joda.time.DateTime now = new org.joda.time.DateTime();
									int dayOfWeek = now.getDayOfWeek(); /* dayOfWeek 월 1 화 2 수 3 목 4 금 5 토 6 일 7 */
									if (dayOfWeek == 6 || dayOfWeek == 7) {
								%>
								<% } else {
								%>
                                <a class="driveThru-req" vLoca="${fn:escapeXml(i.LOCA)}" vAccNo="${fn:escapeXml(i.ACSSON_NO)}" vSubLoca="${fn:escapeXml(i.SUB_LOCA)}">당일픽업예약</a>
                            	<%}%>
							</c:if>
						</c:if>
					</c:otherwise>
					</c:choose>
				</c:if>
			</td>
		</tr>
		<c:if test="${fn:length(detail.dsItemDetail) < 1 }">
		<tr>
			<td colspan="5">조회된 자료가 없습니다.</td>
		</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>
