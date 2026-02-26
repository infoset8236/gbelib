<%@ page language="java" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/weather.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/media/js/weather.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="wthrContainer">
    <div class="btchHeader">
        <div class="btchHeaderL">날씨</div>
        <div class="btchHeaderR">weather</div>
    </div>
    <div class="wthrContent">
        <div class="weatherItem">
            <div class="weatherWidget">
                <div>
                    <div class="todayInfo">
                        <div>TODAY</div>
                        <div id="current_condition"></div>
                    </div>
                    <div class="weatherIcon">
                        <div class="todayTemp" id="current_temp"></div>
                        <div class="feelsLike">
                            <div>체감온도</div>
                            <div id="feels_like"></div>
                        </div>
                    </div>
                </div>
                <img class="todayIcon" id="today_icon" src="/resources/ict/typeE/media/img/weather/life/01d.png" alt="">
            </div>
            <div class="lifeIndex">
            <div>미세먼지<span id="dust_condi_txt"></span></div>
            <div>식중독<span id="food_condi_txt"></span></div>
        </div>
        </div>
        <div class="weeklyForecast">
            <div class="weeklyTitle">weekly Forecast</div>
            <div class="weeklyList" id="forecast_frame"></div>
        </div>
    </div>
</div>
</body>
</html>