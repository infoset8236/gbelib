<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
<meta content="ie=edge" http-equiv="X-UA-Compatible" />
<title>Document</title>
<link href="/resources/ict/libraryBoard/css/reset.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/font.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/slick.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/slick-theme.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/plugin/jquery-3.7.1.min.js"></script>
<script src="/resources/ict/libraryBoard/plugin/slick.min.js"></script>
<script src="/resources/ict/libraryBoard/js/common.js" type="text/javascript"></script>
</head>

<body>
<link href="/resources/ict/libraryBoard/css/notice.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/info/js/notice.js"></script>

<div class="container">
    <div class="header">
        <div>NOTICE</div>
        <div>공지사항</div>
    </div>
    <c:if test="${fn:length(noticeList) < 1}">
        <div class="libraryBoard_nodata">등록된 공지사항이 없어요</div>
    </c:if>
    <div class="content">
        <c:if test="${fn:length(noticeList) > 0}">
            <div class="slide">
                <c:forEach items="${noticeList}" var="i" varStatus="status">
                    <div class="slide_item">
                        <c:choose>
                            <c:when test="${empty i.preview_img}">
                                <img alt="" src="/resources/ict/common/img/noimg.png" />
                            </c:when>
                            <c:otherwise>
                                <img alt="" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.onerror=null; this.src='/resources/ict/common/img/noimg.png';"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
    <div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>