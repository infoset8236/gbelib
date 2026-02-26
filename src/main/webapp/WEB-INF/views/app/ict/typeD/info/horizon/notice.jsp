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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/notice.css?v=20251125">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/notice.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항</title>
</head>
<body>
<div class="noticeSection">
    <div class="noticeHeader">
        <div class="noticeHeaderEn">notice</div>
        <div class="noticeHeaderKo">공지사항</div>
    </div>
    <div class="noticeContent">
        <c:if test="${empty noticeList or fn:length(noticeList) == 0}">
            <div class="lbEmpty">
                <img alt="" src="/resources/ict/info/img/nodata.gif" />
                <div>등록된 공지사항이 없어요</div>
            </div>
        </c:if>
        <c:if test="${not empty noticeList and fn:length(noticeList) > 0}">
            <div class="noticeMainSlider">
                <c:forEach items="${noticeList}" var="i">
                    <div class="slideItem">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <img src="/resources/ict/typeD/common/img/common/dummy.png" alt="공지사항 이미지">
                            </c:when>
                            <c:otherwise>
                                <img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}"
                                     onerror="this.src='/resources/ict/typeD/common/img/common/dummy.png'"
                                     alt="공지사항 이미지">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>

            <div class="noticeSubSlider">
                <c:forEach items="${noticeList}" var="i">
                    <div class="slideItem">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <img src="/resources/ict/typeD/common/img/common/dummy.png" alt="썸네일">
                            </c:when>
                            <c:otherwise>
                                <img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}"
                                     onerror="this.src='/resources/ict/typeD/common/img/common/dummy.png'"
                                     alt="썸네일">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
<div class="noticeCopyright">YEONGYANG Public Library</div>
</div>
</body>
</html>
