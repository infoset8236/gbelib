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
		<title>홍보동영상</title>
	</head>
	<body>
	<div class="media_promotion_container">
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr">홍보동영상</div>
				<div class="media_common_header_en">PROMOTION</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time"></div>
				<div class="media_common_header_date"></div>
			</div>
		</div>
		<div class="media_promotion_content_wrapper">
			<div class="media_promotion_clock_wrapper">
				<div class="media_promotion_clock_title">INFOSET</div>
				<div class="media_promotion_clock">
					<div class="media_promotion_clock_hour"></div>
					<div class="media_promotion_clock_minute"></div>
					<div class="media_promotion_clock_second"></div>
				</div>
				<div class="media_promotion_date">2024년 09월 25일(수)</div>
				<div class="media_promotion_time">10:08</div>
			</div>
			<div class="media_promotion_video_wrapper">
				<!--		비디오 자동 재생 옵션 필수		-->
				<video autoplay loop muted playsinline src="/resources/ict/mediawall/img/type_b/promotion/promotion.mp4"></video>
			</div>
			<!--		날씨 api 연동 완료		-->
			<div class="media_promotion_weather_wrapper">
				<div class="media_promotion_weather_title">TODAY'S WEATHER</div>
				<div class="media_promotion_feels_like"></div>
				<img alt="" class="media_promotion_weather_icon" src="" />
				<div class="media_promotion_temp"></div>
				<div class="media_promotion_weather_description"></div>
			</div>
		</div>
	</div>
	</body>
</html>