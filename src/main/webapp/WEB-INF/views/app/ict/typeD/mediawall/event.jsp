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
		<link href="/resources/ict/typeD/mediawall/css/type_a/event.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/js/type_a/event.js" type="text/javascript"></script>
		<title>오늘의 행사</title>
	</head>
	<body>
	<div class="div_wrap today_wrap">
		<img class="bg_wrap" src="/resources/ict/typeD/mediawall/img/type_a/event/today_bg.png" />
		<div class="header_wrap">
			<div class="header_frame">
				<div class="header_group">
					<div class="ict_tit_01">행사안내</div>
					<div class="ict_tit">LIBRARY EVENT</div>
				</div>
			</div>
		</div>
		<div class="event_slider swiper">
			<div class="swiper-wrapper">
				<c:forEach items="${eventList}" var="i" varStatus="status">
					<div class="frame_event swiper-slide">
						<div class="time_place">
							<div class="time_place_wrap">
								<div class="event_label">시간</div>
								<div class="event_ex">${i.start_time} ~ ${i.end_time}</div>
							</div>
							<div class="time_place_wrap">
								<div class="event_label">장소</div>
								<div class="event_ex">${i.contents}</div>
							</div>
						</div>
						<div class="book-talk">
								${i.title}
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	</body>
</html>