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
	<link href="/resources/ict/info/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/info/css/font.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/info/css/book.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/info/css/lib.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ict/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<script src="/resources/ict/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
	<script src="/resources/ict/info/js/book.js" type="text/javascript"></script>
	<script src="/resources/ict/info/js/lib.js" type="text/javascript"></script>
</head>
<body>
<c:if test="${fn:length(librarianRecommendList) < 1}">
	<div class="lib_notice_nodata_wrapper">
		<img alt="" src="/resources/ict/common/img/Astronaut.gif" />
		<div>등록된 책 소개가 없어요</div>
	</div>
</c:if>
<c:if test="${fn:length(librarianRecommendList) > 0}">
	<div class="l_new_wrap info" id="l_librarian_book">
		<div class="l_books_swiper">
			<div class="swiper">
				<div class="swiper-wrapper">
					<c:forEach items="${librarianRecommendList}" var="i">
						<div class="slide-item l_grid_item">
							<c:choose>
								<c:when test="${i.preview_img ne null}">
									<c:choose>
										<c:when test="${fn:contains(i.preview_img, 'https')}">
											<img src="${i.preview_img}" alt="${i.title}" title="${i.title}"/>
										</c:when>
										<c:otherwise>
											<img src="/resources/ict/smartBook/img/common/noimg.png" alt="${i.title}" title="${i.title}"/>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<img alt="${i.title}" src="/resources/ict/smartBook/img/common/noimg.png"/>
								</c:otherwise>
							</c:choose>

							<div class="book_title">${i.title}</div>
							<div class="name">${i.imsi_v_3}</div>
							<div class="name">${i.imsi_v_1.split('-')[0]}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
</c:if>
</body>
</html>