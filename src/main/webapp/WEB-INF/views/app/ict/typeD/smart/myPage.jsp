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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/account/css/myPage.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/account/js/myPage.js"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script>
    $(document).ready(function(){
        loadTabContent("loan");

        $('.tabMenu .key').on('click', function () {
            $('.tabMenu .key').removeClass('active');
            $(this).addClass('active');

            const tab = $(this).data('tab');
            loadTabContent(tab);
        });
    });

    function loadTabContent(tabName){
        let url = "";

        switch(tabName){
            case "loan":     url = "loanList.do"; break;
            case "history":  url = "loanHistoryList.do"; break;
            case "reserve":  url = "reserveList.do"; break;
        }

        // $("#tabContentArea").html("<div class='loading'>불러오는 중...</div>");

        $.ajax({
            url: url,
            type: "GET",
            success: function(res){
                $("#tabContentArea").html(res);
                if (typeof keyPadController !== "undefined" && keyPadController) {
                    bodyOpen();
                    keyPadController.setFocusById(tabName,true);
                }
            },
            error: function(){
                $("#tabContentArea").html("<div class='error'>데이터를 불러오지 못했습니다.</div>");
            }
        });
    }
</script>

<div class="dim">
    <div class="container" tabindex="0">
        <input type="hidden" id="rec_key" value="" />
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>my library</div>
                <div tabindex="0">나의서재</div>
            </div>
            <div class="content">
                <div class="loanSummary">
                    <div tabindex="0">대출 중 권수<span>${loanCnt}</span></div>
                    <div tabindex="0">연체 권수<span>${delayCnt}</span></div>
                </div>

                <div class="tabMenu">
                    <div id="loan" class="active key" data-tab="loan" tabindex="0">대출도서</div>
                    <div id="history" class="key" data-tab="history" tabindex="0">대출이력</div>
                    <div id="reserve" class="key" data-tab="reserve" tabindex="0">예약현황</div>
                </div>

                <div id="tabContentArea">

                </div>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smart/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
