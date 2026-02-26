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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/index.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.5"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.5"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <script src="/resources/ict/typeD/smart/js/index.js?v=1.2"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script>
        jQuery(function ($) {
            if (typeof keyPadController !== "undefined" && keyPadController) {
                bodyOpen();
            }
        });
        $(function (){
            $(".bookFilter button").on("click", function () {
                $(".bookFilter button").removeClass("active");
                $(this).addClass("active");

                $("#real_search_type").val($(this).attr("id"));
            });

            $(".searchForm .submit").on("click", function (e) {
                e.preventDefault();

                const text = $("#search_text_main").val().trim();

                if (text === "") {
                    customPopup("검색어를 입력해주세요.");
                    return;
                }

                $("#real_search_text").val(text);

                $("#mainSearchForm").submit();

                $(".loadingOverlay").fadeIn(100);
            });

            $("#search_text_main").on("keydown", function (e) {
                if (e.key === "Enter") {
                    e.preventDefault();
                    $(".searchForm .submit").click();
                }
            });
        })
    </script>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>SMART BOOK RECOMMENDATION</div>
                <div tabindex="0">스마트도서추천</div>
            </div>
            <div class="content">
                <div class="searchIntro">
                    <div tabindex="0">회원님, 어떤 책을 <br>찾고 계신가요?</div>
                    <div tabindex="0">책 제목이나 작가 정보 등 <br>원하시는 책을 검색해보세요</div>
                </div>

                <form id="mainSearchForm" modelAttribute="librarySearch" action="/${homepage.context_path}/ict/smartBook/search.do" method="post" style="display:none">
                    <input type="hidden" name="search_type" id="real_search_type" value="L_TITLE">
                    <input type="hidden" name="search_text" id="real_search_text">
                </form>

                <div class="searchBox">
                    <img class="decoration" src="/resources/ict/typeD/smart/img/index/character.apng" alt="">
                    <div class="bookFilter">
                        <button id="L_TITLE" tabindex="0" class="active">도서명</button>
                        <button id="L_AUTHOR" tabindex="0">저자명</button>
                        <button id="L_PUBLISHER" tabindex="0">발행처</button>
                    </div>
                    <div class="searchForm">
                        <label>
                            <input id="search_text_main" type="text" aria-label="검색어를 입력해주세요." placeholder="" tabindex="0">
                        </label>
                        <button class="submit" tabindex="0" aria-label="검색하기">
                            <img src="/resources/ict/typeD/smart/img/index/search.svg" alt="">
                        </button>
                    </div>
                </div>

                <div class="recommendIntro" tabindex="0">
                    <img class="decoration1" src="/resources/ict/typeD/smart/img/index/book.png" alt="">
                    <img class="decoration2" src="/resources/ict/typeD/smart/img/index/heart.apng" alt="">
                    <div tabindex="0">나에게 딱 맞는 책을<br>만나보세요!</div>
                    <div tabindex="0">어떤 책을 읽어야 할지 고민하는<br>회원님을 위해 도서 추천 콘텐츠를<br>제공해드려요</div>
                    <a class="recommendLink" href="/${homepage.context_path}/ict/smartBook/keywordRecom.do" tabindex="0">스마트하게 도서 추천 받기</a>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smartBook/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
<script>
    $(window).on("pageshow", function (event) {
        if (event.originalEvent.persisted) {
            resetSearchConditions();
        }
    });

    function resetSearchConditions() {
        $("#searchInput").val("").attr("placeholder", "");
        $(".bookFilter div").removeClass("active");
        $(".bookFilter div").first().addClass("active");
    }
</script>
</body>
</html>
