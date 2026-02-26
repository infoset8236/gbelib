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
		<title>오늘의 행사</title>
	</head>
	<body>
	<div class="media_event_container">
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr">행사안내</div>
				<div class="media_common_header_en">LIBRARY EVENT</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time"></div>
				<div class="media_common_header_date"></div>
			</div>
		</div>
		<div class="media_event_start_1"></div>
		<div class="media_event_start_2"></div>
		<div class="media_event_start_3"></div>
		<div class="media_event_start_4"></div>
		<div class="media_event_caption">TODAY'S EVENT</div>
		<div class="swiper media_event_slider">
			<div class="swiper-wrapper">
				<c:forEach items="${eventList}" var="i" varStatus="status">
					<div class="swiper-slide">
						<div class="media_event_title">${i.title}</div>
						<div class="media_event_detail_wrapper">
							<div class="media_event_detail"><span>시간</span>${i.start_time} ~ ${i.end_time}</div>
							<div class="media_event_detail"><span>장소</span>${i.contents}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	</body>

</html>
