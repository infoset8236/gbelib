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
        <link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/common/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeE/mediawall/css/type_b/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeE/mediawall/css/type_b/promotion.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeE/mediawall/js/type_b/promotion.js" type="text/javascript"></script>
		<title>홍보동영상</title>
	</head>
	<body>
	<div class="div_wrap infopromotion-wrap" id="fade-effect">
		<img class="bg_wrap" src="/resources/ict/typeE/mediawall/img/type_b/promotion/bg_promo.png" />
		<div class="header_wrap">
			<div class="header_frame">
				<div class="header_group">
					<div class="ict_tit_01">홍보동영상</div>
					<div class="ict_tit">PROMOTION</div>
				</div>
			</div>
		</div>
		<div class="contents">
			<div class="left-sec">
				<div class="text small-txt">예천도서관</div>
				<div class="">
					<div class="clock">
						<div class="circle" id="sc" style="--clr: #191f28"><i></i></div>
						<div class="circle circle2" id="mn" style="--clr: #191f28">
							<i></i>
						</div>
						<div class="circle circle3" id="hr" style="--clr: #191f28">
							<i></i>
						</div>
					</div>

					<div class="date-txt" id="date"><span id="years"></span>년 <span id="months"></span>월 <span id="days"></span>일 (<span id="dayofweeks"></span>)</div>

					<div class="time-txt" id="time">
						<div id="hours" style="--clr: #191f28">00</div>
						<div id="minutes" style="--clr: #191f28">00</div>
					</div>

					 <script>
					     let hr = document.querySelector('#hr');
					     let mn = document.querySelector('#mn');
					     let sc = document.querySelector('#sc'); // 초침 추가

					     setInterval(() => {
					         var day = new Date();

					         let hh = day.getHours() * 30; // 시침 회전각도 (30도 = 1시간)
					         let mm = day.getMinutes() * 6; // 분침 회전각도 (6도 = 1분)
					         let ss = day.getSeconds() * 6; // 초침 회전각도 (6도 = 1초)
					         let hrRotation = hh + mm / 12; // 시침은 분에 따라 약간 회전

					         // 시, 분, 초 바늘 회전 업데이트
					         $('#hr').css('transform', 'rotateZ(' + hrRotation + 'deg)');
					         $('#mn').css('transform', 'rotateZ(' + mm + 'deg)');
					         $('#sc').css('transform', 'rotateZ(' + ss + 'deg)'); // 초침 회전

					         // 시간과 분 표시할 요소 선택
					         let hours = document.getElementById('hours');
					         let minutes = document.getElementById('minutes');

					         let h = day.getHours();
					         let m = day.getMinutes();

					         // 24시간제를 12시간제로 변환 (필요한 경우 주석 해제)
					         if (h > 12) {
					             // h = h - 12;
					         }

					         // 한 자리 숫자 앞에 0 추가
					         h = h < 10 ? '0' + h : h;
					         m = m < 10 ? '0' + m : m;

					         // 각각 시간과 분만 업데이트 (':' 없이 따로 표시)
					         hours.innerHTML = h;
					         minutes.innerHTML = m;
					     }, 1000); // 1초마다 업데이트
					 </script>
				</div>
			</div>

			<div class="center-sec">
				<!-- 영상 영역 -->
				<div class="movie-box" id="movie-box">
					<div class="outer">
						<div class="inner">
							<!-- <img alt="pomotion" src="/resources/ict/typeE/mediawall/img/type_b/promotion/video.png" /> -->
							<video id="video-box" src="/resources/ict/typeE/mediawall/img/type_b/promotion/promotion.mp4" autoplay muted loop></video>
						</div>
					</div>
				</div>
			</div>

			<div class="right-sec">
				<div class="weather-box">
					<h2>TODAY’S WEATHER</h2>
					<div class="feels_like">체감 <span class="feels_like"></span></div>
					<div class="weather_icon"></div>
					<div class="temp"><span class="temp"></span></div>
					<div class="description"><span class="description"></span></div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>