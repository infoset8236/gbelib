<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>B타입 이용안내</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/notice.css" />
		<link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" />
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="/resources/ict/kioskHorizon/js/type_b/notice.js"></script>
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js"></script>
	</head>
	<style>
	.notice_wrap .no_wrapper h3{color:#fff;}
	</style>
	<body>
	<div class="notice_wrap info detail_wrap info">
		<div class="header">
			<p>NOTICE</p>
			<h1>공지사항</h1>
		</div>
		<div class="content">
			<c:if test="${fn:length(noticeList) < 1}">
			<div class="no_content">
				<div class="no_wrapper">
					<img src="/resources/ict/common/img/Astronaut.gif" alt="">
					<h3>오늘은 공지사항이 없어요</h3>
				</div>
			</div>
			</c:if>

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
												<img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" />
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
												<img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.onerror=null; this.src='/resources/ict/common/img/noimg.png';" />
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
												<img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.onerror=null; this.src='/resources/ict/common/img/noimg.png';"/>
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
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp"/>

	</body>
	<script>
	$(document).ready(function () {
	var swiper = new Swiper('.swiper-container', {
		loop: false,
		slidesPerView: 1,
		slideToClickedSlide: true,
		speed:1000,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
});

	</script>
</html>