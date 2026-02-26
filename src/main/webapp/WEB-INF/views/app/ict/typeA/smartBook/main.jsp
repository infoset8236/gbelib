<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8"/>
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
		$(document).ready(function () {
			$('#popup').hide();

			$('.close').on('click', function () {
				$('#popup').fadeOut();
			});

			$(window).on('click', function (e) {
				if ($(e.target).is('.popup_overlay')) {
					$('#popup').fadeOut();
				}
			});
		});

		$(function() {
			$('.main_search_bar_btn').on('click', function() {
				if ($('input#search_text_main').val() == '') {
					document.getElementById("popup_message").innerText = '검색어를 입력하세요.';
					$('#popup').fadeIn();
					return false;
				}

				const selectedType = document.getElementById('searchTypeInput');
				$('input#search_type').val(selectedType);
				$('#mainSearchForm').submit();
			});
		});

		$(function() {
			$('.main_search_filtering_list_item').on('click', function() {
				const filteringItems = document.querySelectorAll('.main_search_filtering_list_item');

				const searchTypeInput = document.getElementById('searchTypeInput');

				filteringItems.forEach((item) => {
					item.addEventListener('click', () => {
						filteringItems.forEach((el) => el.classList.remove('active'));

						item.classList.add('active');

						searchTypeInput.value = item.getAttribute('data-value');

						console.log(searchTypeInput.value);
					});
				});
			});
		});
	</script>

	<div class="main_content">
		<div class="common_header_wrapper ml">
			<div class="common_header_kr">AI도서추천검색</div>
			<div class="common_header_en">AI book recommendation search</div>
		</div>
		<div class="main_content_wrapper">
			<div class="main_top_wrapper">
				<div>
					<div class="main_search_title">회원님, 어떤책을<br />찾고 계신가요?</div>
					<div class="main_search_caption">
						책 제목이나 작가 정보 등<br />
						원하시는 책을 검색해보세요
					</div>
				</div>
				<form id="mainSearchForm" modelAttribute="librarySearch" action="/${homepage.context_path}/ict/smartBook/search.do">
					<input type="hidden" name="search_type" id="searchTypeInput" value="L_TITLE" />
				<div class="main_search_wrapper">
					<div class="main_search_filtering_list">
						<div class="main_search_filtering_list_item active" data-value="L_TITLE">도서명</div>
						<div class="main_search_filtering_list_item" data-value="L_AUTHOR">저자명</div>
						<div class="main_search_filtering_list_item" data-value="L_PUBLISHER">출판사</div>
					</div>
					<div class="main_search_bar_wrapper">
						<div class="main_search_bar_character"></div>
						<input id="search_text_main" name="search_text" placeholder="검색어를 입력해주세요" type="text" />
						<div class="main_search_bar_btn"></div>
					</div>
				</div>
				</form>
			</div>

			<div class="main_bottom_wrapper">
				<div>
					<div class="main_recommend_title">나에게 딱 맞는 책을 만나보세요!</div>
					<div class="main_recommend_caption">무슨책을 읽어야 할지 고민하는<br />회원님을 위해 도서 추천 콘텐츠를 제공해드려요</div>
					<div class="main_recommend_btn">
						<div class="main_recommend_btn_label">도서 추천받으러 가기</div>
						<div class="main_recommend_btn_icon" onclick="location.href='/${homepage.context_path}/ict/smartBook/keywordRecom.do'"></div>
					</div>
				</div>
				<div class="main_recommend_img"></div>
			</div>
		</div>

		<div class="popup_overlay" id="popup" style="display: none">
			<div class="popup_wrapper">
				<div class="popup_title">도서검색</div>
				<div class="popup_content" id="popup_message">
				</div>
				<div class="close_btn close">
					확인
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

	</div>
	</body>

	<script type="text/javascript">
		$(document).ready(function () {
			$('input#search_text_main').val('');
		});
	</script>
</html>