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
		<link href="/resources/ict/typeD/mediawall/css/type_a/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/notice.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/js/type_a/notice.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<title>공지사항</title>
	</head>
	<body>
	<div class="div_wrap notice_info">
		<img class="bg_wrap" src="/resources/ict/typeD/mediawall/img/type_a/notice/mediawall_notice.png" />
		<div class="header_wrap">
			<div class="header_frame">
				<div class="header_group">
					<div class="ict_tit_01">공지사항</div>
					<div class="ict_tit">NOTICE</div>
				</div>
			</div>
		</div>
		<div class="notice_slider swiper mySwiper">
			<div class="swiper-wrapper">
			<c:forEach items="${noticeList}" var="i">
				<c:choose>
					<c:when test="${empty i.preview_img}">
						<div class="frame_img swiper-slide">
							<div class="thum_frame">
								<img class="notice_img" src="/resources/ict/kioskVertical/img/common/noimg.png" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								<div class="notice_title">${i.title}</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="frame_img swiper-slide">
							<div class="thum_frame">
								<img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
								<div class="notice_title">${i.title}</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
		</div>
	</div>
	</body>
</html>