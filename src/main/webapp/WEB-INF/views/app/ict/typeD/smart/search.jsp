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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/smart/css/result.css">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <script src="/resources/ict/typeD/smart/js/result.js"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script>
    jQuery(function ($) {
        if (typeof keyPadController !== "undefined" && keyPadController) {
            bodyOpen();
        }
    });
</script>

<form:form modelAttribute="librarySearch" id="verDetailForm" action="detailVertical.do" method="post">
	<input type="hidden" id="vLoca" name="vLoca"/>
	<input type="hidden" id="vCtrl" name="vCtrl"/>
</form:form>

<div class="dim">
    <div class="container">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div tabindex="0">BOOK SEARCH</div>
                <div tabindex="0">도서검색</div>
            </div>
            <form:form modelAttribute="librarySearch" action="search.do" method="POST">
            <form:hidden path="viewPage"/>
            <form:hidden path="search_text"/>
            <form:hidden path="search_type"/>

            <div class="content">
                <div class="totalCount" tabindex="0">검색어 <span>'${fn:escapeXml(librarySearch.search_text)}'</span>에 대해 총 <span>${fn:escapeXml(result.totalCnt)}건</span>이 검색되었습니다.</div>
                <ul class="resultList">
                    <%-- 반복문으로 li 출력 --%>
                    <c:forEach items="${result.dsResult}" var="i" varStatus="status">
                    <li class="resultItem" tabindex="0" >
                        <div class="wrapper">
                            <c:choose>
                                <c:when test="${i.IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
                                    <img src="/resources/ict/typeD/common/img/common/dummy.png" alt="">
                                </c:when>
                                <c:otherwise>
                                    <img alt="" src="${fn:escapeXml(i.IMAGE_URL)}" />
                                </c:otherwise>
                            </c:choose>

                            <div class="bookInfo">
                                <div tabindex="0" aria-label="제목 ${i.DISP01}">${fn:escapeXml(i.DISP01)}</div>
                                <div tabindex="0">
                                    저&nbsp;&nbsp;자&nbsp;&nbsp;명
                                    <span>
                                        <c:set var="DISP02" value="${fn:replace(i.DISP02, '[32703m', '')}"></c:set>
                                        <c:set var="DISP02" value="${fn:replace(i.DISP02, '[32723m', '')}"></c:set>
                                        ${DISP02}
                                    </span>
                                </div>
                                <div tabindex="0">
                                    발&nbsp;&nbsp;행&nbsp;&nbsp;처
                                    <span>${fn:escapeXml(i.DISP03)}</span>
                                </div>
                                <div tabindex="0">
                                    발행년도
                                    <span>${fn:escapeXml(i.DISP06)}</span>
                                </div>
                                <div tabindex="0">
                                    I&nbsp;&nbsp;S&nbsp;&nbsp;B&nbsp;&nbsp;N
                                    <span>${fn:escapeXml(i.DISP08)}</span>
                                </div>
                            </div>
                        </div>
                        <a class="key" tabindex="0" href="javascript:void(0);" onclick="goDetail('${fn:escapeXml(i.LIMT06)}','${fn:escapeXml(i.CTRL)}');">상세보기</a>
                    </li>
                    </c:forEach>
                </ul>

                <c:if test="${fn:length(result.dsResult) > 0}">
                    <div id="pagination" class="pagination" tabindex="0" aria-label="페이지 이동">
                        <c:if test="${paging.firstPageNum > 0}">
                            <a class="first key" tabindex="0" aria-label="첫번째 페이지로 이동" href="#" keyValue="${paging.firstPageNum}"></a>
                        </c:if>

                        <c:if test="${paging.prevPageNum > 0}">
                            <a class="prev key" tabindex="0" aria-label="이전 페이지로 이동"  href="#" keyValue="${paging.prevPageNum}"></a>
                        </c:if>

                        <ul>
                            <c:forEach var="i" begin="${paging.startPageNum}" end="${paging.endPageNum}">
                                <li tabindex="0" aria-label="${i} 페이지로 이동" class="key" <c:if test='${paging.viewPage eq i}'>class="active"</c:if> keyValue="${i}">${i}</li>
                            </c:forEach>
                        </ul>

                        <c:if test="${paging.nextPageNum > 0}">
                            <a class="next key" tabindex="0" aria-label="다음 페이지로 이동" href="#" keyValue="${paging.nextPageNum}"></a>
                        </c:if>

                        <c:if test="${paging.totalPageCount ne paging.lastPageNum}">
                            <a class="last key"  tabindex="0" aria-label="마지막 페이지로 이동" href="#" keyValue="${paging.totalPageCount}"></a>
                        </c:if>
                    </div>
                </c:if>
            </div>
            </form:form>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smart/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/common/img/common/scrollUp.svg" alt="">
    </div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		jQuery.ajaxSettings.traditional = true;

		$("#pagination").on("click", "a, li", function (e) {
			$('#viewPage').attr('value', parseInt($(this).attr('keyValue')));

			$('#librarySearch').submit();
			e.preventDefault();

            $(".loadingOverlay").fadeIn(100);
		});
	});

	function goDetail(LOCA, CTRLNO) {
		$('#verDetailForm #vLoca').val(LOCA);
        $('#verDetailForm #vCtrl').val(CTRLNO);
        $('form#verDetailForm').submit();

        $(".loadingOverlay").fadeIn(100);
	}
</script>
</body>
</html>
