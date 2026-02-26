<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/smart/css/detail.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeE/smart/js/detail.js?v=1.3"></script>
    <script src="/resources/ict/typeE/smart/js/bf.js"></script>
    <script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<script>
</script>
<body>

<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>book information</div>
                <div tabindex="0">도서정보</div>
            </div>
            <div class="content">
                <div class="mainBookList">
                    <div class="mainBookListItem">
                        <div class="bookInformation">
                                <div class="mainBookImage">
                                    <c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
                                        <div tabindex="0">대출<br>가능</div>
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
                                <div>
                                <div class="mainBookTitle" tabindex="0">
                                    ${fn:escapeXml(detail.dsItemDetail[0].TITLE)}
                                </div>
                                <div class="mainBookAuthor" tabindex="0">${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</div>
                                <div class="mainBookMeta">
                                    <div tabindex="0">
                                        발행년도
                                        <span>${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</span>
                                    </div>
                                    <div tabindex="0">
                                        ISBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>${fn:escapeXml(detail.dsItemDetail[0].ISBN)}</span>
                                    </div>
                                    <div tabindex="0">
                                        소장위치
                                        <span>${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</span>
                                    </div>
                                    <div tabindex="0">
                                        청구기호
                                        <span>${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</span>
                                    </div>
                                </div>
                                    <a href="javascript:void(0);"
                                       class="trigger bookDetail"
                                       data-type="detail"
                                       data-title="${fn:escapeXml(detail.dsItemDetail[0].TITLE)}"
                                       data-publisher="${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}"
                                       data-callno="${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}"
                                       data-acsson="${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}"
                                       data-author="${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}"
                                       data-subloca="${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}">
                                        서지정보보기
                                    </a>
                            </div>
                        </div>

                        <div class="mainBookDesc" tabindex="0">
                            <div>책소개</div>
                            <c:if test="${empty detail.dsItemDetail[0].contentsDetail}">
                                <div class="noData">
                                    등록된 책소개가 없어요
                                </div>
                            </c:if>
                            <div>
                                ${detail.dsItemDetail[0].contentsDetail}
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
                        <div class="mainBookListItem" >
                            <div class="bookInformation">
                                <div class="mainBookImage">
                                    <img src="${i.COVER_SMALLURL}" onerror="this.src='/resources/ict/typeE/common/img/common/dummy.png'" alt="">
                                </div>
                                <div>
                                    <div class="mainBookTitle">
                                            ${i.TITLE}
                                    </div>
                                    <div class="mainBookAuthor">${i.AUTHOR}</div>
                                    <div class="mainBookMeta">
                                        <div tabindex="0">
                                            발행년도
                                            <span>${fn:escapeXml(i.PUBLER_YEAR)}</span>
                                        </div>
                                        <div tabindex="0">
                                            ISBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>${i.ISBN}</span>
                                        </div>
                                        <div tabindex="0">
                                            소장위치
                                            <span>${i.LOCA_NAME}</span>
                                        </div>
                                        <div tabindex="0">
                                            청구기호
                                            <span>${fn:escapeXml(i.CALL_NO)}</span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);"
                                       class="trigger bookDetail"
                                       data-type="newDetail"
                                       data-title="${fn:escapeXml(i.TITLE)}"
                                       data-publisher="${fn:escapeXml(i.PUBLER)}"
                                       data-callno="${fn:escapeXml(i.CALL_NO)}"
                                       data-acsson="${fn:escapeXml(i.CTRLNO)}"
                                       data-author="${fn:escapeXml(i.AUTHOR)}"
                                       data-subloca="${fn:replace(fn:escapeXml(i.LOCA_NAME), '(신관)', '')}">
                                        서지정보보기
                                    </a>
                                </div>
                            </div>

                            <div class="mainBookDesc" tabindex="0">
                                <div>책소개</div>
                                <div class="noData">
                                    ${empty i.contentsDetail ? '등록된 책소개가 없습니다.' : i.contentsDetail}
                                </div>
                                <div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="bookList">
<%--                    <div class="book" tabindex="0" data-loca="${detail.dsItemDetail[0].LOCA}" data-ctrlno="${detail.dsItemDetail[0].CTRLNO}">--%>
<%--                        <div>--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${detail.dsItemDetail[0].IMAGE_URL eq ''}">--%>
<%--                                    <img src="/resources/ict/typeD/common/img/common/dummy.png" alt=""--%>
<%--                                         class="bookImage">--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <img src="${detail.dsItemDetail[0].IMAGE_URL}" alt="" class="bookImage">--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                            <div class="bookTitle" tabindex="0">${detail.dsItemDetail[0].TITLE}</div>--%>
<%--                            <div class="bookAuthor" tabindex="0">${detail.dsItemDetail[0].AUTHOR}</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
                        <div class="book" tabindex="0" data-loca="${i.LOCA}" data-ctrlno="${i.CTRLNO}">
                            <div>
                                <c:choose>
                                    <c:when test="${i.COVER_SMALLURL eq ''}">
                                        <img src="/resources/ict/typeE/common/img/common/dummy.png" alt=""
                                             class="bookImage">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${i.COVER_SMALLURL}" alt="" class="bookImage">
                                    </c:otherwise>
                                </c:choose>
                                <div class="bookTitle" tabindex="0">${i.TITLE}</div>
                                <div class="bookAuthor" tabindex="0">${i.AUTHOR}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="back" onclick="history.back();"></div>
            <jsp:include page="/WEB-INF/views/app/ict/typeE/smartBook/nav.jsp"/>
        </div>
    </div>
    <div id="popup" class="popup">
        <div class="popupContent">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명&nbsp;&nbsp;<span class="popup_content1"></span></div>
                            <div>출판사&nbsp;<span class="popup_content2"></span></div>
                            <div>청구기호<span class="popup_content3"></span></div>
                            <div>등록번호<span class="popup_content4"></span></div>
                            <div>저자<span class="popup_content5"></span></div>
                            <div>자료위치<span class="popup_content6"></span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnWrapper">
                <button class="close" tabindex="0" >닫기</button>

                <c:set var="remoteAddr" value="<%=request.getRemoteAddr()%>"/>
                <c:if test="${remoteAddr ne '10.204.27.27'}">
                    <button class="print" tabindex="0" >인쇄</button>
                </c:if>
            </div>
        </div>
    </div>

    <div style="display: none">
        <div class="popupContent printContent">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명:&nbsp;<span class="popup_content1"> ${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</span></div>
                            <div>출판사:&nbsp;<span class="popup_content2"> ${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</span></div>
                            <div>청구기호:&nbsp;<span class="popup_content3"> ${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</span></div>
                            <div>등록번호:&nbsp;<span class="popup_content4"> ${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}</span></div>
                            <div>저자:&nbsp;<span class="popup_content5"> ${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</span></div>
                            <div>자료위치:&nbsp;<span class="popup_content6"> ${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}</span></div>
                            <br/>
                            <div>=======================</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeE/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
<script>
    function goDetail(LOCA, CTRLNO) {
        $('#verDetailForm #vLoca').val(LOCA);
        $('#verDetailForm #vCtrl').val(CTRLNO);
        $('form#verDetailForm').submit();

        $(".loadingOverlay").fadeIn(100);
        $(".loadingOverlay").fadeOut(100);
    }
</script>

</html>
