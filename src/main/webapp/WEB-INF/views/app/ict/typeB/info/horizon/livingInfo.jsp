<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
<meta content="ie=edge" http-equiv="X-UA-Compatible" />
<title>Document</title>
<link href="/resources/ict/libraryBoard/css/reset.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/font.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/slick.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/slick-theme.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/plugin/jquery-3.7.1.min.js"></script>
<script src="/resources/ict/libraryBoard/plugin/slick.min.js"></script>
<script src="/resources/ict/libraryBoard/js/common.js" type="text/javascript"></script>
</head>

<body>
<link href="/resources/ict/libraryBoard/css/livingInformation.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/js/livingInformation.js"></script>
<script type="text/javascript">
$.ajax({
	url: 'https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=mTUxHmLUNKyKUBHLXufR151ng2cL%2FNjVt9pv5EEf6Y7f0nuysgoums4NDoEEO5Rjlf5%2BEIalMrDIdPMxDo7SPA%3D%3D&returnType=xml&numOfRows=100&pageNo=1&sidoName=%EA%B2%BD%EB%B6%81&ver=1.0',
	dataType: "json",
	type: "GET",
	async: "false",
	success: function(data) {
		var dustStatus = data.response.body.items[0].pm10Grade1h;

		if (dustStatus == '1') {
			$('#dust_condi_txt').html('좋음');
		} else if (dustStatus == '2') {
			$('#dust_condi_txt').html('보통');
		} else if (dustStatus == '3') {
			$('#dust_condi_txt').html('나쁨');
		} else if (dustStatus == '4') {
			$('#dust_condi_txt').html('매우나쁨');
		}
	},
	error: function(data) {
		$('#dust_condi_txt').html('보통');
	}
});

