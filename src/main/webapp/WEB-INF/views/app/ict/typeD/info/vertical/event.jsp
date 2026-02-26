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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/event.css?v=20251125">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/event.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>행사안내</title>
</head>
<body>
<div class="eventContainer">
    <div class="eventHeader">
        <div class="headerEn">EVENT</div>
        <div class="headerKo">행사안내</div>
    </div>
    <c:if test="${fn:length(eventList) < 1}">
        <div class="lbEmpty">
            <img alt="" src="/resources/ict/info/img/nodata.gif" />
            <div>오늘은 행사가 없어요</div>
        </div>
    </c:if>
    <c:if test="${fn:length(eventList) > 0}">
        <div class="eventSlide">
            <c:forEach var="i" items="${eventList}">
                <div class="slideItem">
                    <div class="itemInfo">
                        <div class="infoRow">
                            <div class="infoLabel">시간</div>
                            <div class="infoValue">${i.start_time} ~ ${i.end_time}</div>
                    </div>
                    <div class="infoRow">
                        <div class="infoLabel">장소</div>
                        <div class="infoValue">${i.contents}</div>
                    </div>
                </div>
                <div class="itemTitle">${i.title}</div>
            </div>
            </c:forEach>
        </div>
    </c:if>

    <div class="eventCopyright">YEONGYANG Public Library</div>
</div>

</body>
</html>
