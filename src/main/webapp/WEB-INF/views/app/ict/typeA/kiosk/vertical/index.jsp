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
		<title>${homepage.homepage_name} ICT 도서관</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/main.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="div_wrap div_wrap_info weather_wrap">
			<div class="div_wrap_bg"><img class="bg_1" src="/resources/ict/kioskVertical/img/type_a/info/main/info_bg1.png" /></div>
			<div class="weather_section">
				<div class="top_sec">
					<div class="time_date">
						<div class="time_txt" id="time">
							<div id="hours" style="--clr: #fff">00</div>
							<div>:</div>
							<div id="minutes" style="--clr: #fff">00</div>
						</div>
						<div class="date_txt" id="date"><span id="months"></span>월 <span id="days"></span>일 <span id="dayofweeks"></span></div>
					</div>
				</div>
				<div class="button_go" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/notice.do'">
					<img class="go_arrow" src="/resources/ict/kioskVertical/img/type_a/info/main/info_btn_go.png" />
				</div>
				<div class="welcome_wrap">
					<div class="welcome_text_01">
						<div class="welcome">welcome</div>
					</div>
					<div class="welcome_text_02">
						<div class="lib_name_new">${homepage.homepage_eng_name} LIBRARY</div>
					</div>
				</div>
			</div>
		</div>
	</body>

	<script>
		$(function () {
			var now = new Date();

			let y = now.getFullYear();
			let mo = now.getMonth() + 1;
			let d = now.getDate();
			let dow = now.getDay();
			var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
			var today = new Date().getDay();
			var todayLabel = week[today];

			$('#years').text(y);
			$('#months').text(mo);
			$('#days').text(d);
			$('#dayofweeks').text(todayLabel);
		});

		setInterval(() => {
			var day = new Date();

			let hours = document.getElementById('hours');
			let minutes = document.getElementById('minutes');
			//let seconds = document.getElementById('seconds');
			//let ampm = document.getElementById('ampm');

			let h = day.getHours();
			let m = day.getMinutes();
			//let s = day.getSeconds();
			//let am = h >= 12 ? "PM" : "AM";

			//convert 24hr clock to 12hr clock
			if (h > 12) {
				//h = h - 12;
			}
			//add zero before single digital number
			h = h < 10 ? '0' + h : h;
			m = m < 10 ? '0' + m : m;
			//s = (s < 10) ? "0" + s : s;

			hours.innerHTML = h;
			minutes.innerHTML = m;
			//seconds.innerHTML = s;
			//ampm.innerHTML = am;
		});
	</script>
</html>