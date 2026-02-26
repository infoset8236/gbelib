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
		<link href="/resources/ict/kioskHorizon/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" rel="stylesheet" />
		<link href="/resources/ict/kioskHorizon/css/type_a/book_information.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/book_information.js" type="text/javascript"></script>
		<title>도서정보</title>
	</head>
	<body>
	<div class="container">
		<div class="header_wrapper">
			<div class="header_caption">BOOK INFORMATION</div>
			<div class="header_title">도서정보</div>
		</div>
		<div class="content">
			<div class="left">
				<div class="book_wrapper">
					<c:choose>
						<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
							<img src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
						</c:when>
						<c:otherwise>
							<img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
						</c:otherwise>
					</c:choose>
					<c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
						<div class="badge">대출<br />가능</div>
					</c:if>
				</div>
				<div class="title">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
			</div>
			<div class="wrapper">
				<div class="book_information">
					<div>
						<div class="book_information_text mb"><span>저자명</span>${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</div>
						<div class="book_information_text mb"><span class="152">출판사</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</div>
						<div class="book_information_text"><span class="152">발행년</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</div>
					</div>
					<div>
						<div class="book_information_text mb"><span>서가위치</span>${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</div>
						<div class="book_information_text mb"><span>청구기호</span>${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</div>
						<div class="book_information_text"><span>등록번호</span>${fn:escapeXml(detail.dsItemDetail[0].CTRLNO)}</div>
					</div>
				</div>
				<div class="location">소장도서 서가위치보기</div>
				<div class="summary">
					${kakaoResult}
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="slide-item">
								<c:choose>
									<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
										<img src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
									</c:when>
									<c:otherwise>
										<img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
									</c:otherwise>
								</c:choose>
								<div class="book_title">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
								<div class="writer">${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</div>
							</div>
							<c:choose>
								<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
									<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="0" end="4">
										<div class="slide-item">
											<c:choose>
												<c:when test="${i.COVER_SMALLURL eq ''}">
													<img src="/resources/ict/common/img/noimg.png" />
												</c:when>
												<c:otherwise>
													<img src="${i.COVER_SMALLURL}" />
												</c:otherwise>
											</c:choose>
											<div class="book_title">${i.TITLE}</div>
											<div class="writer">${i.AUTHOR}</div>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
						<div class="swiper-slide">
							<c:choose>
								<c:when test="${fn:length(newBookList.dsNewBookList) > 4}">
									<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="4" end="9">
										<div class="slide-item">
											<c:choose>
												<c:when test="${i.COVER_SMALLURL eq ''}">
													<img src="/resources/ict/common/img/noimg.png" />
												</c:when>
												<c:otherwise>
													<img src="${i.COVER_SMALLURL}" />
												</c:otherwise>
											</c:choose>
											<div class="book_title">${i.TITLE}</div>
											<div class="writer">${i.AUTHOR}</div>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp"/>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp"/>
		</div>
	</div>
	</body>
</html>