<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/smart/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/ai/css/detail.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeE/smart/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script>
        $(function (){
            if (typeof keyPadController !== "undefined" && keyPadController) {
                bodyOpen()
            }
        })
    </script>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="content">
                <div class="header" tabindex="0">AI안내</div>

                <div class="bookInformationBox">
                    <div class="bookImage">
                        <c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
                            <div class="status1" tabindex="0">대출가능</div>
                        </c:if>
                        <c:choose>
                            <c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
                                <img src="/resources/ict/typeE/common/img/common/dummy.png" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="bookDetailBox">
                        <div class="bookTitle">
                            <div tabindex="0">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
                            <div tabindex="0">${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}<span></span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</div>
                        </div>

                        <div class="bookMeta" >
                            <div tabindex="0"><span>출판사</span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</div>
                            <div tabindex="0"><span>소장도서관</span> ${fn:escapeXml(detail.dsItemDetail[0].LOCA_NAME)}</div>
                            <div tabindex="0"><span>서가위치</span>${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}</div>
                            <div tabindex="0"><span>등록번호</span>${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}</div>
                            <div tabindex="0"><span>청구기호</span> ${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</div>
                        </div>
                    </div>
                </div>

                <div class="recommendBox">
                    <div tabindex="0">AI 추천이유</div>
                    <div tabindex="0">
                        ${detail.reason}
                    </div>
                </div>
            </div>
            <div class="back" onclick="history.back();"></div>
            <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
            <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp"/>

        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeE/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
