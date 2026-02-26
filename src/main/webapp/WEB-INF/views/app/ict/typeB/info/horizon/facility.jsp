<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
          name="viewport" />
    <meta content="ie=edge" http-equiv="X-UA-Compatible" />
    <title>Document</title>
    <link href="/resources/ict/libraryBoard/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/slick.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/slick-theme.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/libraryBoard/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/libraryBoard/plugin/slick.min.js"></script>
    <script src="/resources/ict/libraryBoard/js/common.js" type="text/javascript"></script>
</head>

<body>
<link href="/resources/ict/libraryBoard/css/facility.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/js/facility.js"></script>

<div class="container">
    <div class="header">
        <div>FACILITY</div>
        <div>시설안내</div>
    </div>
    <div class="content">
        <div class="wrapper">
            <div class="current_floor">1F</div>
            <img class="map" src="/resources/ict/libraryBoard/img/facility/map0.png" alt="">
        </div>
        <div class="wrapper">
            <div class="tab_pannel">
                <div class="tab active">B1</div>
                <div class="tab">1F</div>
                <div class="tab">2F</div>
                <div class="tab">3F</div>
            </div>
            <div class="slide"></div>
        </div>
    </div>
    <div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>