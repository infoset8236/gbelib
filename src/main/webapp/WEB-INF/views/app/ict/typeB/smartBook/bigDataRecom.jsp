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

		function recom(publicPopularAge) {
			$('#librarySearch #publicPopularAge').val(publicPopularAge);
			$('form#librarySearch').submit();
		}
	</script>
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
			<form:form modelAttribute="librarySearch" action="bigDataRecom.do">
				<div class="reco_tab">
					<a href="javascript:void(0)" data-tab="mn_tab9" class="" onclick="moveByContentRecommend(this)" id="keywordRecom">키워드추천</a>
					<a href="javascript:void(0)" data-tab="mn_tab10" class="" onclick="moveByContentRecommend(this)" id="librarianRecom">사서추천</a>
					<a href="javascript:void(0)" data-tab="mn_tab12" class="active" onclick="moveByContentRecommend(this)" id="bigDataRecom">빅데이터추천</a>
				</div>
				<div class="reco_tab_cont">
					<input type="hidden" id="publicPopularAge" name="publicPopularAge"/>
					<div class="tab_content active" id="mn_tab12">
						<div class="reco_tit_wrap">
							<div class="reco_tit">빅데이터는 어떤 책을 추천했을까요?</div>
							<div class="reco_stit">전국 공공도서관 연령대별 추천도서를 만나보세요</div>
						</div>
						<div class="recom_tab">
							<a href="javascript:void(0)" data-tab="m_tab0" class="${librarySearch.publicPopularAge eq '0' ? 'active' : ''}" onclick="recom('0');">아동</a>
							<a href="javascript:void(0)" data-tab="m_tab14" class="${librarySearch.publicPopularAge eq '14' ? 'active' : ''}" onclick="recom('14');">청소년</a>
							<a href="javascript:void(0)" data-tab="m_tab20" class="${librarySearch.publicPopularAge eq '20' ? 'active' : ''}" onclick="recom('20');">20~30대</a>
							<a href="javascript:void(0)" data-tab="m_tab40" class="${librarySearch.publicPopularAge eq '40' ? 'active' : ''}" onclick="recom('40');">40~50대</a>
							<a href="javascript:void(0)" data-tab="m_tab60" class="${librarySearch.publicPopularAge eq '60' ? 'active' : ''}" onclick="recom('60');">60대 이상</a>
						</div>
						<div class="ttabs">
							<div class="recom_tab_cont">
								<div class="tab_content active" id="m_tab${librarySearch.publicPopularAge}">
									<div class="content" id="landscape_03">
										<c:if test="${fn:length(popularBookList) < 1}">
											<div class="no_content">
												<div class="no_wrapper">
													<img src="/resources/ict/common/img/Astronaut.gif" alt="">
													<h3>등록된 책소개가 없어요</h3>
												</div>
											</div>
										</c:if>
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<c:if test="${fn:length(popularBookList) > 0}">
													<c:forEach items="${popularBookList}" var="i" varStatus="status">
														<c:if test="${status.index % 6 == 0}">
															<div class="swiper-slide">
														</c:if>
														<div class="slide-item">
															<img alt="" src="${i.bookImageURL}" />
															<div class="book_title">${i.bookname}</div>
															<div class="writer">${i.authors}</div>
														</div>
														<c:if test="${status.index % 6 == 5 || status.index == fn:length(popularBookList) - 1}">
															</div>
														</c:if>
													</c:forEach>
												</c:if>
											</div>
											<div class="swiper-pagination"></div>
										</div>
									</div>
									<div class="content" id="portrait_03">
										<c:if test="${fn:length(popularBookList) < 1}">
											<div class="no_content">
												<div class="no_wrapper">
													<img src="/resources/ict/common/img/Astronaut.gif" alt="">
													<h3>등록된 책소개가 없어요</h3>
												</div>
											</div>
										</c:if>
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<c:if test="${fn:length(popularBookList) > 0}">
													<c:forEach items="${popularBookList}" var="i" varStatus="status">
														<c:if test="${status.index % 6 == 0}">
															<div class="swiper-slide">
														</c:if>
														<div class="slide-item">
															<img alt="" src="${i.bookImageURL}" />
															<div class="book_title">${i.bookname}</div>
															<div class="writer">${i.authors}</div>
														</div>
														<c:if test="${status.index % 6 == 5 || status.index == fn:length(popularBookList) - 1}">
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
				</form:form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/smartBook/userNav.jsp"/>

	<script src="/resources/ict/smartBook/js/type_b/keyword.js" type="text/javascript"></script>
	</body>
<script type="text/javascript">
	$(document).ready(function () {

    $("#loading").show();


    setTimeout(function () {
        $("#loading").fadeOut(); 
    }, 3000);
});

</script>
</html>