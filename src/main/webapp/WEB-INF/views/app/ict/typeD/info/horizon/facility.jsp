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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/facility.css?v=20241134">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/facility.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>시설안내</title>
</head>
<body>
<div class="facilityContainer">
    <div class="facilityHeader">
        <div class="headerEn">FACILITY</div>
        <div class="headerKo">시설안내</div>
    </div>

    <div class="facilityTab tab1">
        <div class="tabContent"></div>
    </div>

    <div class="tabMenu">
        <div class="tabMenuItem active"><a href="tab1">1F</a></div>
        <div class="tabMenuItem"><a href="tab2">2F</a></div>
        <div class="tabMenuItem"><a href="tab3">3F</a></div>
    </div>

    <div class="facilityCopyright">YEONGYANG Public Library</div>
</div>

</body>
</html>
