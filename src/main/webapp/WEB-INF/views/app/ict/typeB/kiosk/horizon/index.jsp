<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>${homepage.homepage_name} ICT 도서관</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/welcome_message.css" />
		<link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script>
	</head>
	<body>
	<div class="container div_wrap_info">
		<div class="contents">
			<div class="time_and_date">
				<div class="time_txt time" id="time">
					<div id="hours" style="--clr: #fff">00</div>
					<div>:</div>
					<div id="minutes" style="--clr: #fff">00</div>
				</div>
				<div class="date_txt" id="date"><div><span id="months"></span>월 </div><div><span id="days"></span>일</div><div><span id="dayofweeks"></span></div></div>
			</div>
			<div class="wrapper">
				<div class="welcome_message">${homepage.homepage_name}에 오신 것을 환영합니다</div>
				<div class="caption">Welcome to ${homepage.homepage_eng_name}</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp"/>

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