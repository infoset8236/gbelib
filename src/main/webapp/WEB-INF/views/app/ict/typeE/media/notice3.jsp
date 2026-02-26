<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/notice3.css?v=3">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/media/js/notice3.js?v=3"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<div class="infoPanelContainer" style="overflow:hidden;">
    <div class="panelHeader">
        <div class="panelTitle">
            <div class="panelTitleEn">NOTICE</div>
            <div class="panelTitleKo">공지사항</div>
        </div>
        <div class="panelPagination">
            <span class="panelCurrent">1</span><span class="panelTotal">/1</span>
        </div>
    </div>
    <div class="infoList">
        <c:forEach items="${noticeList}" var="i">
            <c:choose>
                <c:when test="${empty i.preview_img}">
                    <div class="infoItem">
                        <img class="infoImg" src="/resources/ict/common/img/noimg.png" alt=${i.title} />
                        <div class="infoItemText">${i.title}</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="infoItem">
                        <img class="infoImg" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt=${i.title} />
                        <div class="infoItemText">${i.title}</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${fn:length(noticeList) <= 0}">
            <div class="noData">공지사항이 없습니다.</div>
        </c:if>
    </div>
</div>

</body>
</html>
