<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/smart/css/chart.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <script src="/resources/ict/typeE/smart/js/chart.js?v=1.2"></script>
    <script src="/resources/ict/typeE/smart/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>keyword recommendation</div>
                <div tabindex="0">키워드추천</div>
            </div>
            <div class="content">
                <div class="title">
                    <div tabindex="0">회원님의 관심사는 무엇인가요?</div>
                    <div tabindex="0">관심 키워드를 분석해 알맞은 책을 추천해드려요</div>
                </div>
                <div class="bubbleBox"></div>
                <button class="change" id="changeBtn" tabindex="0">키워드 바꾸기</button>
                <div class="selectedKeyword"></div>
                <div class="selectBox">
                    <div>
                        <label for="sex">성별</label>
                        <select id="sex" tabindex="0" class="key" aria-label="검색 성별 설정">
                            <option tabindex="0" class="key" aria-label="검색 성별 전체" value="">전체</option>
                            <option tabindex="0" class="key" aria-label="검색 성별 여성" value="0">여성</option>
                            <option tabindex="0" class="key" aria-label="검색 성별 남성" value="1">남성</option>
                        </select>
                    </div>
                    <div>
                        <label for="book_keyword_age">나이</label>
                        <select id="book_keyword_age" class="key" tabindex="0" aria-label="검색 나이 설정" name="book_keyword_age">
                            <option tabindex="0" class="key" aria-label="검색 나이 전체" value="">전체</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 영유아" value="4">영유아</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 유아" value="5">유아</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 초등" value="8">초등</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 청소년" value="14">청소년</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 20대 이상" value="25">20대 이상</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 30대 이상" value="30">30대 이상</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 40대 이상" value="40">40대 이상</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 50대 이상" value="50">50대 이상</option>
                            <option tabindex="0" class="key" aria-label="검색 나이 60대 이상" value="60">60대 이상</option>
                        </select>
                    </div>
                </div>
                <button tabindex="0" class="submit" onclick="recomend();">도서추천받기</button>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeE/smartBook/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeE/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
