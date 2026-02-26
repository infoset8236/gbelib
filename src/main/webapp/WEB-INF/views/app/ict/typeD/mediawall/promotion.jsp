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
		<link href="/resources/ict/typeD/mediawall/css/type_a/promotion.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/js/type_a/promotion.js" type="text/javascript"></script>
		<title>홍보동영상</title>
	</head>
	<body>
	<div class="div_wrap infopromotion-wrap" id="fade-effect">
		<img class="bg_wrap" src="/resources/ict/typeD/mediawall/img/type_a/promotion/mediawall_promotion.png" />
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
				<div class="text small-txt">${homepage.homepage_name}</div>
				<div class="">
					<div class="clock">
						<div class="circle" id="sc" style="--clr: #fff"><i></i></div>
						<div class="circle circle2" id="mn" style="--clr: #fff">
							<i></i>
						</div>
						<div class="circle circle3" id="hr" style="--clr: #fff">
							<i></i>
						</div>
					</div>

					<div class="date-txt" id="date"><span id="years"></span>년 <span id="months"></span>월 <span id="days"></span>일 (<span id="dayofweeks"></span>)</div>

					<div class="time-txt" id="time">
						<div id="hours" style="--clr: #fff">00</div>
						<div id="minutes" style="--clr: #fff">00</div>
					</div>

					<script>
						let hr = document.querySelector('#hr');
						let mn = document.querySelector('#mn');
						let sc = document.querySelector('#sc');

						setInterval(() => {
							var day = new Date();

							let hh = day.getHours() * 30;
							let mm = day.getMinutes() * 6;
							let ss = day.getSeconds() * 6;
							let hr = hh + mm / 12;
							$('#hr').css('transform', 'rotateZ(' + hr + 'deg)');
							$('#mn').css('transform', 'rotateZ(' + mm + 'deg)');
							$('#sc').css('transform', 'rotateZ(' + ss + 'deg)');

							let hours = document.getElementById('hours');
							let minutes = document.getElementById('minutes');
							let seconds = document.getElementById('seconds');
							//let ampm = document.getElementById('ampm');

							let h = day.getHours();
							let m = day.getMinutes();
							let s = day.getSeconds();
							//let am = h >= 12 ? "PM" : "AM";

							//convert 24hr clock to 12hr clock
							if (h > 12) {
								//h = h - 12;
							}
							//add zero before single digital number
							h = h < 10 ? '0' + h : h;
							m = m < 10 ? '0' + m : m;
							s = s < 10 ? '0' + s : s;

							hours.innerHTML = h;
							minutes.innerHTML = m;
							seconds.innerHTML = s;
							//ampm.innerHTML = am;
						});
					</script>
				</div>
			</div>

			<div class="center-sec">
				<!-- 영상 영역 -->
				<div class="movie-box" id="movie-box">
					<div class="outer">
						<div class="inner">
							<img alt="pomotion" src="/resources/ict/typeD/mediawall/img/type_a/promotion/madiawall_promotion_con.png" />
							<!-- <video id="video-box" src="https://library.daegu.go.kr/resources/common/movie/mediawall/dglib_campaign.mp4" autoplay muted loop></video> -->
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