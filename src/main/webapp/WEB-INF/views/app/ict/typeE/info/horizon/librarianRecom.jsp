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
    <link href="/resources/ict/typeE/info/css/librarianRecom.css?v=20251210" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/librarianRecom.js?v=1.2" type="text/javascript"></script>

</head>
<body>
<div class="Container">
    <div class="slideContainer">
        <div class="libHeader">
            <div class="libHeaderEn">librarian Recommended BOOK</div>
            <div class="libHeaderKo" style="color: #fff">사서추천도서</div>
        </div>
        <c:if test="${fn:length(librarianRecommendList) < 1}">
            <div class="lib_notice_nodata_wrapper">
                <img alt="" src="/resources/ict/common/img/Astronaut.gif" />
                <div>등록된 책 소개가 없어요</div>
            </div>
        </c:if>
    
        <div class="slideItemWrapper">
            <c:if test="${fn:length(librarianRecommendList) > 0}">
                <c:forEach items="${librarianRecommendList}" var="i">
                        <div class="slideItem">
                            <div class="bookImage">
                                <c:choose>
                                    <c:when test="${i.preview_img eq ''}">
                                        <img src="/resources/ict/common/img/noimg.png"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${i.preview_img}"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="bookInfo">
                                <div class="bookTitle">${i.title}</div>
                                <div class="bookAuthor">${i.imsi_v_3}</div>
                            </div>
                        </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
    <div class="libCopyright">Yecheon Public Library</div>
</div>

</body>
</html>