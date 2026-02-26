<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery</title>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/gallery/css/index.css"/>
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>

    <style>
        #sliderWrap {
            position: relative;
            width: 100%;
            height: 100vh;
        }
    </style>
</head>

<body>

<div id="sliderWrap">
    <div><img src="/resources/ict/typeD/star/img/star1.jpg" alt="slide1"></div>
    <div><img src="/resources/ict/typeD/star/img/star2.jpg" alt="slide2"></div>
    <div><img src="/resources/ict/typeD/star/img/star3.jpg" alt="slide3"></div>
    <div><img src="/resources/ict/typeD/star/img/star4.jpg" alt="slide3"></div>
</div>

<script>
    $(function () {
        $('#sliderWrap').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 15000,
            speed: 1500,
            fade: true,
            cssEase: 'linear',
            arrows: false,
            dots: false,
            pauseOnHover: false
        });
    });
</script>
</body>
</html>
