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
		<link href="/resources/ict/typeE/mediawall/css/type_b/welcome_message.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeE/mediawall/js/type_b/welcome_message.js" type="text/javascript"></script>
		<title>환영메시지</title>
	</head>
	<body>
		<div class="div_wrap welcome_wrap">
			<img class="bg_wrap" src="/resources/ict/typeE/mediawall/img/type_b/welcome_message/bg_welcome.png" />
			<div class="header_wrap">
				<div class="header_frame">
					<div class="header_group">
						<!--<div class="ict_tit_01">환영메시지</div>
						<div class="ict_tit">WELCOME</div>-->
					</div>
				</div>
			</div>
			<div class="top-sec">
				<div class="time-date">
					<div class="time-txt" id="time">
						<div id="hours" style="--clr: #191f28">00</div>
						<div>:</div>
						<div id="minutes" style="--clr: #191f28">00</div>
					</div>
					<div class="date-txt" id="date">
						<span id="months"></span>월 <span id="days"></span>일
						<span id="dayofweeks"></span>
					</div>
				</div>
			</div>
			<div class="txt_wel">
				<div class="div">${homepage.homepage_name}에 오신 것을 환영합니다.</div>
				<div class="lib_tit">Welcome to ${homepage.homepage_eng_name}</div>
			</div>
			<%--<div class="ticker">
				<div class="div2 marquee animated-title">
					<div class="track">
						<div class="bottom_txt">
							&nbsp; 도서관초대석 &lt;불편한편의점&gt; 일정이 김호연 작가의 개인사정으로 인해 변경되었습니다. 이용에 참고하여 주시기 바랍니다.&nbsp;여기는 텍스트 흘러가는 티커영역 입니다. 긴급
							공지용으로 사용해주세요!
						</div>
					</div>
				</div>
			</div>--%>
		</div>
	</body>

	<script>
		setInterval(() => {
			var day = new Date();

			let hours = document.getElementById('hours');
			let minutes = document.getElementById('minutes');

			let h = day.getHours();
			let m = day.getMinutes();
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