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
			$('#popup_logout').hide();

			$('.close').on('click', function () {
				$('#popup_logout').fadeOut();
			});

			$('#logout-member, #logout-admin').on('click', function () {
				$('#popup_logout').fadeIn();
			});

			$(window).on('click', function (e) {
				if ($(e.target).is('.popup_overlay')) {
					$('#popup_logout').fadeOut();
				}
			});

			$('#logout-btn').on('click', function () {
				location.href='/${homepage.context_path}/ict/smartBook/logout.do';
			});
		});
	</script>

	<div class="common_content">
		<div class="common_header_wrapper">
			<div class="common_header_kr">키워드추천</div>
			<div class="common_header_en">Keyword Recommended</div>
		</div>
		<div class="keyword_custom_content">
			<div class="common_content_title black ml">이런 책은 어떤가요</div>
			<div class="common_content_caption gary ml">회원님의 정보 및 독서취향을 분석한 맞춤책을 추천해드려요</div>
			<div class="keyword_custom_slider_wrapper">
				<div class="common_four_by_four">
					<div class="swiper">
						<div class="swiper-wrapper">
								<c:forEach items="${popularBookList}" var="i" varStatus="status">
									<div class="swiper-slide">
										<img alt="" src="${i.bookImageURL}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';" />
										<div class="keyword_custom_book_title">${i.bookname}</div>
										<div class="keyword_custom_writer">${i.authors}</div>
										<div class="common_publication">${i.publication_year}</div>
									</div>
								</c:forEach>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination" id="white"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="common_back_btn" onclick="history.back();">
		<div class="common_back_btn_icon dark"></div>
		<div class="common_back_btn_text dark">이전</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

	</body>
</html>