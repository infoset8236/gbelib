<%@ page language="java" pageEncoding="utf-8" %>
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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/ai/css/result.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/common/js/keyPadController.js?v=1.2"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.2"></script>
    <script src="/resources/ict/typeE/smart/js/bf.js"></script>
    <script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
    <script src="/resources/ict/typeD/ai/js/result.js"></script>
    <script src="/resources/ict/typeE/ai/js/aiResult.js"></script>
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
            <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
            <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp"/>

        </div>
    </div>

    <div id="popup" class="popup">
        <div class="popupContent">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명:&nbsp;<span class="pBookName"></span></div>
                            <div>출판사:&nbsp;<span class="pPub"></span></div>
                            <div>청구기호:&nbsp;<span class="pCallNo"></span></div>
                            <div>등록번호:&nbsp;<span class="pAcssonNo"></span></div>
                            <div>저자:&nbsp;<span class="pAuthor"></span></div>
                            <div>자료위치:&nbsp;<span class="pSubLocaName"></span></div>
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
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명:&nbsp;<span class="pBookName"></span></div>
                            <div>출판사:&nbsp;<span class="pPub"></span></div>
                            <div>청구기호:&nbsp;<span class="pCallNo"></span></div>
                            <div>등록번호:&nbsp;<span class="pAcssonNo"></span></div>
                            <div>저자:&nbsp;<span class="pAuthor"></span></div>
                            <div>자료위치:&nbsp;<span class="pSubLocaName"></span></div>
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
</html>
