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
    <link href="/resources/ict/typeE/info/css/facility.css?v=20251210" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/facility.js?v=20251210" type="text/javascript"></script>
</head>
<body>

<div class="libFacilityContainer">
    <div class="libHeader">
        <div class="libHeaderEn">FACILITY</div>
        <div class="libHeaderKo" style="color: #fff">시설안내</div>
    </div>
    <div class="libFacilityWrapper">
        <div class="libFacilityMap">
            <div class="libFacilityMapLabel"></div>
            <img class="libFacilityMapImage"  src="" alt="FacilityMap" />
        </div>

        <div class="libFacilityContent">
            <div class="libFacilityTabMenu">
                <div class="libFacilityTabItem">1F</div>
                <div class="libFacilityTabItem">2F</div>
                <div class="libFacilityTabItem">3F</div>
                <div class="libFacilityTabItem">4F</div>
            </div>

            <div class="libFacilitySlide">

            </div>
        </div>

        <div class="libFacilitySlideDot"></div>
    </div>

    <div class="libCopyright">Yecheon Public Library</div>
</div>


</body>
</html>