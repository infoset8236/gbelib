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
		<title>스마트도서추천</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_b/keyword.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_b/keyword_bubbl_hori.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_b/common.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/d3.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/d3-extended.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/js/type_b/common.js" type="text/javascript"></script>
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
	<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
	<script src="https://d3js.org/d3.v6.min.js"></script>

	<script type="text/javascript">
		function moveByContentRecommend(element) {
			const idValue = element.id;
			const actionUrl = idValue + ".do";
			$('form#librarySearch').attr('action', actionUrl);
			$('form#librarySearch').submit();
		}
	</script>

	<form:form modelAttribute="librarySearch" id="verDetailForm" action="/${homepage.context_path}/ict/smartBook/search.do">
		<input type="hidden" id="search_type" name="search_type"/>
		<input type="hidden" id="search_text" name="search_text"/>
	</form:form>

	<form:form modelAttribute="librarySearch" id="horiDetailForm" action="/${homepage.context_path}/ict/smartBook/search.do">
		<input type="hidden" id="search_type" name="search_type"/>
		<input type="hidden" id="search_text" name="search_text"/>
	</form:form>

<div id="loading" style="display:none;">
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
	<div class="div_wrap recommendedbooks_wrap info-wrap">
		<div class="div_wrap_bg"></div>
		<div class="header">
			<p>smart recommended books</p>
			<h1>스마트도서추천</h1>
		</div>
		<div class="tabs">
			<form:form modelAttribute="librarySearch" action="librarianRecom.do">
				<div class="reco_tab">
					<a href="javascript:void(0)" data-tab="mn_tab9" class="" onclick="moveByContentRecommend(this)" id="keywordRecom">키워드추천</a>
					<a href="javascript:void(0)" data-tab="mn_tab10" class="active" onclick="moveByContentRecommend(this)" id="librarianRecom">사서추천</a>
					<a href="javascript:void(0)" data-tab="mn_tab12" class="" onclick="moveByContentRecommend(this)" id="bigDataRecom">빅데이터추천</a>
				</div>
			</form:form>
			<div class="reco_tab_cont">
				<div class="tab_content active" id="mn_tab10">
				
					<div class="reco_slide_02 reco_slide">
						<div class="reco_tit_wrap">
							<div class="reco_tit">우리 도서관 사서 선생님의 선택</div>
							<div class="reco_stit">사서 선생님들이 이용자들을 위해 고른 추천도서는 어떠세요?</div>
						</div>
						<div class="content" id="landscape_02">
							<c:if test="${fn:length(librarianRecommendList) < 1}">
							<div class="no_content">
								<div class="no_wrapper">
									<img src="/resources/ict/common/img/Astronaut.gif" alt="">
									<h3>등록된 책소개가 없어요</h3>
								</div>
							</div>
							</c:if>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<c:if test="${fn:length(librarianRecommendList) > 0}">
										<c:forEach items="${librarianRecommendList}" var="i" varStatus="status">
											<c:if test="${status.index % 5 == 0}">
												<div class="swiper-slide">
											</c:if>
											<div class="slide-item" onclick="goDetail('${i.imsi_v_5}','L_ISBN');">
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
												<div class="writer">${i.imsi_v_3}</div>
											</div>
											<c:if test="${status.index % 5 == 4 || status.index == fn:length(librarianRecommendList) - 1}">
												</div>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
								<div class="swiper-pagination"></div>
							</div>
						</div>

						<div class="content" id="portrait_02">
							<c:if test="${fn:length(librarianRecommendList) < 1}">
							<div class="no_content">
								<div class="no_wrapper">
									<img src="/resources/ict/common/img/Astronaut.gif" alt="">
									<h3>등록된 책소개가 없어요</h3>
								</div>
							</div>
							</c:if>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<c:if test="${fn:length(librarianRecommendList) > 0}">
										<c:forEach items="${librarianRecommendList}" var="i" varStatus="status">
											<c:if test="${status.index % 12 == 0}">
												<div class="swiper-slide">
											</c:if>
											<div class="slide-item" onclick="goDetail('${i.imsi_v_5}','L_ISBN');">
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
												<div class="writer">${i.imsi_v_4}</div>
											</div>
											<c:if test="${status.index % 12 == 11 || status.index == fn:length(librarianRecommendList) - 1}">
												</div>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/smartBook/userNav.jsp"/>

	<script src="/resources/ict/smartBook/js/type_b/keyword.js" type="text/javascript"></script>
	<script>
		function goDetail(search_text, search_type) {
			const screenWidth = window.innerWidth;
			if (screenWidth === 3840) {
				$('#horiDetailForm #search_text').val(search_text);
				$('#horiDetailForm #search_type').val(search_type);
				$('form#horiDetailForm').submit();
			} else if (screenWidth === 2160) {
				$('#verDetailForm #search_text').val(search_text);
				$('#verDetailForm #search_type').val(search_type);
				$('form#verDetailForm').submit();
			} else if (screenWidth === 1920) {
				$('#horiDetailForm #search_text').val(search_text);
				$('#horiDetailForm #search_type').val(search_type);
				$('form#horiDetailForm').submit();
			} else if (screenWidth === 1080) {
				$('#verDetailForm #search_text').val(search_text);
				$('#verDetailForm #search_type').val(search_type);
				$('form#verDetailForm').submit();
			} else {
				$('#verDetailForm #search_text').val(search_text);
				$('#verDetailForm #search_type').val(search_type);
				$('form#verDetailForm').submit();
			}
		}
	</script>
	</body>
	<script type="text/javascript">
		$(document).ready(function () {

			function togglePagination() {

				if ($('.no_content').length > 0 && $('.no_content').is(':visible')) {

					$('.swiper-pagination').hide();
				} else {

					$('.swiper-pagination').show();
				}
			}

			togglePagination();

			$(document).on('DOMSubtreeModified', '.content', function () {
				togglePagination();
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function () {

			$("#loading").show();


			setTimeout(function () {
				$("#loading").fadeOut();
			}, 3000);
		});
</script>
</html>