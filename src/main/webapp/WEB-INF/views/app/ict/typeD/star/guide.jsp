<%@ page language="java" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/navigation.css?v=1.3">
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/guide.css?v=1">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/star/js/guide.js?v=1"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>CONSTELLATIONS STORY</div>
                <div tabindex="0">별자리이야기</div>
            </div>
            <div class="content">
                <div class="shootingStar">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div id="zodiacContainer">
                    <div class="zodiac-slider" id="Pisces"></div>
                    <div class="zodiac-slider" id="Aries"></div>
                    <div class="zodiac-slider" id="Taurus"></div>
                    <div class="zodiac-slider" id="Gemini"></div>
                    <div class="zodiac-slider" id="Cancer"></div>
                    <div class="zodiac-slider" id="Leo"></div>
                    <div class="zodiac-slider" id="Virgo"></div>
                    <div class="zodiac-slider" id="Libra"></div>
                    <div class="zodiac-slider" id="Scorpio"></div>
                    <div class="zodiac-slider" id="Sagittarius"></div>
                    <div class="zodiac-slider" id="Capricorn"></div>
                    <div class="zodiac-slider" id="Aquarius"></div>
                </div>
            </div>
            <div class="cntArrows">
                <button class="slick-prev"><img src="/resources/ict/typeD/star/img/guide/chevron-left.svg"/></button>
                <button class="slick-next"><img src="/resources/ict/typeD/star/img/guide/chevron-right.svg"/></button>
            </div>
            <div class="cntPager">
                <div class="pgCurrent">1</div>
                <div class="pgDivider">/</div>
                <div class="pgTotal">12</div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/app/ict/typeD/star/nav.jsp"/>
    </div>
</div>
<div class="scrollUp">
    <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
</div>
</body>
</html>
