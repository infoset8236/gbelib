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
		<title>스마트추천도서</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_b/main.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_b/common.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<script src="/resources/ict/smartBook/js/type_b/main.js" type="text/javascript"></script>
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
			$('#search_input_btn').on('click', function() {
				if ($('input#search_text_main').val() == '') {
					document.getElementById("popup_message").innerText = '검색어를 입력하세요.';
					$('#popup').fadeIn();
					return false;
				}

				const selectedType = document.querySelector('input[name="search_type"]:checked').value;
				$('input#search_type').val(selectedType);
				$('#mainSearchForm').submit();
			});
		});
	</script>
	<div class="info-wrap info main_wrap">
		<div class="header">
			<p>smart recommended books</p>
			<h1>스마트도서추천</h1>
		</div>
		<div class="contents">
			<div class="personmain_img">
				<img src="/resources/ict/smartBook/img/type_b/main/character.png"/>
			</div>
			<div class="book_img">
				<img src="/resources/ict/smartBook/img/type_b/main/book-22-10.png"/>
			</div>
			<div class="search_img">
				<img src="/resources/ict/smartBook/img/type_b/main/search-7-10.png"/>
			</div>
			<div class="right_side">
				<form id="mainSearchForm" modelAttribute="librarySearch" action="/${homepage.context_path}/ict/smartBook/search.do">
					<div class="search_main_total">
						<div class="select_frame">
							<input type="radio" id="select1" name="search_type" value="L_TITLE" checked="checked"/> <label for="select1">도서명</label>
							<input type="radio" id="select2" name="search_type" value="L_AUTHOR"/> <label for="select2">저자명</label>
							<input type="radio" id="select3" name="search_type" value="L_PUBLISHER"/> <label for="select3">출판사</label>
						</div>

						<div class="search_input_wrap">
							<div class="search_input_inner">
								<input class="search_inputbox" id="search_text_main" name="search_text" type="text" placeholder="검색어를 입력하세요" />
							</div>
							<div class="search_input_btn" id="search_input_btn">
								<div class="search_input_btn_inner">
									<div class="btn_wrap">
										<div class="ic_search">
											<img class="ic_search_img" src="/resources/ict/smartBook/img/type_b/main/g_search.svg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>

				<div class="main_text">
					<div class="text_wrap">
						<h1>나에게 딱 맞는 책을 만나보세요!</h1>
						<p>무슨 책을 읽어야 할지 고민하는 회원님을 위해<span>도서 추천 콘텐츠를 제공해드려요</span></p>
					</div>
					<div class="btn_wrap_go">
						<a href="/${homepage.context_path}/ict/smartBook/keywordRecom.do">추천 바로가기
							<img src="/resources/ict/smartBook/img/type_b/main/main_arrow.svg" class="move-arrow" />
						</a>
					</div>
				</div>
			</div>
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

	</body>
</html>