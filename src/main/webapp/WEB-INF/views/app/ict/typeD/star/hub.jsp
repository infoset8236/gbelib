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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/hub.css?v=1.3">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="content">
                <div class="shootingStar">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="item star">
                    <div>책 속에 쏟아지는 은하수,<br>별빛서재 바로가기</div>
                    <div>나의 별자리를 찾아보고, 별의 이야기와 함께<br>당신을 기다리는 추천도서를 만나보세요.</div>
                    <a href="/${homepage.context_path}/ict/star/main.do">바로가기</a>
                </div>
                <div class="item smart">
                    <div>당신을 위한 맞춤 제안,<br>스마트도서추천</div>
                    <div>어떤 책을 읽을지 고민된다면?<br>취향과 연령에 맞는 책을 추천해 드릴게요.</div>
                    <a href="/${homepage.context_path}/ict/smartBook/main.do">바로가기</a>
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

