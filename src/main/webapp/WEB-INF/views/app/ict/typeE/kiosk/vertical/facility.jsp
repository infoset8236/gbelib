<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <title>시설안내</title>
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/typeE/kiosk/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/slick.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/slick-theme.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/facility.css?v=200251221" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/nav.css?v=200251221" rel="stylesheet" type="text/css">
    <link href="/resources/ict/typeE/common/css/common.css" rel="stylesheet" type="text/css " />
    <script src="/resources/ict/typeE/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/kiosk/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/kiosk/js/facility.js?v=1.0" type="text/javascript"></script>
    <script defer src="/resources/ict/kioskVertical/js/type_b/info/common/navigation.js?v=1.2" type="text/javascript"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
</head>

<body>
<div class="dim">
    <div id="container">
        <div class="libFacilityContainer">
            <div class="libHeader">
                <div class="libHeaderEn">FACILITY</div>
                <div class="libHeaderKo" style="color: #FFF">시설안내</div>
            </div>
            <div class="libFacilityWrapper">
                <div class="libFacilityMap">
                    <div class="libFacilityMapLabel"></div>
                    <img class="libFacilityMapImage" src="" alt="FacilityMap" />
                </div>

                <div class="libFacilityContent">
                    <div class="libFacilityTabMenu">
                        <div class="libFacilityTabItem">1F</div>
                        <div class="libFacilityTabItem">2F</div>
                        <div class="libFacilityTabItem">3F</div>
                        <div class="libFacilityTabItem">4F</div>
                    </div>

                    <div class="libFacilitySlide"></div>
                </div>

                <div class="libFacilitySlideDot"></div>
            </div>


            <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
            <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp" />
        </div>
</<div>
</body>


</script>

</html>
