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
		<link href="/resources/ict/mediawall/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/js/type_c/script.js" type="text/javascript"></script>
		<title>공지사항</title>
	</head>
	<body>
	<div class="media_notice_container">
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr">공지사항</div>
				<div class="media_common_header_en">LIBRARY NOTICE</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time"></div>
				<div class="media_common_header_date"></div>
			</div>
		</div>
		<div class="media_notice_start_1"></div>
		<div class="media_notice_start_2"></div>
		<div class="media_notice_start_3"></div>
		<div class="media_notice_start_4"></div>

		<div class="media_notice_wrapper">
			<div class="media_notice_slider swiper">
				<div class="swiper-wrapper">
					<c:forEach items="${noticeList}" var="i" varStatus="status">
						<div class="swiper-slide">
							<c:choose>
								<c:when test="${empty i.preview_img}">
									<img class="media_notice_selected_book" src="/resources/ict/kioskVertical/img/common/noimg.png" />
								</c:when>
								<c:otherwise>
									<img class="media_notice_selected_book" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								</c:otherwise>
							</c:choose>
							<div class="media_notice_selected_book_title"><span><fmt:formatNumber value="${status.count}" pattern="00"/></span><br />${i.title}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="media_notice_slider_list swiper">
				<div class="swiper-wrapper">
					<c:forEach items="${noticeList}" var="i" varStatus="status">
						<c:set var="rotatedIndex" value="${(status.index + 1) % fn:length(noticeList)}" />
						<c:set var="currentItem" value="${noticeList[rotatedIndex]}" />
						<div class="swiper-slide">
							<div><fmt:formatNumber value="${rotatedIndex + 1}" pattern="00" /></div>
							<c:choose>
								<c:when test="${empty currentItem.preview_img}">
									<img src="/resources/ict/kioskVertical/img/common/noimg.png" />
								</c:when>
								<c:otherwise>
									<img src="/data/board/${currentItem.manage_idx}/${currentItem.board_idx}/${currentItem.preview_img}"  onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>