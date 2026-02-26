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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/keyword.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.2"></script>
    <script src="/resources/ict/typeD/smart/js/keyword.js"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script>
    $(function (){
        if (typeof keyPadController !== "undefined" && keyPadController) {
            // bodyOpen()
        }
    })

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
                <div>keyword recommendation</div>
                <div tabindex="0">키워드추천</div>
            </div>
            <div class="content">
                <div class="title">
                    <div tabindex="0">선택한 키워드로 추천된 책을 볼까요?</div>
                    <div tabindex="0">이용자님이 선택한 키워드를 바탕으로 추천된 도서입니다</div>
                </div>
                <c:if test="${fn:length(getKeywordBookList) < 1}">
                    <div class="noData" tabindex="0" style="text-align: center;margin-top: 60%;font-size: 2.5rem">검색된 키워드 자료가 없습니다.</div>
                </c:if>
                <div class="bookSlide">

                    <c:forEach items="${getKeywordBookList}" var="i" varStatus="status">
                        <a href="javascript:void(0);" tabindex="0" aria-label="제목 ${i.bookname} ${i.autor}" class="book" onclick="goDetail('${i.isbn}','L_ISBN');">
                            <img src="${i.bookimageURL}" alt="">
                            <div>${i.bookname}</div>
                            <div>${i.author}</div>
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="back" onclick="history.back();"></div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smartBook/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
