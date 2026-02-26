<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/livingInfo.css?v=20251125">
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/livingInfo.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>생활정보</title>
</head>
<body>
<div class="livingContainer">
    <div class="livingHeader">
        <div class="headerEn">life information</div>
        <div class="headerKo">생활정보</div>
    </div>

    <div class="livingWrap">
        <div class="livingWeatherWrap">
            <div class="weatherLeft">
                <div class="weatherToday">
                    <div class="weatherLabel">TODAY</div>
                    <div class="weatherCondition"></div>
                </div>
                <div class="temperature"></div>
                <div class="feelsLike">
                    <div class="label">체감온도</div>
                    <div class="value">${weatherData.feelsLike}</div>
                </div>
                <div class="airInfoWrap">
                    <div class="airItem">
                        <div class="airLabel">미세먼지</div>
                        <div class="airValue" id="dustTxt"></div>
                    </div>
                    <div class="airItem">
                        <div class="airLabel">식중독</div>
                        <div class="airValue">주의</div>
                    </div>
                </div>
            </div>
            <div class="weatherRight">
            </div>
        </div>

        <div class="livingScheduleNewsWrap">
            <div class="scheduleWrap"></div>
            <div class="newsWrap">
                <div class="newsTitle">뉴스</div>
                    <div class="newsSlide">
                <c:forEach items="${livingInfoList}" var="i" varStatus="status">
                        <div class="newsItem">
                            <div class="newsContent">${i.title}</div>
                            <div class="newsDate">${i.pubDate}</div>
                        </div>
                </c:forEach>
                    </div>
            </div>
        </div>
    </div>
        <div class="livingCopyright">YEONGYANG Public Library</div>
</div>

</body>
</html>
