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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/librarian.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/smart/js/librarian.js?v=1.2"></script>
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
                <div>Librarian recommendation</div>
                <div tabindex="0">사서추천</div>
            </div>
            <div class="content">
                <c:if test="${fn:length(librarianRecommendList) < 1}">
                    <div class="exception" tabindex="0">등록된 도서가 없습니다.</div>
                </c:if>

                <c:if test="${fn:length(librarianRecommendList) > 0}">
                    <div class="bookList">
                        <c:forEach items="${librarianRecommendList}" var="i" varStatus="status">
                            <a href="javascript:void(0);" class="book" tabindex="0" onclick="goDetail('${i.imsi_v_5}','L_ISBN');">
                                <c:choose>
                                    <c:when test="${i.preview_img ne null}">
                                        <c:choose>
                                            <c:when test="${fn:contains(i.preview_img, 'https')}">
                                                <img src="${i.preview_img}" alt="${i.title}" title="${i.title}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/resources/ict/typeD/smart/img/common/dummy.png" alt="책 표지">
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/ict/typeD/smart/img/common/dummy.png" alt="책 표지">
                                    </c:otherwise>
                                </c:choose>
                                <div>${i.title}</div>
                                <div>${i.imsi_v_3}</div>
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

