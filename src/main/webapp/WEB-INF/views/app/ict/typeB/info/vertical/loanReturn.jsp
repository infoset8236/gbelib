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
    <link href="/resources/ict/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/book.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/lib.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/book.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/lib.js" type="text/javascript"></script>
</head>
<body>

<div class="lib_return_container">
    <div class="lib_return_content">
        <div class="lib_return_number_wrapper">
            <div class="lib_return_number">${fn:substring(month, 0, 1)}</div>
            <div class="lib_return_number">${fn:substring(month, 1, 2)}</div>
        </div>
        <div class="lib_return_number_wrapper">
            <div class="lib_return_number">${fn:substring(day, 0, 1)}</div>
            <div class="lib_return_number">${fn:substring(day, 1, 2)}</div>
        </div>
    </div>
    <div class="lib_return_content">
        <div class="lib_return_number_wrapper">
            <div class="lib_return_number">${fn:substring(returnMonth, 0, 1)}</div>
            <div class="lib_return_number">${fn:substring(returnMonth, 1, 2)}</div>
        </div>
        <div class="lib_return_number_wrapper">
            <div class="lib_return_number">${fn:substring(returnDay, 0, 1)}</div>
            <div class="lib_return_number">${fn:substring(returnDay, 1, 2)}</div>
        </div>
    </div>
</div>

</body>
</html>