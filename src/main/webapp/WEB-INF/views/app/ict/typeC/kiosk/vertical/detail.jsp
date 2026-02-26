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
		<link href="/resources/ict/kioskVertical/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/kioskVertical/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_c/script.js" type="text/javascript"></script>
		<title>Document</title>
	</head>
	<body>
	<div class="kiosk_book_information_container">
		<div class="kiosk_common_header_wrapper">
			<div class="kiosk_common_header_kr">도서정보</div>
			<div class="kiosk_common_header_en">BOOK INFORMATION</div>
		</div>
		<div class="kiosk_book_information_thumbnail_wrapper">
			<c:choose>
				<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
					<img src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
				</c:when>
				<c:otherwise>
					<img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
				</c:otherwise>
			</c:choose>
			<c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
			<div>대출<br />가능</div>
			</c:if>
		</div>
		<!--	책 타이틀		-->
		<div class="kiosk_book_information_thumbnail_title">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
		<!--	상세 정보		-->
		<div class="kiosk_book_information_thumbnail_info">
			<div class="kiosk_book_information_thumbnail_info_left">
				<div class="label"><span>저자명</span>${fn:substring(fn:escapeXml(detail.dsItemDetail[0].AUTHOR), 0, 11)}<c:if test="${fn:length(fn:escapeXml(detail.dsItemDetail[0].AUTHOR)) > 11}">...</c:if></div>
				<div class="label"><span>출판사</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</div>
				<div class="label"><span>발행년</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</div>
			</div>
			<div class="kiosk_book_information_thumbnail_info_right">
				<div class="label"><span>서가위치</span>${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</div>
				<div class="label"><span>청구기호</span>${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</div>
				<div class="label"><span>등록번호</span>${fn:escapeXml(detail.dsItemDetail[0].CTRLNO)}</div>
			</div>
		</div>
		<!--	팝업 trigger		-->
		<div class="kiosk_book_information_popup_trigger">소장도서 서가위치보기</div>
		<!--	팝업		-->
		<div class="kiosk_book_information_popup" style="display: none">
			<div class="popup_content">
				<div class="kiosk_book_information_popup_header">서가위치</div>
				<!--	이미지 데이터 바인딩 필요		-->
				<img alt="" class="kiosk_book_information_popup_img" src="/resources/ict/img/dummyFacility.svg" />
				<div class="kiosk_book_information_popup_action_wrapper">
					<div class="kiosk_book_information_popup_close">
						<div class="kiosk_book_information_popup_close_icon"></div>
						<div class="kiosk_book_information_popup_close_text">닫기</div>
					</div>
					<!--	인쇄		-->
					<div class="kiosk_book_information_popup_print">
						<div class="kiosk_book_information_popup_print_icon"></div>
						<div class="kiosk_book_information_popup_print_text">인쇄</div>
					</div>
				</div>
			</div>
		</div>
		<div class="kiosk_book_information_summary_title">책소개</div>
		<div class="kiosk_book_information_summary">
			${kakaoResult}
		</div>
		<div class="kiosk_book_information_swiper">
			<div class="swiper">
				<div class="swiper-wrapper">
					<!-- 슬라이드 아이템 -->

					<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
					<div class="swiper-slide">
						<div class="swiper-slide">
							<div class="swiper-item">
								<c:choose>
									<c:when test="${i.COVER_SMALLURL eq ''}">
										<img src="/resources/ict/common/img/noimg.png" />
									</c:when>
									<c:otherwise>
										<img src="${i.COVER_SMALLURL}" />
									</c:otherwise>
								</c:choose>
								<div>${i.TITLE}</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div class="navigation-wrapper">
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/userNav.jsp"/>
		</div>
	</body>
</html>