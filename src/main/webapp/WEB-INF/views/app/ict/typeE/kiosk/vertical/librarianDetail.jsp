<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/type_b/common.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/resources/ict/kioskVertical/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/kioskVertical/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/kiosk/css/detail.css">
    <script src="/resources/ict/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/kioskVertical/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/kiosk/js/keyPadController.js"></script>
    <script src="/resources/ict/typeE/kiosk/js/common.js"></script>
    <script src="/resources/ict/typeE/kiosk/js/detail.js"></script>
    <script src="/resources/ict/common/js/bf.js"></script>
    <script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
    <script defer src="/resources/ict/kioskVertical/js/type_b/info/common/navigation.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
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
                    <c:forEach var="book" items="${bookDetail}">
                        <div class="mainBookListItem">
                            <div class="bookInformation">
                                <div class="mainBookImage">
                                    <c:if test="${book.LOAN_CODE eq 'OK'}">
                                        <div tabindex="0">대출<br>가능</div>
                                    </c:if>
                                    <img src="${fn:contains(book.IMAGE, 'noimg') ? '/resources/ict/typeE/kiosk/img/common/dummy.png' : book.IMAGE}" alt="" onerror="this.src='/resources/ict/typeE/kiosk/img/common/dummy.png'">
                                </div>
                                <div>
                                    <div class="mainBookTitle" tabindex="0">
                                        ${book.TITLE_INFO}
                                    </div>
                                    <div class="mainBookAuthor" tabindex="0">${book.AUTHOR}</div>
                                    <div class="mainBookMeta">
                                        <div tabindex="0">
                                            발행년도
                                            <span>${book.PUB_YEAR}</span>
                                        </div>
                                        <div tabindex="0">
                                            INBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>${book.ISBN}</span>
                                        </div>
                                        <div tabindex="0">
                                            소장위치
                                            <span>${book.SHELF_LOC_NAME}</span>
                                        </div>
                                        <div tabindex="0">
                                            청구기호
                                            <span>${book.CALL_NO}</span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="trigger" onclick="seogaQR('${book.REG_NO}', '${book.MANAGE_CODE}');">서가위치보기</a>
                                </div>
                            </div>

                            <div class="mainBookDesc" tabindex="0">
                                <div>책소개</div>
                                <div>
                                    ${book.DESCRIPTION}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${newBookList}" var="i" varStatus="status">
                        <div class="mainBookListItem">
                            <div class="bookInformation">
                                <div class="mainBookImage">
                                    <img src="${i.image}" onerror="this.src='/resources/ict/typeE/kiosk/img/common/dummy.png'" alt="">
                                </div>
                                <div>
                                    <div class="mainBookTitle">
                                        ${i.title}
                                    </div>
                                    <div class="mainBookAuthor">${i.author}</div>
                                    <div class="mainBookMeta">
                                        <div tabindex="0">
                                            발행년도
                                            <span>${i.publish_year}</span>
                                        </div>
                                        <div tabindex="0">
                                            INBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>${i.isbn}</span>
                                        </div>
                                        <div tabindex="0">
                                            소장위치
                                            <span>${i.shelf_loc_name}</span>
                                        </div>
                                        <div tabindex="0">
                                            청구기호
                                            <span>${i.call_no}</span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="trigger" onclick="seogaQR('${i.reg_no}', '${i.manage_code}');" tabindex="0">서가위치보기</a>
                                </div>
                            </div>

                            <div class="mainBookDesc" tabindex="0">
                                <div>책소개</div>
                                <div>
                                    ${i.description}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="bookList">
                    <c:forEach var="book" items="${bookDetail}">
                        <div class="book" tabindex="0">
                            <img src="${fn:contains(book.IMAGE, 'noimg') ? '/resources/ict/typeE/kiosk/img/common/dummy.png' : book.IMAGE}" alt="" onerror="this.src='/resources/ict/typeE/kiosk/img/common/dummy.png'" class="bookImage">
                            <div class="bookTitle" tabindex="0">
                                ${book.TITLE_INFO}
                            </div>
                            <div class="bookAuthor" tabindex="0">${book.AUTHOR}</div>
                        </div>
                    </c:forEach>

                    <c:forEach items="${newBookList}" var="i" varStatus="status">
                        <div class="book"  tabindex="0">
                            <img src="${i.image}" alt="" onerror="this.src='/resources/ict/typeE/kiosk/img/common/dummy.png'" class="bookImage">
                            <div class="bookTitle" tabindex="0">
                                ${i.title}
                            </div>
                            <div class="bookAuthor" tabindex="0">${i.author}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="back" onclick="history.back();"></div>
            <jsp:include page="/WEB-INF/views/app/ict/dglib/smart/nav.jsp"/>
        </div>
    </div>
    <div id="popup" class="popup">
        <div class="popupContent">
            <img class="mapImage" src="/resources/ict/dglib/smart/img/detail/dummy.png" alt="">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명&nbsp;&nbsp;&nbsp;&nbsp;<span>파타</span></div>
                            <div>소장위치<span>일반자료실</span></div>
                            <div>청구기호<span>813.8이560</span></div>
                        </div>
                        <div class="metaShelf">
                            <div class="metaShelfLabel">서가번호</div>
                            <div class="metaShelfNum">
                                <div class="metaFloor">1층</div>
                                <div class="metaSection">21</div>
                            </div>
                        </div>
                    </div>
                    <div class="qrSection">
                        <div class="qrTextWrap">
                            <div class="qrTitle">QR코드</div>
                            <div class="qrDescription">
                                휴대전화 카메라로 스캔하여<br>
                                서가 위치를 확인해보세요
                            </div>
                        </div>
                        <div class="qrImageWrap">
                            <img src="https://static.cdn.kmong.com/gigs/rate/uMiYP1601861960.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="btnWrapper">
                <button class="close" tabindex="0" >닫기</button>
            </div>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>

</html>
