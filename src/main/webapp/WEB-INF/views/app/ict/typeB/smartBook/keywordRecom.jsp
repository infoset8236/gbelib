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
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/d3.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/d3-extended.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/js/type_b/common.js" type="text/javascript"></script>
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
	<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>

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

		updateNoKeywordDisplay();

		function updateNoKeywordDisplay() {
			if (selectedKeywordCount === 0) {
				document.getElementById("noKeyword").style.display = "block";
			} else {
				document.getElementById("noKeyword").style.display = "none";
			}
		}


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
			<p>smart recommended book</p>
			<h1>스마트도서추천</h1>
		</div>
		<div class="tabs">
			<form:form modelAttribute="librarySearch" action="keywordRecom.do">
				<div class="reco_tab">
					<a href="javascript:void(0)" data-tab="mn_tab9" class="active" onclick="moveByContentRecommend(this)" id="keywordRecom">키워드추천</a>
					<a href="javascript:void(0)" data-tab="mn_tab10" class="" onclick="moveByContentRecommend(this)" id="librarianRecom">사서추천</a>
					<a href="javascript:void(0)" data-tab="mn_tab12" class="" onclick="moveByContentRecommend(this)" id="bigDataRecom">빅데이터추천</a>
				</div>
			</form:form>
			<div class="reco_tab_cont">
				<form:form modelAttribute="bookKeyword" action="index.do" onsubmit="return false">
					<form:hidden path="keyword_name"/>
					<div class="tab_content active" id="mn_tab9">
						<div class="reco_tit_wrap">
							<div class="reco_tit">회원님의 관심사는 무엇인가요?</div>
							<div class="reco_stit">관심 키워드를 분석해 알맞은 책을 추천드려요</div>
							<div id="keyword_zone" class="keyword_zone">
							</div>
						</div>

						<div class="key_selec_wrap">
							<div class="keymenu_frame">
								<div class="change_word">
									<a href="javascript:void(0);" onclick="changeKeyword();">
										<div class="change_word_wrap">
											<div class="system-uicons-reset">
												<img class="reset_img" src="/resources/ict/smartBook/img/type_b/keyword/system-uicons_reset.png" />
											</div>
											<div class="reset_txt" style="cursor: pointer">키워드 바꾸기</div>
										</div>
									</a>
								</div>
							</div>

							<div id="keyword_selected_keyword_list" class="keyword_selected_keyword_list">
								<div id="noKeyword" class="no_content">
									<p>키워드는 최대 3개까지 선택이 가능해요</p>
								</div>
							</div>

							<div class="select_kind">
								<div class="reco_select">
									<div class="reco_select_01">
										<div class="gender_reco">성별 선택</div>
										<form:select path="sex" class="select_reco">
											<form:option value="">선택</form:option>
											<form:option value="0001">남</form:option>
											<form:option value="0002">여</form:option>
										</form:select>
									</div>
									<div class="reco_select_02">
										<div class="age_reco">나이 선택</div>
										<form:select path="age" class="select_age">
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
								<div class="recomend_btn" onclick="recomend();">
									<div class="reco_btn_frame">
										<a href="#" class="reco_btn_txt">도서추천받기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
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

	<jsp:include page="/WEB-INF/views/app/ict/typeB/smartBook/userNav.jsp"/>

	<script src="/resources/ict/smartBook/js/type_b/keyword.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	$(document).ready(function () {

    $("#loading").show();


    setTimeout(function () {
        $("#loading").fadeOut(); 
    }, 3000);
});
        
        
function addSelectedKeyword(keywordName) {
    if (selectedKeywordCount >= 3) {
        $('#popup_message').text('검색 키워드는 최대 3개까지만 선택할 수 있습니다.');
        $('#popup').fadeIn();
        return;
    }

    const $keywordListContainer = $('#keyword_selected_keyword_list');

    // 이미 선택된 키워드인지 확인
    if ($keywordListContainer.find('.keyword_selected_keyword_list_item_text').filter(function() {
        return $(this).text() === keywordName;
    }).length > 0) {
        return;
    }

    // 해당 키워드에 active 클래스 추가
    $('.keyword_bubble_chart_item').each(function() {
        if ($(this).text().trim() === keywordName) {
            $(this).addClass('active');
        }
    });

    // 선택된 키워드 리스트 항목 생성
    const $selectedItem = $('<div>', { class: 'keyword_selected_keyword_list_item' });
    const $itemText = $('<div>', { class: 'keyword_selected_keyword_list_item_text', text: keywordName });
    const $itemIcon = $('<div>', { class: 'keyword_selected_keyword_list_item_icon' });

    $selectedItem.append($itemText, $itemIcon);

    // 클릭 이벤트: 리스트 항목 클릭 시 active 제거
    $selectedItem.on('click', function() {
        removeSelectedKeyword($selectedItem, keywordName);
    });

    $keywordListContainer.append($selectedItem);

    selectedKeywordCount++;
    updateNoKeywordDisplay();
}

function removeSelectedKeyword($selectedItem, keywordName) {
    // 선택된 항목 제거
    $selectedItem.remove();

    // 관련된 .keyword_bubble_chart_item에서 active 클래스 제거
    $('.keyword_bubble_chart_item').each(function() {
        if ($(this).text().trim() === keywordName) {
            $(this).removeClass('active');
        }
    });

    // 선택된 키워드 수 감소 및 UI 갱신
    selectedKeywordCount--;
    updateNoKeywordDisplay();
}
        

</script>

	</body>
</html>