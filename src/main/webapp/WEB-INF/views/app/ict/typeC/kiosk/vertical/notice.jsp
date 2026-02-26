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
	<div class="kiosk_notice_container">
		<div class="kiosk_common_header_wrapper">
			<div class="kiosk_common_header_kr">공지사항</div>
			<div class="kiosk_common_header_en">LIBRARY NOTICE</div>
		</div>
		<div class="kiosk_notice_content">
			<c:forEach items="${noticeList}" var="i" varStatus="status" begin="0" end="0">
				<c:choose>
					<c:when test="${empty i.preview_img}">
						<img class="kiosk_notice_selected_item" src="/resources/ict/kioskVertical/img/common/noimg.png" />
					</c:when>
					<c:otherwise>
						<img class="kiosk_notice_selected_item" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<div class="swiper kiosk_notice_swiper">
				<div class="swiper-wrapper">
					<c:forEach items="${noticeList}" var="i" varStatus="status" begin="1">
					<div class="swiper-slide">
						<c:choose>
							<c:when test="${empty i.preview_img}">
									<img alt="" src="/resources/ict/kioskVertical/img/common/noimg.png" />
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

		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/userNav.jsp"/>
	</div>
	</body>
</html>