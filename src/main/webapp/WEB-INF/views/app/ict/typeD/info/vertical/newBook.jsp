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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/newBook.css?v=20251125">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/newBook.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>새로 온 책</title>
</head>
<body>
<div class="newBookSection">
    <div class="header">
        <div class="headerEn">NEW BOOK</div>
        <div class="headerKo">새로 온 책</div>
    </div>
    <c:if test="${fn:length(newBookList.dsNewBookList) < 1}">
        <div class="lbEmpty">
            <img alt="" src="/resources/ict/info/img/nodata.gif" />
            <div>등록된 책 소개가 없어요</div>
        </div>
    </c:if>
    <c:if test="${fn:length(newBookList.dsNewBookList) > 0}">
        <div class="content">
            <div class="leftPane">
                <div class="mainSlide">
                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="s">
                        <div class="slideItem" data-index="${s.index}" style="display:${s.first?'block':'none'};">
                            <div class="slideImg">
                                <img src="${i.COVER_SMALLURL}"
                                     onerror="this.src='/resources/ict/typeD/common/img/common/dummy.png'" alt="책 표지">
                            </div>
                            <div class="slideTxt">
                                <div class="slideInfo">
                                    <div class="slideAuthor">${fn:escapeXml(i.AUTHOR)}</div>
                                    <div class="slideSeparator">ㆍ</div>
                                    <div class="slidePublisher">${fn:escapeXml(i.PUBLER)}</div>
                                </div>
                                <div class="slideTitle">${fn:escapeXml(i.TITLE)}</div>
                                <div class="slideDesc">
                                    ${empty i.contentsDetail ? '등록된 책 소개가 없어요' : fn:escapeXml(i.contentsDetail)}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="rightPane">
                <div class="subSlide">
                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="s">
                        <div class="slideItem ${s.first ? 'active' : ''}" data-index="${s.index}">
                            <div class="slideImg">
                                <img src="${i.COVER_SMALLURL}"
                                     onerror="this.src='/resources/ict/typeD/common/img/common/dummy.png'" alt="썸네일">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:if>
    <div class="newBookCopyright">YEONGYANG Public Library</div>
</div>
</html>
