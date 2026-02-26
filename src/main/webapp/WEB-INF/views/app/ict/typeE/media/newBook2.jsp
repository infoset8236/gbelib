<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/newBook2.css?v=3">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/media/js/newBook2.js?v=3"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div style="display: flex;  overflow:hidden;">
    <div class="naPanel">
        <div class="panelHeader">
            <div class="panelTitle">
                <div class="panelTitleEn">new book</div>
                <div class="panelTitleKo">신착도서</div>
            </div>
            <div class="panelPagination">
                <span class="panelCurrent">1</span><span class="panelTotal">/1</span>
            </div>
        </div>
        <c:if test="${fn:length(newBookList.dsNewBookList) < 1}">
            <div class="noData">신착도서가 없습니다.</div>
        </c:if>
        <div class="naList">
            <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
                <div class="naItem">
                    <div class="naImg">
                        <c:choose>
                            <c:when test="${i.COVER_SMALLURL eq ''}">
                                <img class="infoImg" src="/resources/ict/common/img/noimg.png" alt="${i.TITLE}" onerror="this.src='/resources/ict/common/img/noimg.png'">
                            </c:when>
                            <c:otherwise>
                                <img class="infoImg" src="${i.COVER_SMALLURL}" alt="${i.TITLE}" onerror="this.src='/resources/ict/common/img/noimg.png'">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="naContent">
                        <div class="naTitle">${i.TITLE}</div>
                        <div class="naInfo">
                            <div class="naAuthor">${i.AUTHOR} · ${i.PUBLER}</div>
<%--                            <div class="naLoc">${i.LOCA_NAME}</div>--%>
                        </div>
                        <div class="naDesc">${i.contentsDetail}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/app/ict/typeE/media/loanReturn.jsp" />
</div>

</body>
</html>
