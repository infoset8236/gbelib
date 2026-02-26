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
		<link href="/resources/ict/kioskHorizon/css/type_a/notice.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/notice.js" type="text/javascript"></script>
		<title>공지사항</title>
	</head>
	<body>
	<div class="container">
		<div class="header_wrapper">
			<div class="header_caption">LIBRARY NOTICE</div>
			<div class="header_title">공지사항</div>
		</div>
		<div class="content">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:choose>
						<c:when test="${fn:length(noticeList) > 0}">
						<div class="swiper-slide">
							<c:forEach items="${noticeList}" var="i" varStatus="status" begin="0" end="2">
								<c:choose>
									<c:when test="${empty i.preview_img}">
										<div class="slide-item">
											<img alt="" src="/resources/ict/common/img/noimg.png" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="slide-item">
											<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" />
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${fn:length(noticeList) > 2}">
							<div class="swiper-slide">
								<c:forEach items="${noticeList}" var="i" varStatus="status" begin="2" end="4">
									<c:choose>
										<c:when test="${empty i.preview_img}">
											<div class="slide-item">
												<img alt="" src="/resources/ict/common/img/noimg.png" />
											</div>
										</c:when>
										<c:otherwise>
											<div class="slide-item">
												<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" />
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${fn:length(noticeList) > 4}">
							<div class="swiper-slide">
								<c:forEach items="${noticeList}" var="i" varStatus="status" begin="4" end="6">
									<c:choose>
										<c:when test="${empty i.preview_img}">
											<div class="slide-item">
												<img alt="" src="/resources/ict/common/img/noimg.png" />
											</div>
										</c:when>
										<c:otherwise>
											<div class="slide-item">
												<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" />
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp"/>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp"/>
	</div>
	</body>
</html>