<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
    <meta content="ie=edge" http-equiv="X-UA-Compatible" />
    <link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/smartBook/css/type_a/styles.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
    <link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/smartBook/js/type_a/script.js" type="text/javascript"></script>
    <title>스마트 도서 A 타입</title>
</head>
<body>
<div class="common_content">
    <div class="common_header_wrapper">
        <div class="common_header_kr">도서정보</div>
        <div class="common_header_en">BOOK INFORMATION</div>
    </div>
    <div class="information_content_wrapper">
        <!--	selected item area		-->
        <div class="information_top_wrapper">
            <div class="information_selected_item_wrapper">
                <c:choose>
                    <c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
                        <img src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
                    </c:when>
                    <c:otherwise>
                        <img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
                    </c:otherwise>
                </c:choose>
                <c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
                    <div>대출<br />가능</div>
                </c:if>
            </div>
            <div class="information_selected_book_title">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
        </div>
        <div class="information_left_wrapper">
            <div class="information_selected_book_detail">
                <div class="information_selected_book_detail_item_wrapper">
                    <div class="information_selected_book_detail_item"><span>저자명</span>${fn:substring(fn:escapeXml(detail.dsItemDetail[0].AUTHOR), 0, 11)}<c:if test="${fn:length(fn:escapeXml(detail.dsItemDetail[0].AUTHOR)) > 11}">...</c:if></div>
                    <div class="information_selected_book_detail_item"><span>출판사</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</div>
                    <div class="information_selected_book_detail_item"><span>발행년</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</div>
                </div>
                <div class="information_selected_book_detail_item_wrapper">
                    <div class="information_selected_book_detail_item"><span>서가위치</span>${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</div>
                    <div class="information_selected_book_detail_item"><span>청구기호</span>${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</div>
                    <div class="information_selected_book_detail_item"><span>등록번호</span>${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}</div>
                </div>
            </div>
            <!--	popup trigger btn		-->
            <div class="information_popup_trigger">소장도서 서가위치보기</div>
            <!-- Popup structure -->
            <div class="information_popup_overlay" style="display: none">
                <div class="information_popup_wrapper">
                    <div class="information_popup_header">
                        <div>서가위치 정보</div>
                    </div>
                    <!-- Popup content -->
                    <img alt="" class="information_popup_content" src="/resources/ict/img/type_a/dummy_map.svg" />
                    <!-- Popup action -->
                    <div class="information_popup_action">
                        <div class="information_popup_close">
                            <div class="information_popup_close_icon"></div>
                            <div class="information_popup_close_text">닫기</div>
                        </div>
                        <div class="information_popup_print">
                            <div class="information_popup_print_icon"></div>
                            <div class="information_popup_print_text">인쇄</div>
                        </div>
                    </div>
                </div>
            </div>
            <!--	book summary		-->
            <div class="information_book_summary_wrapper">
                <div class="information_book_summary_title">책소개</div>
                <div class="information_book_summary_content">
                    ${kakaoResult}
                </div>
            </div>
            <div class="information_bestseller_title_wrapper">
                <div class="information_bestseller_title_icon"></div>
                <div class="information_bestseller_title_text">신착도서를 소개합니다.</div>
            </div>
            <div class="swiper information_swiper">
                <div class="swiper-wrapper">
                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
                        <div class="swiper-slide">
                            <div class="slide-item">
                                <c:choose>
                                    <c:when test="${i.COVER_SMALLURL eq ''}">
                                        <img src="/resources/ict/common/img/noimg.png" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${i.COVER_SMALLURL}" />
                                    </c:otherwise>
                                </c:choose>
                                <div class="information_slide_book_title">${i.TITLE}</div>
                                <div class="information_ranking">${status.count}위</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
    </div>
    <div class="common_back_btn" onclick="history.back();">
        <div class="common_back_btn_icon"></div>
        <div class="common_back_btn_text">이전</div>
    </div>

    <jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

</div>
</body>
</html>
