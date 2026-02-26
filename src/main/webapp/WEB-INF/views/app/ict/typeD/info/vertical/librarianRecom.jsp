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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/librarianRecom.css?v=20251125">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/librarianRecom.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사서추천도서</title>
</head>
<body>
<div class="recBookSection">
    <div class="recBookHeader">
        <div class="headerEn">Librarian Recommended Book</div>
        <div class="headerKo">사서추천도서</div>
    </div>
    <div class="recBookContent">
        <c:if test="${fn:length(librarianRecommendList) < 1}">
            <div class="lbEmpty">
                <img alt="" src="/resources/ict/info/img/nodata.gif" />
                <div>등록된 책 소개가 없어요</div>
            </div>

        </c:if>
        <div class="recBookSlide">
        <c:if test="${fn:length(librarianRecommendList) > 0}">
            <c:forEach items="${librarianRecommendList}" var="i">
                <div class="recBookSlideItem">
                    <div class="recBookImgWrap">
                        <c:choose>
                            <c:when test="${i.preview_img ne null}">
                                <c:choose>
                                    <c:when test="${fn:contains(i.preview_img, 'https')}">
                                        <img src="${i.preview_img}" alt="${i.title}" title="${i.title}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/ict/typeD/common/img/common/dummy.png" alt="${i.title}" title="${i.title}"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <img alt="${i.title}" src="/resources/ict/typeD/common/img/common/dummy.png"/>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="recBookInfo">
                        <div class="recBookTitle">${i.title}</div>
                        <div class="recBookAuthor">${i.imsi_v_3}</div>
                        <div class="recBookPublisher">${i.imsi_v_4}</div>
                        <div class="recBookYear">${i.imsi_v_1.split('-')[0]}</div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        </div>
    </div>
    <div class="recBookCopyright">YEONGYANG Public Library</div>
</div>
</body>
</html>
