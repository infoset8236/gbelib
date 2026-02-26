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
    <link href="/resources/ict/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/book.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/lib.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/book.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/lib.js" type="text/javascript"></script>
</head>
<body>

<div class="lib_event_container">
    <c:if test="${fn:length(eventList) < 1}">
        <div class="lib_event_nodata_wrapper">
            <img alt="" src="/resources/ict/common/img/Astronaut.gif" />
            <div>오늘은 행사가 없어요</div>
        </div>
    </c:if>
    <c:if test="${fn:length(eventList) > 0}">
				<div class="lib_event_title_caption">TODAY'S EVENT</div>
        <div class="lib_event_swiper">
            <div class="swiper">
                <div class="swiper-wrapper">
                    <c:forEach items="${eventList}" var="i" varStatus="status">
                        <div class="swiper-slide">
                            <div class="lib_event_title">${i.title}</div>
                            <div class="lib_event_detail">
															<div class="lib_event_label">시간</div>
															<div class="lib_event_value">${i.start_time} ~ ${i.end_time}</div>
														</div>
														<div class="lib_event_detail">
																<div class="lib_event_label">장소</div>
																<div class="lib_event_value">${i.contents}</div>
														</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </c:if>
</div>

</body>
</html>