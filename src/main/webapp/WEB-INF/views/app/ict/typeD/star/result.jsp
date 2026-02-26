<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/navigation.css?v=1.3">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/result.css?v=1.3">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/star/js/result.js"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>Find My Constellation</div>
                <div tabindex="0">나의별자리</div>
            </div>
            <div class="content">
                <div class="shootingStar">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="zodiacSign"></div>
                <div class="info">
                    <div class="en"></div>
                    <div class="ko"></div>
                    <div class="myBirth">내가 태어난 날 <span></span></div>
                    <div class="caption">별자리가 말해주는<br>'나'는 어떤 사람일까요?</div>
                    <div class="description"></div>
                </div>
                <div class="action">
                    <a href="/${homepage.context_path}/ict/star/myStar.do">다시하기</a>
                    <a href="/${homepage.context_path}/ict/star/guide.do">별자리이야기 보러가기</a>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/star/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>

