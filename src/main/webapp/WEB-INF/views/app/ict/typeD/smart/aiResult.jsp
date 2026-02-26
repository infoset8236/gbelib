<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/ai/css/result.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.2"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
    <script src="/resources/ict/typeD/ai/js/result.js"></script>
    <script src="/resources/ict/typeD/ai/js/aiResult.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <script>
        let searchText  = "${searchText}"
    </script>
</head>
<body>

<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="content">
                <div class="header" tabindex="0">AI안내</div>
                <p class="commend" tabindex="0">“${searchText}”</p>

                <label for="search" class="searchArea">
                    <input class="key" tabindex="0" type="text" id="search" aria-label="검색어를 입력해주세요." placeholder="검색어를 입력해주세요.">
                    <button class="cancel" tabindex="0"></button>
                    <button class="submit" id="searchBtn" tabindex="0" aria-label="검색"></button>
                </label>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smart/nav.jsp"/>
        </div>
    </div>

    <div id="popup" class="popup">
        <div class="popupContent">
            <img class="mapImage"  src="/resources/ict/typeD/common/img/common/dummy.png" alt="">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명&nbsp;&nbsp;&nbsp;&nbsp;<span class="pBookName"></span></div>
                            <div>소장위치<span class="pSeoga"></span></div>
                            <div>청구기호<span class="pCallNo"></span></div>
                        </div>
                        <div class="metaShelf">
                            <div class="metaShelfLabel">서가번호</div>
                            <div class="metaShelfNum" style="display: flex; flex-direction: column; align-items: flex-end">
                                <div class="metaFloor" style="font-size: 2.625rem">${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}</div>
                                <div class="metaSection" style="font-size:1.625rem; display: none">21</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="btnWrapper">
                <button class="close" tabindex="0" >닫기</button>
                <button class="print" tabindex="0" >인쇄</button>
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
                            <div>서명:&nbsp;<span class="pBookName"></span></div>
                            <div>출판사:&nbsp;<span class="pPub"></span></div>
                            <div>청구기호:&nbsp;<span class="pCallNo"></span></div>
                            <div>등록번호:&nbsp;<span class="pAcssonNo"></span></div>
                            <div>저자:&nbsp;<span class="pAuthor"></span></div>
                            <div>자료위치:&nbsp;<span class="pSubLocaName"></span></div>
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
