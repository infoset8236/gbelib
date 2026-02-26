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
		<link href="/resources/ict/mediawall/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_b/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_b/event.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/js/type_b/event.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<title>오늘의 행사</title>
	</head>
	<body>
	<div class="div_wrap notice_info">
    <img class="bg_wrap" src="/resources/ict/mediawall/img/type_b/event/bg_event.png" />
    <div class="header_wrap">
        <div class="header_frame">
            <div class="header_group">
                <div class="ict_tit_01">행사안내</div>
                <div class="ict_tit">LIBRARY EVENT</div>
            </div>
        </div>
    </div>
    <div class="event_wrapper">
        <h2>today’s event</h2>
        <!-- Swiper Container -->
        <div class="swiper-container slider">
            <div class="swiper-wrapper">
                <c:forEach items="${eventList}" var="i" varStatus="status">
                    <div class="swiper-slide con_wrapper">
                        <h4 class="event_tit">${i.title}</h4>
                        <div class="time_place">
                            <div class="time_place_wrap">
                                <div class="event_label">시간</div>
                                <div class="event_ex">${i.start_time} ~ ${i.end_time}</div>
                            </div>
                            <div class="time_place_wrap">
                                <div class="event_label">장소</div>
                                <div class="event_ex">${i.contents}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- Pagination -->
            <div class="swiper-pagination"></div>
          
        </div>
    </div>
</div>

	</body>
<script>
$(document).ready(function () {
    var swiper = new Swiper('.swiper-container', {
        loop: true, // 슬라이드 루프
        autoplay: {
            delay: 10000, // 3초 간격으로 자동 재생
            disableOnInteraction: false, // 사용자가 스와이프해도 재생 계속됨
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true, // 페이지네이션 클릭 가능
        },
        slidesPerView: 1, // 한 번에 한 슬라이드만 보이기
        spaceBetween: 20, // 슬라이드 간 간격
    });
});

</script>

</html>
