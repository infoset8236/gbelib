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
		<title>도서정보</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/book_information.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/kioskVertical/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_a/info/book_information.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
	</head>
	<body>
	<div class="detail_wrap info">
		<div class="header">
			<p>Book information</p>
			<h1>도서정보</h1>
		</div>
		<div class="contents">
			<div class="main-slider binfo-slide swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="img-sec">
							<c:choose>
								<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
									<img src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
								</c:when>
								<c:otherwise>
									<img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
								</c:otherwise>
							</c:choose>
							<c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
								<span class="status-box"> 대출<br />가능 </span>
							</c:if>
						</div>
						<div class="title-sec">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
						<div class="bookinfo-sec">
							<ul>
								<li><span class="">저자명</span>${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</li>
								<li><span class="">소장위치</span> ${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</li>
								<li><span class="">출판사</span> ${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</li>
								<li><span class="">청구기호</span> ${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</li>
								<li><span class="">ISBN</span> ${fn:escapeXml(detail.dsItemDetail[0].ISBN)}</li>
								<li><span class="">등록번호</span> ${fn:escapeXml(detail.dsItemDetail[0].CTRLNO)}</li>
							</ul>
						</div>
						<div class="print-btn">
							<a class="print-btn-toggle" href="#">소장도서 <strong>서가위치보기</strong></a>
						</div>
						<div class="etcinfo-sec">
							<div class="inner-scroll">
								${kakaoResult}
							</div>
						</div>
					</div>

					<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
						<div class="swiper-slide">
							<div class="img-sec">
								<c:choose>
									<c:when test="${i.COVER_SMALLURL eq ''}">
										<img src="/resources/ict/common/img/noimg.png" />
									</c:when>
									<c:otherwise>
										<img src="${i.COVER_SMALLURL}" />
									</c:otherwise>
								</c:choose>
								<%--<span class="status-box red"> 대출<br />불가 </span>--%>
							</div>
							<div class="title-sec">${i.TITLE}</div>
							<div class="bookinfo-sec">
								<ul>
									<li><span class="">저자명</span> ${i.AUTHOR}</li>
									<li><span class="">소장위치</span> ${i.LOCA_NAME}</li>
									<li><span class="">출판사</span> ${i.PUBLER}</li>
									<li><span class="">청구기호</span> ${i.CALL_NO}</li>
									<li><span class="">ISBN</span> ${i.ISBN}</li>
									<li><span class="">등록번호</span> ${i.CTRLNO}</li>
								</ul>
							</div>
							<div class="print-btn">
								<a class="print-btn-toggle" href="#">소장도서 <strong>서가위치보기</strong></a>
							</div>
							<div class="etcinfo-sec">
								<div class="inner-scroll">
										${i.contentsDetail}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="background_cir"></div>
			<div class="detail-bookbest-list">
				<div class="thumbnail-slider swiper-container">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="thumb-image">
								<a href="#this">
									<c:choose>
										<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
											<img src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
										</c:when>
										<c:otherwise>
											<img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="cont">
								<p class="tit">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</p>
								<span class="tit_sub">${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</span>
							</div>
						</div>

						<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
							<div class="swiper-slide">
								<div class="thumb-image">
									<a href="#this">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
									</a>
								</div>
								<div class="cont">
									<p class="tit">${i.TITLE}</p>
									<span class="tit_sub">${i.AUTHOR}</span>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		<div class="background_rec"></div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/nav.jsp"/>

	<div class="popup-overlay" id="popup" style="display: none">
		<div class="popup-content">
			<div class="popup-wrapper">
				<div class="popup-title">서가위치</div>
				<img alt="" class="map" src="/resources/ict/kioskVertical/img/type_a/info/book_information/map.png" />
			</div>
			<div class="action_btn">
				<div class="close_btn">
					<img alt="" src="/resources/ict/kioskVertical/img/type_a/info/book_information/close.svg" />
					<div>닫기</div>
				</div>
				<div class="print_btn">
					<img alt="" src="/resources/ict/kioskVertical/img/type_a/info/book_information/print.svg" />
					<div>인쇄</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function () {
			$('.detail_wrap').on('click', '.book_mapping', function () {
				$('#popup').css('display', 'block');
			});

			// 닫기 버튼 클릭 이벤트 처리
			$('#closeButton, .close_btn').click(function () {
				$('#popup').css('display', 'none');
			});

			// 모달 영역 바깥 클릭 시 모달 닫기
			$(window).click(function (event) {
				if (event.target.id === 'popup') {
					$('#popup').css('display', 'none');
				}
			});
		});
	</script>
</html>