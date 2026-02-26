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
    <!--<link href="/resources/ict/typeE/mediawall/css/type_b/notice.css" rel="stylesheet" type="text/css" />-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
    <script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <!--<script src="/resources/ict/typeE/mediawall/js/type_b/notice.js" type="text/javascript"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <title>공지사항</title>
</head>
<style>
    .notice_info .ict_tit_01 {
        color: #fff;
    }

    .notice_info .notice_img {
        width: 900px;
        height: 1270px;
        border-radius: 40px;
        -webkit-box-shadow: 30px 30px 25px 0 rgba(0, 0, 0, 0.1);
        box-shadow: 30px 30px 25px 0 rgba(0, 0, 0, 0.1);
        -o-object-fit: cover;
        object-fit: cover;
    }

    .notice_info .thum_frame {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        -webkit-box-pack: start;
        -ms-flex-pack: start;
        justify-content: flex-start;
        width: 900px;
        gap: 80px;
    }

    .notice_info .notice_title {
        display: flex;
        align-items: center;
        gap: 30px;
        width: 100%;
    }

    .notice_info .notice_title p {
        margin: 0;
        font-family: 'Pretendard-Medium', sans-serif;
        font-size: 52px;
        font-weight: 500;
        line-height: 140%;
        position: relative;
        display: -webkit-box;
        overflow: hidden;
        width: 780px;
        text-transform: uppercase;
        color: #191f28;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        line-clamp: 2;
    }

    .notice_info .notice_title span {
        font-family: 'Century Gothic', sans-serif;
        font-size: 64px;
        font-weight: 800;
        line-height: 100%;
        position: relative;
        text-align: left;
        text-transform: uppercase;
        color: #191f28;
    }

    .notice_info .notice_slider {
        position: relative;
        top: 380px;
        width: 100%;
        margin: 0 auto;
    }

    .notice_info .notice_slider .frame_img {
        display: inline-block;
        width: 900px !important;
    }

    .swiper-wrapper {
        -webkit-transition-timing-function: linear !important;
        transition-timing-function: linear !important;
    }

    .slick-track{
        display: flex;
        width: fit-content !important;
    }

    @media (max-width: 1920px) {
        .notice_info .notice_img {
            width: 450px;
            height: 635px;
            border-radius: 20px;
            -webkit-box-shadow: 15px 15px 12px 0 rgba(0, 0, 0, 0.1);
            box-shadow: 15px 15px 12px 0 rgba(0, 0, 0, 0.1);
        }

        .notice_info .thum_frame {
            width: 450px;
            gap: 40px;
        }

        .notice_info .notice_title {
            gap: 15px;
        }

        .notice_info .notice_title p {
            font-size: 26px;
            width: 390px;
        }

        .notice_info .notice_title span {
            font-size: 32px;
        }

        .notice_info .notice_slider {
            top: 190px;
            width: 100%;
            margin: 0 auto;
            /* width: 1600px; */
        }

        .notice_info .notice_slider .frame_img {
            display: inline-block;
            width: 450px !important;
            margin: 0 60px;
        }
    }



</style>

<body>
    <div class="div_wrap notice_info">
        <img class="bg_wrap" src="/resources/ict/typeE/mediawall/img/type_b/notice/bg_notice.png" />
        <div class="header_wrap">
            <div class="header_frame">
                <div class="header_group">
                    <div class="ict_tit_01">공지사항</div>
                    <div class="ict_tit">NOTICE</div>
                </div>
            </div>
        </div>
        <div class="notice_slider swiper mySwiper swiper-container">
            <c:forEach items="${noticeList}" var="i" varStatus="status">
                <c:choose>
                    <c:when test="${empty i.preview_img}">
                        <div class="frame_img swiper-slide">
                            <div class="thum_frame">
                                <img class="notice_img" src="/resources/ict/kioskVertical/img/common/noimg.png" />
                                <div class="notice_title">
                                    <!-- <span>
                                        <fmt:formatNumber value="${status.count}" pattern="00" />
                                    </span> -->
                                    <p>${i.title}</p>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="frame_img swiper-slide">
                            <div class="thum_frame">
                                <img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" />
                                <div class="notice_title">
                                    <!-- <span>
                                        <fmt:formatNumber value="${status.count}" pattern="00" />
                                    </span> -->
                                    <p>${i.title}</p>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

    </div>
</body>
<script>
    $(function() {
        $('.notice_slider').slick({
            infinite: true, 
            slidesToShow: 3,
            slidesToScroll: 1,
            speed: 10000, 
            autoplay: true,
            autoplaySpeed: 0, 
            cssEase: 'linear',
            arrows: false
           
        });
    });

</script>

</html>
