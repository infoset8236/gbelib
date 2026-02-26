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
		<title>공지사항</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/notice.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_a/info/notice.js" type="text/javascript"></script>
	</head>
	<body>

	<div class="notice-wrap info">
		<div class="header">
			<p>library notice</p>
			<h1>공지사항</h1>
		</div>
		<div class="contents">
			<div class="swiper notice-slide">
				<div class="swiper-wrapper">
					<c:forEach items="${noticeList}" var="i" varStatus="status">
						<div class="swiper-slide">
							<c:choose>
								<c:when test="${empty i.preview_img}">
										<img alt="" src="/resources/ict/kioskVertical/img/common/noimg.png" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								</c:when>
								<c:otherwise>
										<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="swiper notice-slide-thumbs" thumbsSlider="">
				<div class="swiper-wrapper">
					<c:forEach items="${noticeList}" var="i" varStatus="status">
						<div class="swiper-slide">
							<c:choose>
								<c:when test="${empty i.preview_img}">
										<img alt="" src="/resources/ict/kioskVertical/img/common/noimg.png" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								</c:when>
								<c:otherwise>
										<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/nav.jsp"/>

	</body>
</html>