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
	<script type="text/javascript">
		$(document).ready(function() {
			$('#popup').hide();

			$('#keyword_zone').load('keyword.do');

			$('.close').on('click', function () {
				$('#popup').fadeOut();
			});

			$(window).on('click', function (e) {
				if ($(e.target).is('.popup_overlay')) {
					$('#popup').fadeOut();
				}
			});
		});

		function changeKeyword() {
			$('#keyword_zone').load('keyword.do');
		}

		function moveByContentRecommend(element) {
			const idValue = element.id;
			const actionUrl = idValue + ".do";
			$('form#librarySearch').attr('action', actionUrl);
			$('form#librarySearch').submit();
		}

		let selectedKeywordCount = 0;

		function addSelectedKeyword(keywordName) {
			console.log('이게아닌디');
			if (selectedKeywordCount >= 3) {
				document.getElementById("popup_message").innerText = '검색 키워드는 최대 3개까지만 선택할 수 있습니다.';
				$('#popup').fadeIn();
				return;
			}

			const keywordListContainer = document.getElementById("keyword_selected_keyword_list");
			const existingKeywords = keywordListContainer.querySelectorAll(".keyword_selected_keyword_list_item_text");

			for (const keyword of existingKeywords) {
				if (keyword.innerText === keywordName) {
					return;
				}
			}

			const keywordElements = document.querySelectorAll('.keyword_bubble_chart_item');
			keywordElements.forEach((element) => {
				if (element.innerText === keywordName) {
					element.classList.add('keyword_bubble_active');
				}
			});

			const selectedItem = document.createElement("div");
			selectedItem.classList.add("keyword_selected_keyword_list_item");

			/*selectedItem.onclick = () => removeSelectedKeyword(selectedItem);*/

			const itemText = document.createElement("div");
			itemText.classList.add("keyword_selected_keyword_list_item_text");
			itemText.innerText = keywordName;

			const itemIcon = document.createElement("div");
			itemIcon.classList.add("keyword_selected_keyword_list_item_icon");

			selectedItem.appendChild(itemText);
			selectedItem.appendChild(itemIcon);

			keywordListContainer.appendChild(selectedItem);

			selectedKeywordCount++;
		}

		/*function removeSelectedKeyword(selectedItem) {
			console.log('에이설마');
			selectedItem.remove();

			selectedKeywordCount--;
		}*/

		$(document).on('click', '.keyword_selected_keyword_list_item_icon', function() {
			console.log('여긴맞는데');
			const keywordName = $(this).siblings('.keyword_selected_keyword_list_item_text').text().trim();
			$('.keyword_bubble_chart_item').each(function() {
				if ($(this).text().trim() === keywordName) {
					$(this).removeClass('keyword_bubble_active');
				}
			});

			// 선택된 키워드 리스트에서 항목 제거
			$(this).parent('.keyword_selected_keyword_list_item').remove();

			// 선택된 키워드 수 감소
			selectedKeywordCount--;
		});


		function recomend() {
			const sex = $('select#sex').val();
			const age = $('select#age').val();

			$('#keyword_name').val('');

			const selected_count= $('.keyword_selected_keyword_list_item').length;

			if (selected_count == 0) {
				document.getElementById("popup_message").innerText = '키워드를 하나 이상 선택 후 검색을 진행해 주세요.';
				$('#popup').fadeIn();
				return false;
			}

			for (let i = 0; i < selected_count; i++) {
				const keyword_text = $('.keyword_selected_keyword_list_item .keyword_selected_keyword_list_item_text').eq(i).text();

				const keyword_name = $('#keyword_name').val();
				if (keyword_name == null || keyword_name == '') {
					$('#keyword_name').val(keyword_text);
				} else {
					$('#keyword_name').val(keyword_name+','+keyword_text);
				}
			}

			let fullUrl = 'keywordRecomResult.do';
			const param = 'keyword_name=' + $('#keyword_name').val() + '&sex=' + sex + '&age=' + age;

			if(param != null && param.replace(/\s/g,'').length!=0) {
				fullUrl = fullUrl+'?'+param;
			}

			$(location).attr('href', fullUrl);
		}
	</script>

	<body>
	<form:form modelAttribute="bookKeyword" action="index.do" onsubmit="return false">
	<form:hidden path="keyword_name"/>
		<div class="keyword_bubble_content">
			<div class="common_header_wrapper">
				<div class="common_header_kr">키워드추천</div>
				<div class="common_header_en">Keyword Recommended</div>
			</div>
			<div class="common_content_title">회원님의 요즘 관심사는 무엇인가요?</div>
			<div class="common_content_caption light_gary">빅데이터 분석으로 도서를 추천해드려요</div>
			<div id="keyword_zone" class="keyword_zone">
			</div>
			<div class="keyword_refresh_btn" onclick="changeKeyword();">
				<div class="keyword_refresh_btn_icon"></div>
				<div class="keyword_refresh_btn_text">키워드 바꾸기</div>
			</div>
			<div id="keyword_selected_keyword_list" class="keyword_selected_keyword_list">

			</div>
			<div class="keyword_bubble_action_wrapper">
				<div class="keyword_select_area">
					<div class="keyword_select_box">
						<label for="gender">성별</label>
						<form:select path="sex">
							<form:option value="">선택</form:option>
							<form:option value="0001">남</form:option>
							<form:option value="0002">여</form:option>
						</form:select>
					</div>
					<div class="keyword_select_box">
						<label for="age">나이</label>
						<form:select path="age">
							<form:option value="">선택</form:option>
							<form:option value="영유아">영유아</form:option>
							<form:option value="유아">유아</form:option>
							<form:option value="초등">초등</form:option>
							<form:option value="청소년">청소년</form:option>
							<form:option value="20대 이상">20대 이상</form:option>
							<form:option value="30대 이상">30대 이상</form:option>
							<form:option value="40대 이상">40대 이상</form:option>
							<form:option value="50대 이상">50대 이상</form:option>
							<form:option value="60대 이상">60대 이상</form:option>
						</form:select>
					</div>
				</div>
				<div class="keyword_recommend_btn" onclick="recomend();">도서 추천받기</div>
			</div>

			<div class="popup_overlay" id="popup" style="display: none">
				<div class="popup_wrapper">
					<div class="popup_title">키워드 추천</div>
					<div class="popup_content" id="popup_message">
					</div>
					<div class="close_btn close">
						확인
					</div>
				</div>
			</div>

			<div class="common_back_btn" onclick="history.back();">
				<div class="common_back_btn_icon"></div>
				<div class="common_back_btn_text">이전</div>
			</div>

			<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>

		</div>
	</form:form>
	</body>
</html>