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
		<link href="/resources/ict/typeE/mediawall/css/type_b/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
<!--		<link href="/resources/ict/typeE/mediawall/css/type_b/common.css" rel="stylesheet" type="text/css" />-->
		<link href="/resources/ict/typeE/mediawall/css/type_b/event.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeE/mediawall/js/type_b/event.js" type="text/javascript"></script>
		<script src="/resources/ict/typeE/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<title>오늘의 행사</title>
	</head>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .event_wrapper {
            position: absolute;
            z-index: 9;
            top: calc(50% - 480px);
            left: 340px;
            display: flex;
            align-items: flex-start;
            flex-direction: column;
            justify-content: flex-start;
            width: 2000px;
            gap: 80px;
            overflow: hidden;
            height: 1000px;
        }

        .swiper-container{width: 2000px;}
        .con_wrapper {
            display: flex;
            align-items: flex-start;
            flex-direction: column;
            justify-content: flex-start;
            width: 100%;
            gap: 100px;
        }
        .event_wrapper h2 {
            font-family: 'Pretendard-Bold', sans-serif;
            font-size: 52px;
            font-weight: 700;
            line-height: 100%;
            position: relative;
            text-align: left;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: #b87045;
        }

        .event_wrapper h4 {
            font-family: 'Pretendard-SemiBold', sans-serif;
            font-size: 200px;
            font-weight: 600;
            line-height: 130%;
            display: -webkit-box;
            overflow: hidden;
            height: 478px;
            text-align: left;
            letter-spacing: -0.02em;
            color: #191f28;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            width:2000px;
            text-wrap:auto;
            word-break: keep-all;
        }

        .event_wrapper .time_place {
            position: relative;
            display: flex;
            align-items: flex-start;
            flex-direction: row;
            flex-shrink: 0;
            justify-content: flex-start;
            width: 2000px;
            gap: 160px;
        }
        .event_wrapper .time_place_wrap {
            display: flex;
            align-items: center;
            flex-direction: row;
            justify-content: space-between;
            gap: 60px;
        }
        .event_wrapper .event_label {
            font-family: 'Pretendard-SemiBold', sans-serif;
            font-size: 60px;
            font-weight: 600;
            line-height: 140%;
            overflow: hidden;
            text-align: left;
            white-space: nowrap;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            text-overflow: ellipsis;
            color: #b87045;
        }
        .event_wrapper .event_ex {
            font-family: 'Pretendard-Medium', sans-serif;
            font-size: 72px;
            font-weight: 500;
            line-height: 140%;
            overflow: hidden;
            text-align: left;
            white-space: nowrap;
            text-transform: uppercase;
            text-overflow: ellipsis;
            color: #6b7684;
        }
        .event_wrapper .swiper-pagination{
            padding-top: 0px;
            top: 960px;
            left: 0;
            text-align: left;
        }
        .event_wrapper .swiper-horizontal .swiper-pagination-bullet{
            width: 24px;
            height: 24px;
            border-radius: 50%;
            margin: 0 28px 0 0;
            background: #fff;
            opacity:1;
        }
        .event_wrapper .swiper-horizontal .swiper-pagination-bullet-active {
            background: #adb5bd;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            margin: 0 28px 0 0;
        }
        .bg_wrap{
            width: 100%;
        }
        .bookinfo-wrap .header_wrap {
	        position: relative;
        }

        .header_wrap {
            position: absolute;
            top: 0px;
            left: 0px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            align-items: flex-start;
            -ms-flex-direction: row;
            flex-direction: row;
            justify-content: space-between;
            width: 3840px;
            color: #8b95a1;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -webkit-box-align: start;
            -ms-flex-align: start;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
        }

        .header_frame {
            position: relative;
            top: 0px;
            left: 0px;
            display: flex;
            align-items: flex-start;
            flex-direction: row;
            justify-content: space-between;
            width: 3840px;
            padding: 100px 160px 100px 160px;
        }

        .header_group {
            font-family: 'Pretendard-SemiBold', sans-serif;
            font-size: 32px;
            font-weight: 600;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 3520px;
            text-align: left;
            color: #ffffff;
        }

        .ict_tit,
        .ict_tit_01 {
            font-family: 'Pretendard-SemiBold', sans-serif;
            font-size: 32px;
            font-weight: 600;
            text-align: left;
        }

        .ict_tit_01 {
            color: #191f28;
        }

        .ict_tit {
            color: #8b95a1;
            letter-spacing: 0.1em;
        }
        @media (max-width: 1920px) {
            .event_wrapper {
                top: calc(50% - 240px);
                left: 170px;
                width: 1000px;
                gap: 40px;
            }

            .swiper-container{width: 1000px;}
            .con_wrapper {
                gap: 50px;
            }
            .event_wrapper h2 {
                font-size: 26px;
            }

            .event_wrapper h4 {
                font-size: 100px;
                height: 240px;
                width:1000px;
            }

            .event_wrapper .time_place {
                width: 1000px;
                gap: 80px;
            }
            .event_wrapper .time_place_wrap {
                gap: 30px;
            }
            .event_wrapper .event_label {
                font-size: 30px;
            }
            .event_wrapper .event_ex {
                font-size: 36px;
            }

            .event_wrapper .swiper-pagination{
                padding-top: 0px;
                top: 480px;
                left: 0;
                text-align: left;
            }
            .event_wrapper .swiper-horizontal .swiper-pagination-bullet{
                width: 12px;
                height: 12px;
                border-radius: 50%;
                margin: 0 14px 0 0;
                background: #fff;
                opacity:1;
            }
            .event_wrapper .swiper-horizontal .swiper-pagination-bullet-active {
                background: #adb5bd;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                margin: 0 14px 0 0;
            }
            
            .header_wrap {
		/* padding: 50px 80px; */
		width: 1920px;
	}

	.header_frame {
		width: 1920px;
		padding: 50px 80px;
	}

	.header_group {
		width: 1760px;
		height: 19px;
	}

	.ict_tit,
	.ict_tit_01 {
		font-size: 16px;
		/* width: 1920px; */
	}
        }
        

    </style>
	<body>
	<div class="div_wrap notice_info">
    <img class="bg_wrap" src="/resources/ict/typeE/mediawall/img/type_b/event/bg_event.png" />
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
