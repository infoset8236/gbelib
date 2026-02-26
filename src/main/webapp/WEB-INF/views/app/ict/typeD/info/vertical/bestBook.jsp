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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/bestBook.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/info/js/bestBook.js?v=20251125" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>베스트도서</title>
</head>
<body>
<div class="bestBookSection">
    <div class="header">
        <div class="headerEn">BEST BOOK</div>
        <div class="headerKo">베스트도서</div>
    </div>

    <div class="content">
        <c:if test="${fn:length(bestBookList.dsLoanBestList) < 1}">
            <div class="lbEmpty">
                <img alt="" src="/resources/ict/info/img/nodata.gif" />
                <div>등록된 책 소개가 없어요</div>
            </div>
        </c:if>
        <c:if test="${fn:length(bestBookList.dsLoanBestList) > 0}">
            <div class="bookSlide">
                <c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status">
                <div class="bookItem">
                    <div class="bookRankImg">
                        <div class="rankImg">
                            <c:choose>
                                <c:when test="${i.COVER_SMALLURL eq ''}">
                                    <img src="/resources/ict/typeD/common/img/common/dummy.png" />
                                </c:when>
                                <c:otherwise>
                                    <img src="${i.COVER_SMALLURL}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="rankNum">${status.count}위</div>
                    </div>
                    <div class="bookInfo">
                        <div class="bookTitle">${i.TITLE}</div>
                        <div class="bookAuthor">${i.AUTHOR}</div>
                        <div class="bookPubYear">
                            <div class="publisher">${i.PUBLER}</div>
                            <div class="separator">ㆍ</div>
                            <div class="pubYear">${i.PUBLER_YEAR}</div>
                        </div>
                        <div class="bookMeta">
                            <div class="mataInfo">
                                <div class="metaLabel">소장위치</div>
                                <div class="metaValue">${i.SUB_LOCA_NAME}</div>
                            </div>
                            <div class="mataInfo">
                                <div class="metaLabel">청구기호</div>
                                <div class="metaValue">${i.CALL_NO}</div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
    <div class="bestBookCopyright">YEONGYANG Public Library</div>
</div>

</body>
</html>
