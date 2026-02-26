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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/myStar.css?v=1.3">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/star/js/myStar.js"></script>
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
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="form">
                    <div class="title">태어난 월과 일을 입력하여<br>나의 별자리를 알아보세요.</div>
                    <div class="selectBox">
                        <div class="wrapper">
                            <label for="month">태어난 월</label>
                            <select id="month">
                                <option value="1">1월</option>
                                <option value="2">2월</option>
                                <option value="3">3월</option>
                                <option value="4">4월</option>
                                <option value="5">5월</option>
                                <option value="6">6월</option>
                                <option value="7">7월</option>
                                <option value="8">8월</option>
                                <option value="9">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
                        </div>
                        <div class="wrapper">
                            <label for="day">태어난 일</label>
                            <select id="day">
                                <option value="1">1일</option>
                                <option value="2">2일</option>
                                <option value="3">3일</option>
                                <option value="4">4일</option>
                                <option value="5">5일</option>
                                <option value="6">6일</option>
                                <option value="7">7일</option>
                                <option value="8">8일</option>
                                <option value="9">9일</option>
                                <option value="10">10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                            </select>
                        </div>
                    </div>
                    <button type="button" class="submit">나의 별자리 발견하기</button>
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

