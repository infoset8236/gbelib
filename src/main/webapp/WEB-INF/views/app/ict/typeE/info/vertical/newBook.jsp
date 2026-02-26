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
    <link href="/resources/ict/typeE/info/css/newBook.css?v=20251210" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/newBook.js?v=20251211" type="text/javascript"></script>
</head>
<body>

<div class="libNewContainer">
    <div class="libHeader">
        <div class="libHeaderEn">NEW book</div>
        <div class="libHeaderKo" style="color: #fff">신착도서</div>
    </div>
    <c:if test="${fn:length(newBookList.dsNewBookList) < 1}">
        <div class="lib_notice_nodata_wrapper">
            <img alt="" src="/resources/ict/common/img/Astronaut.gif" />
            <div>등록된 책 소개가 없어요</div>
        </div>
    </c:if>
    <c:if test="${fn:length(newBookList.dsNewBookList) > 0}">
    <div class="newBookMainSlide">
        <div class="mainSlideItemWrapper">
            <c:forEach items="${newBookList.dsNewBookList}" var="i">
            <div class="mainSlideItem">
                <div class="mainSlideImageWrapper">
                        <c:choose>
                            <c:when test="${i.COVER_SMALLURL eq ''}">
                                <img src="/resources/ict/common/img/noimg.png" />
                            </c:when>
                            <c:otherwise>
                                <img src="${i.COVER_SMALLURL}" />
                            </c:otherwise>
                        </c:choose>
                </div>
                <div class="mainSlideInfo">
                    <div class="bookTitle">${i.TITLE}</div>
                    <div class="bookMetaList">
                        <ul>
                            <li>
                                <div class="metaLabel">저자명</div>
                                <div class="metaValue">${i.AUTHOR}</div>
                            </li>
                            <li>
                                <div class="metaLabel">발행년도</div>
                                <div class="metaValue">2025</div>
                            </li>
                            <li>
                                <div class="metaLabel">출판사</div>
                                <div class="metaValue">${i.PUBLER}</div>
                            </li>
                            <li>
                                <div class="metaLabel">소장위치</div>
                                <div class="metaValue">2F 종합자료실</div>
                            </li>
                        </ul>
                    </div>
                    <div class="bookDescription">
                        <c:if test="${empty i.contentsDetail}">
                            등록된 책 소개가 없어요
                        </c:if>
                        ${i.contentsDetail}
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

    <div class="subSlide">
            <div class="subSlideImageWrapper">
        <c:forEach items="${newBookList.dsNewBookList}" var="i">
                <div class="subSlideItem">
                    <c:choose>
                        <c:when test="${i.COVER_SMALLURL eq ''}">
                            <img src="/resources/ict/common/img/noimg.png" />
                        </c:when>
                        <c:otherwise>
                            <img src="${i.COVER_SMALLURL}" />
                        </c:otherwise>
                    </c:choose>
                </div>
        </c:forEach>
            </div>
    </div>
    </c:if>

    <div class="libCopyright">Yecheon Public Library</div>
</body>
</html>