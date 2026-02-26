<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
    <title>공지사항</title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/typeE/kiosk/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/slick.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/slick-theme.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/notice.css?v=200251221" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/nav.css?v=200251221" rel="stylesheet" type="text/css">
    <link href="/resources/ict/typeE/common/css/common.css" rel="stylesheet" type="text/css " />
    <script src="/resources/ict/typeE/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/kiosk/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/kiosk/js/notice.js" type="text/javascript"></script>
    <script defer src="/resources/ict/kioskVertical/js/type_b/info/common/navigation.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/kioskVertical/js/bf.js"></script>
</head>
<body>
<div class="dim">
    <div id="container">
        <div class="libNoticeContainer">
            <div class="libHeader">
                <div class="libHeaderEn">notice</div>
                <div class="libHeaderKo">공지사항</div>
            </div>
            <c:if test="${fn:length(noticeList) < 1}">
                <div class="lib_notice_nodata_wrapper">
                    <img alt="" src="/resources/ict/common/img/Astronaut.gif" />
                    <div>등록된 공지사항이 없어요</div>
                </div>
            </c:if>
            <c:if test="${fn:length(noticeList) > 0}">
                <div class="libNotice">
                    <div class="libNoticeMain">
                        <c:forEach items="${noticeList}" var="i" varStatus="status">
                            <div class="libNoticeSlide">
                                <c:choose>
                                    <c:when test="${empty i.preview_img}">
                                        <img alt="" src="/resources/ict/typeD/common/img/common/dummy.png" />
                                    </c:when>
                                    <c:otherwise>
                                        <img alt="" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}"
                                             onerror="this.onerror=null; this.src='/resources/ict/typeD/common/img/common/dummy.png';" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="libNoticeSub">
                        <c:forEach items="${noticeList}" var="i" varStatus="status">
                            <div class="libNoticeSlide">
                                <c:choose>
                                    <c:when test="${empty i.preview_img}">
                                        <img alt="" src="/resources/ict/typeD/common/img/common/dummy.png" />
                                    </c:when>
                                    <c:otherwise>
                                        <img alt="" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}"
                                             onerror="this.onerror=null; this.src='/resources/ict/typeD/common/img/common/dummy.png';" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
<jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp"/>
</body>
</html>