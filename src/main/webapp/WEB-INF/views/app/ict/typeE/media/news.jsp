<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/news.css?v=2">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/media/js/news.js?v=2"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="newsContainer">
    <div class="newsHeader">
        <div class="newsHeaderLeft">실시간뉴스</div>
        <div class="newsHeaderRight">HEADLINE NEWS</div>
    </div>
    <div class="newsContent">
        <div class="newsTitle">headline news</div>
        <div class="newsSlideWrap">
            <c:forEach items="${livingInfoList}" var="i">
                <div class="newsSlideItem">
                    <div class="newsText">${i.title}</div>
                    <div class="newsDate">${i.pubDate}</div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>