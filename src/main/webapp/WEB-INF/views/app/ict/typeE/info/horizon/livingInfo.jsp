<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
    <title>Document</title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/typeE/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/ulStyle.css?v=20251210" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/livingInfo.css?v=20251210" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/livingInfo.js" type="text/javascript"></script>
</head>
<body>


<div class="newsContainer">
    <div class="libHeader">
        <div class="libHeaderEn">life information</div>
        <div class="libHeaderKo" style="color: #fff">생활정보</div>
    </div>
    <div class="newsHeader">
        <div class="newsTime"></div>
        <div class="newsDate"></div>
    </div>
    <div class="newsBody">
        <div class="newsSectionGroup">
            <div class="newsTodayTitle">TODAY’S NEWS</div>

            <div class="newsListWrapper">
                <ul class="newsList">
                    <c:forEach items="${livingInfoList}" var="i" varStatus="status">
                        <li class="newsItem">
                            <div class="newsItemTitle">${i.title}</div>
                            <div class="newsItemTime">${i.pubDate}</div>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="weatherSection">
                <div class="weatherText">
                    <div class="weatherSectionTitle">TODAY’S WEATHER</div>
                    <div class="weatherStatus"></div>
                </div>

                <div class="weatherInfo">
                    <div class="weatherIcon" id="current_condition"></div>
                    <div class="weatherTemp" id="current_temp"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="libCopyright">Yecheon Public Library</div>
</div>


</body>
</html>