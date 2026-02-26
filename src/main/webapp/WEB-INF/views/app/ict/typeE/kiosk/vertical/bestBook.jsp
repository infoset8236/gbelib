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
    <link href="/resources/ict/typeE/kiosk/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/ulStyle.css?v=20251210" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/bestBook.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/bookSlide.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/kiosk/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/lib.js" type="text/javascript"></script>
    <link href="/resources/ict/typeE/common/css/common.css" rel="stylesheet" type="text/css " />
    <script defer src="/resources/ict/kioskVertical/js/type_b/info/common/navigation.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
</head>


<body>
<script type="text/javascript">
    function goDetail(e, LOCA, CTRLNO) {
        e.preventDefault();
        e.stopPropagation();

        $('#verDetailForm #vLoca').val(LOCA);
        $('#verDetailForm #vCtrl').val(CTRLNO);
        $('#verDetailForm').submit();
    }

    $(document).ready(function () {

        $("#loading").show();


        setTimeout(function () {
            $("#loading").fadeOut();
        }, 3000);
    });

</script>
<form:form modelAttribute="librarySearch" id="verDetailForm" action="detail.do" method="post">
    <input type="hidden" id="vLoca" name="vLoca"/>
    <input type="hidden" id="vCtrl" name="vCtrl"/>
</form:form>
<div class="dim">
    <div class="lib_best_container" id="container">
        <div class="libHeader">
            <div class="libHeaderEn">Best book</div>
            <div class="libHeaderKo" style="color: #FFF">인기도서</div>
        </div>
        <c:if test="${fn:length(bestBookList.dsLoanBestList) < 1}">

            <div class="lib_notice_nodata_wrapper">
                <img alt="" src="/resources/ict/typeE/info/img/nodata.gif" />
                <div>등록된 책 소개가 없어요</div>
            </div>

        </c:if>
        <c:if test="${fn:length(bestBookList.dsLoanBestList) > 0}">
            <div class="lib_best_swiper">
                <div class="swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="0"
                                       end="4">
                                <div class="swiper-item" onclick="goDetail(event, '${i.LOCA}', '${i.CTRLNO}');">
                                    <div class="lib_best_ranking">0${status.count}</div>
                                    <c:choose>
                                        <c:when test="${i.COVER_SMALLURL eq ''}">
                                            <img src="/resources/ict/typeD/common/img/common/dummy.png" />
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${i.COVER_SMALLURL}" />
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="lib_best_title">${i.TITLE}</div>
                                    <div class="lib_best_writer">${i.AUTHOR} / ${i.PUBLER}</div>
                                    <!--<div class="lib_best_year">${i.PUBLER_YEAR}</div>-->
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-slide">
                            <c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="5"
                                       end="9">
                                <div class="swiper-item" onclick="goDetail(event, '${i.LOCA}', '${i.CTRLNO}');">
                                    <div class="lib_best_ranking">
                                        <fmt:formatNumber value="${status.count + 5}" pattern="00" />
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.COVER_SMALLURL eq ''}">
                                            <img src="/resources/ict/typeD/common/img/common/dummy.png" />
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${i.COVER_SMALLURL}" />
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="lib_best_title">${i.TITLE}</div>
                                    <div class="lib_best_writer">${i.AUTHOR} / ${i.PUBLER}</div>
                                    <!--                            <div class="lib_best_year">${i.PUBLER_YEAR}</div>-->
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </c:if>
        <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
        <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp" />
    </div>
</div>
</body>

<script>
    $.event.special.mousewheel = {
        setup: function (_, ns, handle) {
            this.addEventListener('mousewheel', handle, {
                passive: true,
            });
        },
    };

    jQuery.event.special.wheel = {
        setup: function (_, ns, handle) {
            this.addEventListener('wheel', handle, {
                passive: true,
            });
        },
    };
    jQuery.event.special.mousewheel = {
        setup: function (_, ns, handle) {
            this.addEventListener('mousewheel', handle, {
                passive: true,
            });
        },
    };
</script>
</html>