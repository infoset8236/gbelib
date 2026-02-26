<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <title>공지사항</title>
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/type_b/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/type_b/notice.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskVertical/js/type_b/info/notice.js" type="text/javascript"></script>
</head>

<body>
    <style>
        .no_wrapper img {
            margin: 0 0 88px 0;
        }

        .selected-item img {
            box-shadow: unset;
        }

        .selected-item .swiper-slide-active img {
            box-shadow: 30px 40px 60px 0 rgba(0, 0, 0, 0.2);
        }
        
        .swiper-pagination.swiper-pagination-lock {
  display: block !important; /* Pagination 강제 활성화 */
}


        @media (max-width: 1080px) {

            .no_wrapper img {
                margin: 0 0 44px 0;
            }

            .selected-item img {
                box-shadow: unset;
            }

            .selected-item .swiper-slide-active img {
                box-shadow: 15px 20px 30px 0 rgba(0, 0, 0, 0.2);
            }
        }

    </style>
    <div class="container info">
        <div class="top">
            <div class="header">
                <p>NOTICE</p>
                <h1>공지사항</h1>
            </div>

            <c:if test="${fn:length(noticeList) < 1}">
                <div class="no_content">
                    <div class="no_wrapper">
                        <img src="/resources/ict/common/img/Astronaut.gif" alt="">
                        <h3>오늘은 공지사항이 없어요</h3>
                    </div>
                </div>
            </c:if>

            <div class="swiper notice-slide selected-item">
                <div class="swiper-wrapper">
                    <c:forEach items="${noticeList}" var="i" varStatus="status">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <div class="swiper-slide">
                                    <img alt="" src="/resources/ict/common/img/noimg.png" />
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="swiper-slide">
                                    <img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:forEach items="${eventList}" var="i" varStatus="status">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <div class="swiper-slide">
                                    <img alt="" src="/resources/ict/common/img/noimg.png" />
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="swiper-slide">
                                    <img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
            <div class="swiper notice-slide-thumbs slider">
                <div class="swiper-wrapper">
                    <c:forEach items="${noticeList}" var="i" varStatus="status">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <div class="swiper-slide">
                                    <img alt="" src="/resources/ict/common/img/noimg.png" />
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="swiper-slide">
                                    <img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:forEach items="${eventList}" var="i" varStatus="status">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <div class="swiper-slide">
                                    <img alt="" src="/resources/ict/common/img/noimg.png" />
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="swiper-slide">
                                    <img class="notice_img" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/vertical/userNav.jsp" />

    <jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/vertical/nav.jsp" />

</body>


</html>
