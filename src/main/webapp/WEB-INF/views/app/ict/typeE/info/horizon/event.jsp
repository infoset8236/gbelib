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
    <link href="/resources/ict/typeE/info/css/event.css?v=20251210" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/event.js" type="text/javascript"></script>
</head>
<body>

<div class="libEventContainer">
    <div class="libHeader">
        <div class="libHeaderEn">library event</div>
        <div class="libHeaderKo">행사안내</div>
    </div>
    <c:if test="${fn:length(eventList) < 1}">
        <div class="lib_event_nodata_wrapper">
            <img alt="" src="/resources/ict/common/img/Astronaut.gif" />
            <div>오늘은 행사가 없어요</div>
        </div>
    </c:if>
    <c:if test="${fn:length(eventList) > 0}">
        <div class="libEventInner">
            <div class="libEventLabel">today’s event</div>
            <div class="libEventBox">
                <c:forEach items="${eventList}" var="i" varStatus="status">
                    <div class="libEventItem">
                        <div class="libEventTitle">${i.title}</div>

                        <div class="libEventInfo">
                            <div class="libEventInfoItem">
                                <div class="libEventInfoTit">시간</div>
                                <div class="libEventInfoDesc">${i.start_time} ~ ${i.end_time}</div>
                            </div>

                            <div class="libEventInfoItem">
                                <div class="libEventInfoTit">장소</div>
                                <div class="libEventInfoDesc">${i.contents}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <div class="libCopyright">Yecheon Public Library</div>
</div>


</body>
</html>