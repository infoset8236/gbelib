<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
	<title>Document</title>
	<meta charset="utf-8" />
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
	<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
	<link href="/resources/ict/typeE/info/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/typeE/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/ulStyle.css?v=20251210" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/bestBook.css?v=20251210" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/lib.js" type="text/javascript"></script>
</head>
<body>

<div class="lib_best_container">
    <div class="libHeader">
        <div class="libHeaderEn">Best book</div>
        <div class="libHeaderKo" style="color: #fff">인기도서</div>
    </div>
	<c:if test="${fn:length(bestBookList.dsLoanBestList) < 1}">
	
		<div class="lib_notice_nodata_wrapper">
            <img alt="" src="/resources/ict/typeE/info/img/nodata.gif" />
            <div>등록된 책 소개가 없어요</div>
        </div>
		
	</c:if>
	<c:if test="${fn:length(bestBookList.dsLoanBestList) > 0}">
		<div class="lib_best_swiper">
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="0" end="4">
							<div class="swiper-item">
								<div class="lib_best_ranking">0${status.count}</div>
								<c:choose>
									<c:when test="${i.COVER_SMALLURL eq ''}">
										<img src="/resources/ict/typeD/common/img/common/dummy.png" />
									</c:when>
									<c:otherwise>
										<img src="${i.COVER_SMALLURL}" />
									</c:otherwise>
								</c:choose>
								<div class="lib_best_title">${i.TITLE}</div>
								<div class="lib_best_writer">${i.AUTHOR}</div>
								<div class="lib_best_year">${i.PUBLER_YEAR}</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-slide">
						<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="5" end="9">
							<div class="swiper-item">
								<div class="lib_best_ranking"><fmt:formatNumber value="${status.count + 5}" pattern="00" /></div>
								<c:choose>
									<c:when test="${i.COVER_SMALLURL eq ''}">
										<img src="/resources/ict/typeD/common/img/common/dummy.png" />
									</c:when>
									<c:otherwise>
										<img src="${i.COVER_SMALLURL}" />
									</c:otherwise>
								</c:choose>
								<div class="lib_best_title">${i.TITLE}</div>
								<div class="lib_best_writer">${i.AUTHOR}</div>
								<div class="lib_best_year">${i.PUBLER_YEAR}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</c:if>
    <div class="libCopyright">Yecheon Public Library</div>
</div>
</body>
</html>