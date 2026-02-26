<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/detail.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.4"></script>
    <script src="/resources/ict/typeD/smart/js/detail.js?v=1.7"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<script>
    $(function (){
        let shelf = getShelfName('${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}', '${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}','${fn:escapeXml(detail.dsItemDetail[0].LABEL_PLACE_NO_NAME)}');

        let shelfName = shelf.shelf;
        let imageFile = "K_" + shelf.floor + "_" + shelf.number + ".png";
        let printImageFile = "P_" + shelf.floor + "_" + shelf.number + ".bmp";
        let imageRoot = "/resources/ict/typeD/common/img/common/dummy.png";
        let printImageRoot = "/resources/ict/typeD/common/img/common/dummy.png";

        if (shelfName === '(신관)보존서고') {
            $('.metaSection').css("display", 'inline-block');
            $('.metaSection').text('※ 데스크에 문의 바랍니다');
            shelfName = shelfName.replaceAll("(신관)","");
        } else {
            $('.metaSection').css("display", 'none');
            imageRoot = "/resources/ict/typeD/common/img/common/kiosk/" + shelf.floor + "/" + imageFile;
            printImageRoot = "/resources/ict/typeD/common/img/common/print/" + shelf.floor + "/" + printImageFile;
        }

        if (shelf.number === "-1") {
            $(".mapImage").css("display", "none");
        } else {
            $(".mapImage").css("display", 'inline-block');
        }

        $(".mapImage").attr("src", imageRoot);
        $(".printMapImage").attr("src", printImageRoot);
        $(".metaFloor").html(shelfName ? shelfName : '${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}');
    })
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
                                        <img src="/resources/ict/typeD/common/img/common/dummy.png" alt="">
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
                                        INBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>${fn:escapeXml(detail.dsItemDetail[0].ISBN)}</span>
                                    </div>
                                    <div tabindex="0">
                                        소장위치
                                        <span>${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME),'(신관)','')}</span>
                                    </div>
                                    <div tabindex="0">
                                        청구기호
                                        <span>${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</span>
                                    </div>
                                </div>
                                <a href="javascript:void(0);" class="trigger" onclick="">서가위치보기</a>
                            </div>
                        </div>

                        <div class="mainBookDesc" tabindex="0">
                            <div>책소개</div>
                            <div>
                                ${empty detail.dsItemDetail[0].contentsDetail ? '등록된 책소개가 없습니다.' : detail.dsItemDetail[0].contentsDetail}
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
                        <div class="mainBookListItem">
                            <div class="bookInformation">
                                <div class="mainBookImage">
                                    <img src="${i.COVER_SMALLURL}" onerror="this.src='/resources/ict/typeD/common/img/common/dummy.png'" alt="">
                                </div>
                                <div>
                                    <div class="mainBookTitle">
                                        ${i.TITLE}
                                    </div>
                                    <div class="mainBookAuthor">${i.AUTHOR}</div>
                                    <div class="mainBookMeta">
<%--                                        <div tabindex="0">--%>
<%--                                            발행년도--%>
<%--                                            <span>${fn:escapeXml(i.PUBLISHER_YEAR)}</span>--%>
<%--                                        </div>--%>
                                        <div tabindex="0">
                                            INBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>${i.ISBN}</span>
                                        </div>
                                        <div tabindex="0">
                                            소장위치
                                            <span>영양도서관</span>
                                        </div>
                                        <div tabindex="0">
                                            청구기호
                                            <span>${fn:escapeXml(i.CALL_NO)}</span>
                                        </div>
                                    </div>
<%--                                    <a href="javascript:void(0);" class="trigger" onclick="seogaQR('${i.reg_no}', '${i.manage_code}');" tabindex="0">서가위치보기</a>--%>
                                </div>
                            </div>

                            <div class="mainBookDesc" tabindex="0">
                                <div>책소개</div>
                                <div>
                                    ${empty i.contentsDetail ? '등록된 책소개가 없습니다.' : i.contentsDetail}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                    <div class="bookList">
                        <div class="book" tabindex="0">
                            <div>
                                <c:choose>
                                    <c:when test="${detail.dsItemDetail[0].IMAGE_URL eq ''}">
                                        <img src="/resources/ict/typeD/common/img/common/dummy.png" alt=""
                                             class="bookImage">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${detail.dsItemDetail[0].IMAGE_URL}" alt="" class="bookImage">
                                    </c:otherwise>
                                </c:choose>
                                <div class="bookTitle" tabindex="0">${detail.dsItemDetail[0].TITLE}</div>
                                <div class="bookAuthor" tabindex="0">${detail.dsItemDetail[0].AUTHOR}</div>
                            </div>
                        </div>
                        <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
                            <div class="book" tabindex="0">
                                <div>
                                    <c:choose>
                                        <c:when test="${i.COVER_SMALLURL eq ''}">
                                            <img src="/resources/ict/typeD/common/img/common/dummy.png" alt=""
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
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smartBook/nav.jsp"/>
        </div>
    </div>
    <div id="popup" class="popup">
        <div class="popupContent">
            <img class="mapImage" src="/resources/ict/typeD/common/img/common/dummy.png" alt="">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명&nbsp;&nbsp;&nbsp;&nbsp;<span>${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</span></div>
                            <div>소장위치<span>${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}</span></div>
                            <div>청구기호<span>${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</span></div>
                        </div>
                        <div class="metaShelf">
                            <div class="metaShelfLabel">서가번호</div>
                            <div class="metaShelfNum" style="display: flex; flex-direction: column; align-items: flex-end">
                                <div class="metaFloor" style="font-size: 2.625rem"></div>
                                <div class="metaSection" style="font-size:1.625rem; display: none">21</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="btnWrapper">
                <button class="close" tabindex="0" >닫기</button>
                <c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
                    <button class="print" tabindex="0" >인쇄</button>
                </c:if>
            </div>
        </div>
    </div>

    <div style="display: none">
        <div class="popupContent printContent">
            <img class="mapImage printMapImage" src="/resources/ict/typeD/common/img/common/dummy.png" alt="">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>서명:&nbsp;<span> ${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</span></div>
                            <div>출판사:&nbsp;<span> ${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</span></div>
                            <div>청구기호:&nbsp;<span> ${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</span></div>
                            <div>등록번호:&nbsp;<span> ${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}</span></div>
                            <div>저자:&nbsp;<span> ${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</span></div>
                            <div>자료위치:&nbsp;<span> ${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}</span></div>
                            <div>서가명:&nbsp;<span class="metaFloor"></span> <span class="metaSection"></span></div>
                            <br/>
                            <div>=======================</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>

</html>
