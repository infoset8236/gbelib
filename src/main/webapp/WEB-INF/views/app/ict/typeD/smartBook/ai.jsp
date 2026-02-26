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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/ai/css/index.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <script src="/resources/ict/typeD/ai/js/index.js?v=1.2"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script>
        $(function () {
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

                <div class="intro">
                    <div class="title" tabindex="0">
                        <div>찾고 싶을땐? <br>AI에게 물어보세요</div>
                        <div>도서추천부터 안내까지 <br>AI가 친절히 답해드려요</div>
                    </div>
                    <div class="character"></div>
                    <div class="shadow"></div>
                </div>

                <label for="search" class="form">
                    <input type="text" tabindex="0" aria-label="질문 내용을 작성해 주세요" placeholder="질문 내용을 작성해 주세요" id="search">
                    <button></button>
                </label>

                <div class="caption">이렇게 질문을 해보세요</div>

                <ul class="example">
                    <li tabindex="0" class="key">
                        <div>아이와 같이 책을 볼 수 있는 공간이 어디 있을까?</div>
                        <a></a>
                    </li>
                    <li tabindex="0" class="key">
                        <div>도서관에 책 읽을 수 있는 카페나 휴게공간이 있어?</div>
                        <a></a>
                    </li>
                    <li tabindex="0" class="key">
                        <div>역사와 관련된 책을 찾으려면 어디로 가야 해?</div>
                        <a></a>
                    </li>
                    <li tabindex="0" class="key">
                        <div>책을 예약하거나 연장하려면 어떻게 해야 해?</div>
                        <a></a>
                    </li>
                    <li tabindex="0" class="key">
                        <div>세계사 책을 빌리려면 어떤 서가를 찾아야 하지?</div>
                        <a></a>
                    </li>
                    <li tabindex="0" class="key">
                        <div>조용히 공부할 수 있는 공간은 어디에 있을까?</div>
                        <a></a>
                    </li>
                </ul>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smartBook/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
