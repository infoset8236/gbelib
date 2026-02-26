<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
		<meta content="ie=edge" http-equiv="X-UA-Compatible" />
		<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_a/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/js/type_a/script.js" type="text/javascript"></script>
		<title>스마트 도서 A 타입</title>
	</head>
	<body>

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

	<div class="common_content">
		<div class="common_header_wrapper">
			<div class="common_header_kr">사서추천</div>
			<div class="common_header_en">Librarian Recommended</div>
		</div>
		<div class="common_content_title">우리 도서관 사서가 추천하는 도서</div>
		<div class="common_content_caption">책을 사랑하는 사서들이 엄선한 책들을 소개해드려요</div>
		<div class="librarian_slider_wrapper">
			<div class="common_four_by_four">
				<div class="swiper">
				<div class="swiper-wrapper">
					<c:if test="${fn:length(librarianRecommendList) > 0}">
						<c:forEach items="${librarianRecommendList}" var="i" varStatus="status">
							<div class="swiper-slide" onclick="goDetail('${i.imsi_v_5}','L_ISBN');">
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
									<div class="keyword_custom_book_title">${i.title}</div>
									<div class="keyword_custom_writer">${i.imsi_v_3}</div>
									<div class="common_publication">${i.imsi_v_4}</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>
		</div>

		<div class="common_back_btn" onclick="history.back();">
			<div class="common_back_btn_icon"></div>
			<div class="common_back_btn_text">이전</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

	</div>
	</body>
</html>