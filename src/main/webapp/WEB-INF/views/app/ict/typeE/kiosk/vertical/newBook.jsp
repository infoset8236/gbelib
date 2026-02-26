<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
		<title>신착도서</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/kiosk/css/slick.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/kiosk/css/slick-theme.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeE/common/css/common.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/typeE/kiosk/css/newBook.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="/resources/ict/typeE/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="/resources/ict/typeE/kiosk/plugin/slick.js" type="text/javascript"></script>
        <script src="/resources/ict/kioskVertical/js/type_b/info/common/navigation.js" type="text/javascript"></script>
		<script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
	</head>
	<body>

	<script type="text/javascript">
		function goDetail(LOCA, CTRLNO) {
			$('#verDetailForm #vLoca').val(LOCA);
			$('#verDetailForm #vCtrl').val(CTRLNO);
			$('form#verDetailForm').submit();
		}
	</script>

	<form:form modelAttribute="librarySearch" id="verDetailForm" action="detail.do" method="post">
		<input type="hidden" id="vLoca" name="vLoca"/>
		<input type="hidden" id="vCtrl" name="vCtrl"/>
	</form:form>
<div id="loading" >
    <div class="container">
        <div class="dot dot-1"></div>
        <div class="dot dot-2"></div>
        <div class="dot dot-3"></div>
    </div>

    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
        <defs>
            <filter id="goo">
                <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 21 -7"/>
            </filter>
        </defs>
    </svg>
</div>
    <div class="dim">
        <div class="new_wrap info" id="container">
            <div class="header">
                <p>New book</p>
                <h1>신착도서</h1>
            </div>
            <div class="bg_cir_b"></div>
            <div class="contents">
                <c:if test="${fn:length(newBookList.dsNewBookList) < 1}">
                    <div class="no_content">
                        <div class="no_wrapper">
                            <img src="/resources/ict/common/img/Astronaut.gif" alt="">
                            <h3>등록된 책소개가 없어요</h3>
                        </div>
                    </div>
                </c:if>
                <div class="slider">
                    <c:choose>
                        <c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
                            <div class="slider_inner">
                                <div class="grid">
                                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="0"
                                               end="8">
                                        <div class="grid-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
                                            <c:choose>
                                                <c:when test="${i.COVER_SMALLURL eq ''}">
                                                    <img src="/resources/ict/common/img/noimg.png" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${i.COVER_SMALLURL}" />
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="book_title">${i.TITLE}</div>
                                            <div class="name"><span>${i.AUTHOR}</span><span>/ ${i.PUBLER}</span></div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${fn:length(newBookList.dsNewBookList) > 8}">
                            <div class="slider_inner">
                                <div class="grid">
                                    <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="9"
                                               end="17">
                                        <div class="grid-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
                                            <c:choose>
                                                <c:when test="${i.COVER_SMALLURL eq ''}">
                                                    <img src="/resources/ict/common/img/noimg.png" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${i.COVER_SMALLURL}" />
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="book_title">${i.TITLE}</div>
                                            <div class="name"><span>${i.AUTHOR}</span><span>/ ${i.PUBLER}</span></div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
    <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp"/>
	</body>
	<script>
        $(function () {
            $('.slider').slick({
                infinite: true,
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                dots: true,
                autoplay: true,
                autoplaySpeed: 8000,
                speed: 500,
                pauseOnHover: true,
                adaptiveHeight: true
            });
        });
		
	$(document).ready(function () {

    $("#loading").show();


    setTimeout(function () {
        $("#loading").fadeOut(); 
    }, 3000);
});

</script>
</html>