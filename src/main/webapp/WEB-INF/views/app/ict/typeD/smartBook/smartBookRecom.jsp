<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/custom.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/smart/js/custom.js?v=1.2"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script type="text/javascript">
    function goDetail(search_text, search_type) {
        $('#verDetailForm #search_text').val(search_text);
        $('#verDetailForm #search_type').val(search_type);
        $('form#verDetailForm').submit();
    }
</script>
<form:form modelAttribute="librarySearch" id="verDetailForm" action="/${homepage.context_path}/ict/smartBook/search.do">
    <input type="hidden" id="search_type" name="search_type"/>
    <input type="hidden" id="search_text" name="search_text"/>
</form:form>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>customized recommendation</div>
                <div tabindex="0">맞춤형추천</div>
            </div>
            <div class="content">
                <div class="title">
                    <div tabindex="0">이런 책은 어떤가요?</div>
                    <div tabindex="0">회원님의 정보 및 독서취향을 분석한 맞춤책을 추천해드려요</div>
                </div>

                <c:if test="${fn:length(popularBookList) < 1}">
                    <div class="exception" tabindex="0">추천된 도서가 없습니다.</div>
                </c:if>

                <c:if test="${fn:length(popularBookList) > 0}">
                    <div class="bookSlide">
                        <c:forEach items="${popularBookList}" var="i" varStatus="status">

                            <a href="#" aria-label="제목: 책제목, 저자: 저자명" class="book" tabindex="0" onclick="goDetail('${i.isbn13}','L_ISBN');">
                                    <img src="${i.bookImageURL}" alt="책표지" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';">
                                    <div>${i.bookname}</div>
                                    <div>${i.authors}</div>
                                </a>
                        </c:forEach>
                    </div>
                </c:if>
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
