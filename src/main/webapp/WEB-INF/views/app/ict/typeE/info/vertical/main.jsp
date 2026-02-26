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
    <link href="/resources/ict/typeE/common/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/main.css?v=20251201" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/typeE/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/book.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/lib.js" type="text/javascript"></script>
</head>
<body>

<div class="lib_main_container">
    <div class="lib_main_top">
        <div class="lib_main_time"></div>
        <div class="lib_main_date"></div>
    </div>
    <div class="lib_main_bottom">
        <div class="lib_main_title">예천도서관에<br />
            오신 것을 환영합니다.
        </div>
        <div class="lib_main_caption">Welcome to ${homepage.homepage_eng_name} Public Library</div>
    </div>
</div>

</body>
</html>