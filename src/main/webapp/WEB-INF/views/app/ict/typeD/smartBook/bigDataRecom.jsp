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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/bigdata.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <script src="/resources/ict/typeD/smart/js/bigdata.js?v=1.2"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script>
    $(document).ready(function() {
        $(".filter button").on("click", function() {
            const age = $(this).data("age");
            $("#publicPopularAge").val(age);
            $("#librarySearch").submit();
        });
    });
</script>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>big data recommendation</div>
                <div tabindex="0">빅데이터추천</div>
            </div>
            <div class="content">
                <div class="title">
                    <div tabindex="0">빅데이터는 어떤 책을 추천했을까요?</div>
                    <div tabindex="0">전국 공공도서관 연령대별 추천도서를 소개합니다</div>
                </div>

                <form:form id="librarySearch" modelAttribute="librarySearch" action="bigDataRecom.do">
                    <input type="hidden" id="publicPopularAge" name="publicPopularAge" value="${librarySearch.publicPopularAge}" />

                    <div class="filter">
                        <button type="button" tabindex="0" data-age="0" class="${librarySearch.publicPopularAge eq '0' ? 'active' : ''}">아동</button>
                        <button type="button" tabindex="0" data-age="14" class="${librarySearch.publicPopularAge eq '14' ? 'active' : ''}">청소년</button>
                        <button type="button" tabindex="0" data-age="20" class="${librarySearch.publicPopularAge eq '20' ? 'active' : ''}">20~30대</button>
                        <button type="button" tabindex="0" data-age="40" class="${librarySearch.publicPopularAge eq '40' ? 'active' : ''}">40~50대</button>
                        <button type="button" tabindex="0" data-age="60" class="${librarySearch.publicPopularAge eq '60' ? 'active' : ''}">60대 이상</button>
                    </div>
                </form:form>

                <c:if test="${fn:length(popularBookList) < 1}">
                    <div class="exception" tabindex="0">등록된 도서가 없습니다.</div>
                </c:if>

                <div class="bookSlide">
                    <c:forEach items="${popularBookList}" var="i">
                        <a href="javascript:void(0)" class="book" tabindex="0">
                            <img src="${i.bookImageURL}" alt="책 표지">
                            <div>${i.bookname}</div>
                            <div>${i.authors}</div>
                        </a>
                    </c:forEach>
                </div>
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
