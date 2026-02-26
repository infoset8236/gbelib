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
		$(document).ready(function() {
			$('#popup').hide();

			$('.close').on('click', function () {
				$('#popup').fadeOut();
			});

			$('#smastBookRecom').on('click', function () {
				if ('${sessionScope.member.login}' == 'true' && '${sessionScope.member.loginType}' == 'HOMEPAGE') {
					location.href='/${homepage.context_path}/ict/smartBook/smartBookRecom.do';
				} else {
					$('#popup').fadeIn();
				}
			});

			$(window).on('click', function (e) {
				if ($(e.target).is('.popup_overlay')) {
					$('#popup').fadeOut();
				}
			});

			$('.black').on('click', function () {
				location.href='/${homepage.context_path}/ict/smartBook/login.do';
			});
		});

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
			<div class="common_header_kr">키워드추천</div>
			<div class="common_header_en">Keyword Recommended</div>
		</div>

		<div class="keyword_result_swiper">
			<div class="swiper">
			<div class="swiper-wrapper">
				<c:if test="${fn:length(getKeywordBookList) > 0}">
					<c:forEach items="${getKeywordBookList}" var="i" varStatus="status">
						<div class="swiper-slide">
								<img alt="" src="${i.bookimageURL}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';" onclick="goDetail('${i.isbn}','L_ISBN');"/>
								<div class="common_book_title">${i.bookname}</div>
								<div class="common_writer">${i.author}</div>
								<div class="common_publication">${i.publication_year}</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>

		<div class="keyword_result_custom_btn">
			<div class="keyword_result_custom_btn_character"></div>
			<div>
				<div class="keyword_result_custom_btn_text">회원님 취향을 저격할 또 다른 책</div>
				<div class="keyword_result_custom_btn_caption_wrapper" id="smastBookRecom">
					<div class="keyword_result_custom_btn_caption">발견하러가기</div>
					<div class="keyword_result_custom_btn_caption_icon"></div>
				</div>
			</div>
		</div>

		<div class="common_back_btn" onclick="history.back();">
			<div class="common_back_btn_icon"></div>
			<div class="common_back_btn_text">이전</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

	</div>

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
</html>