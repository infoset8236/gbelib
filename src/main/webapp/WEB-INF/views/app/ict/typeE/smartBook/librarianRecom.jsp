<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/smart/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/smart/css/librarian.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeE/smart/js/librarian.js?v=1.2"></script>
    <script src="/resources/ict/typeE/smart/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script type="text/javascript">
    function goDetail(vCtrl) {
        $('#verDetailForm #vCtrl').val(vCtrl);
        $('form#verDetailForm').submit();
    }
</script>

<form:form modelAttribute="librarySearch" id="verDetailForm"
           action="/${homepage.context_path}/ict/smartBook/detailVertical.do">
    <input type="hidden" id="vCtrl" name="vCtrl"/>
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
                    <div class="book-slider">
                        <c:forEach items="${librarianRecommendList}" var="i" varStatus="status">
                            <div class="book-item">
                                <a href="javascript:void(0);" class="book" tabindex="0"
                                   onclick="goDetail('${i.imsi_v_8}');">
                                    <c:choose>
                                        <c:when test="${i.preview_img ne null}">
                                            <c:choose>
                                                <c:when test="${fn:contains(i.preview_img, 'https')}">
                                                    <img src="${i.preview_img}" alt="${i.title}" title="${i.title}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/resources/ict/typeE/smart/img/common/dummy.png" alt="책 표지">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/resources/ict/typeE/smart/img/common/dummy.png" alt="책 표지">
                                        </c:otherwise>
                                    </c:choose>
                                    <div>${i.title}</div>
                                    <div>${i.imsi_v_3}</div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    </c:if>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeE/smartBook/nav.jsp"/>
        </div>
        <div class="scrollUp">
            <img src="/resources/ict/typeE/common/img/common/scrollUp.svg" alt="">
        </div>
    </div>
</div>
</body>
</html>