$(document).ready(function () {
	var weathers = new Array('thunderstorm with light rain', 'thunderstorm with rain', 'thunderstorm with heavy rain', 'light thunderstorm', 'thunderstorm', 'heavy thunderstorm', 'ragged thunderstorm', 'thunderstorm with light drizzle', 'thunderstorm with drizzle', 'thunderstorm with heavy drizzle', 'light intensity drizzle', 'drizzle', 'heavy intensity drizzle', 'light intensity drizzle rain', 'drizzle rain', 'heavy intensity drizzle rain', 'shower rain and drizzle', 'heavy shower rain and drizzle', 'shower drizzle', 'light rain', 'moderate rain', 'heavy intensity rain', 'very heavy rain', 'extreme rain', 'freezing rain', 'light intensity shower rain', 'shower rain', 'heavy intensity shower rain', 'ragged shower rain', 'light snow', 'snow', 'heavy snow', 'sleet', 'light shower sleet', 'shower sleet', 'light rain and snow', 'rain and snow', 'light shower snow', 'shower snow', 'heavy shower snow', 'mist', 'smoke', 'haze', 'sand/dust whirls', 'fog', 'sand', 'dust', 'volcanic ash', 'squalls', 'tornado', 'clear sky', 'few clouds', 'scattered clouds', 'broken clouds', 'overcast clouds');

	var weatherskor = new Array('뇌우', '뇌우', '뇌우', '뇌우', '뇌우', '뇌우', '뇌우', '뇌우', '뇌우', '뇌우', '이슬비', '이슬비', '이슬비', '이슬비', '이슬비', '이슬비', '이슬비', '이슬비', '비 약간', '적당한 비', '비 많이', '비 많이', '폭우', '우박', '소나기 약간', '소나기', '폭우 수준의 소나기', '오락가락한 소나기', '눈 약간', '눈', '폭설', '진눈째비', '약간의 진눈깨비', '갑자기 진눈깨비', '약간의 비와 눈', '비와 눈', '갑자기 약간 눈', '갑자기 눈', '폭설', '안개', '연기', '안개', '모래/먼지 소용돌이', '모래', '모래', '먼지', '화산재', '토네이도', '토네이도', '맑음', '구름 약간', '약간 흐림', '흐림 구름', '많이 흐림');
	var i;

	const apiUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=Gumi&appid=3bcf7eca7fc5d5df252135e43043a0a7&units=metric';

	const weatherIcons = {
		"01d": "/resources/ict/info/img/01d.png", // 맑음 (낮)
		"01n": "/resources/ict/info/img/01n.png", // 맑음 (밤)
		"02d": "/resources/ict/info/img/02d.png", // 구름 조금 (낮)
		"02n": "/resources/ict/info/img/02n.png", // 구름 조금 (밤)
		"03d": "/resources/ict/info/img/03d.png", // 구름 많음 (낮)
		"03n": "/resources/ict/info/img/03n.png", // 구름 많음 (밤)
		"04d": "/resources/ict/info/img/04d.png", // 구름 낀 (낮)
		"04n": "/resources/ict/info/img/04d.png", // 구름 낀 (밤)
		"09d": "/resources/ict/info/img/09d.png", // 소나기 (낮)
		"09n": "/resources/ict/info/img/09d.png", // 소나기 (밤)
		"10d": "/resources/ict/info/img/10d.png", // 비 (낮)
		"10n": "/resources/ict/info/img/10d.png", // 비 (밤)
		"11d": "/resources/ict/info/img/11d.png", // 뇌우 (낮)
		"11n": "/resources/ict/info/img/11d.png", // 뇌우 (밤)
		"13d": "/resources/ict/info/img/13d.png", // 눈 (낮)
		"13n": "/resources/ict/info/img/13d.png", // 눈 (밤)
		"50d": "/resources/ict/info/img/50d.png", // 안개 (낮)
		"50n": "/resources/ict/info/img/50d.png"  // 안개 (밤)
	};

	$.ajax({
		url: apiUrl,
		dataType: "json",
		type: "GET",
		success: function (data) {
			// 현재 날씨 설정
			const currentTemp = parseFloat(data.list[0].main.temp.toFixed(1));
			const currentWeatherIcon = weatherIcons[data.list[0].weather[0].icon] || '/resources/ict/info/img/_03-n-10.png';

			for (i = 0; i < weathers.length; i++) {
				if (weathers[i] == data.list[0].weather[0].description) {
					var currentCondition = weatherskor[i];
				}
			}

			$('#feels_like').html(parseFloat(data.list[0].main.feels_like.toFixed(1)) + '°');

			$('#current_temp').html(currentTemp + '˚');
			$('#current_condition').html(currentCondition);
			$('.lib_living_temperature_wrapper').append('<img class="lib_living_weather_icon" src="' + currentWeatherIcon + '" />');

			// 주간 날씨 설정
			var forecastHtml = '';
			for (let i = 0; i < data.list.length; i += 8) {
				const forecastDate = new Date(data.list[i].dt * 1000);
				const forecastTemp = parseFloat(data.list[i].main.temp.toFixed(1));
				const forecastWeatherIcon = weatherIcons[data.list[i].weather[0].icon] || '/resources/ict/info/img/03n.png';

				forecastHtml +=
					'<div class="weekly_weather_item">' +
						'<div>' +
							(forecastDate.getMonth() + 1) + '.' + forecastDate.getDate() + ' ' + ['일', '월', '화', '수', '목', '금', '토'][forecastDate.getDay()] +
						'</div>' +
						'<img src="'+forecastWeatherIcon+'"/>' +
						'<div>' + forecastTemp + '˚</div>' +
					'</div>';
			}
			$('#forecast_frame').html(forecastHtml);
		},
		error: function (error) {
		}
	});
});
</script>

<div class="container">
	<div class="header">
		<div class="gray">LIFE INFORMATION</div>
		<div class="black">생활정보</div>
	</div>
	<div class="content">
		<div class="wrapper">
			<div class="today"><span id="current_condition"></span></div>
			<div class="weather">
				<div id="current_temp"></div>
				<img src="/resources/ict/libraryBoard/img/livingInformation/01d.png" alt="">
			</div>
			<div class="temperature">체감온도<span id="feels_like"></span></div>
			<div class="dust">
				<img src="/resources/ict/libraryBoard/img/livingInformation/dust.svg" alt="">
				<div>미세먼지<span id="dust_condi_txt"></span></div>
			</div>
		</div>
		<div class="wrapper">
			<div class="weekly_weather" id="forecast_frame"></div>
			<div class="news_content">
				<div class="news_content_header">
					<div>NEWS</div>
					<img src="/resources/ict/libraryBoard/img/livingInformation/news_wire.svg" alt="">
				</div>
				<div class="slide">
					<c:forEach items="${livingInfoList}" var="i" varStatus="status">
					<div class="slide_item">
						<div>${i.title}</div>
						<div>${i.pubDate}</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>