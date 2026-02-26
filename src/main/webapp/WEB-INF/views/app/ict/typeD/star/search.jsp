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
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/search.css?v=1.3">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/star/js/search.js"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script type="text/javascript">
    $(window).on('pageshow', function (event) {
        // BFCache로 복원된 경우 event.originalEvent.persisted 가 true
        $('.loadingOverlay').hide(); // 또는 fadeOut(0)
    });
</script>

<form:form modelAttribute="librarySearch" id="verDetailForm" action="bookDetail.do" method="post">
    <input type="hidden" id="vLoca" name="vLoca"/>
    <input type="hidden" id="vCtrl" name="vCtrl"/>
</form:form>

<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>CONSTELLATION BOOKS</div>
                <div tabindex="0">별자리BOOK</div>
            </div>
            <div class="content">
                <c:if test="${fn:length(librarianRecommendList.dsResult) < 1}">
                    <div class="exception" tabindex="0">등록된 도서가 없습니다.</div>
                </c:if>

                <c:if test="${fn:length(librarianRecommendList.dsResult) > 0}">
                        <div class="bookList">
                    <c:forEach items="${librarianRecommendList.dsResult}" var="i" varStatus="status">
                            <a href="javascript:void(0);" class="book" tabindex="0" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');" >
                                <c:choose>
                                    <c:when test="${i.IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
                                        <img src="/resources/ict/typeD/common/img/common/dummy.png" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img alt="" src="${fn:escapeXml(i.IMAGE_URL)}" />
                                    </c:otherwise>
                                </c:choose>
                                <div>${i.DISP01}</div>
                                <div>${i.DISP02}</div>
                            </a>
                    </c:forEach>
                        </div>
                </c:if>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/star/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
<script>
    function goDetail(LOCA, CTRLNO) {
        $('#verDetailForm #vLoca').val(LOCA);
        $('#verDetailForm #vCtrl').val(CTRLNO);

        $(".loadingOverlay").fadeIn(100);

        $('form#verDetailForm').submit();
    }

</script>
</html>

