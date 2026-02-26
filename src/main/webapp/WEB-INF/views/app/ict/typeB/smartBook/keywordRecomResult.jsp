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
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport"/>
		<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/ict/smartBook/css/type_b/keyword.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/ict/smartBook/css/type_b/common.css" rel="stylesheet" type="text/css "/>
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/smartBook/js/type_b/common.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css"/>
	<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
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
				<div class="tab_content active" id="mn_tab9">
					<div class="person_wrap">
						<div class="person_said">
							<p>내 취향을 저격할 또 다른 책!</p>
							<span>
								<a href="javascript:void(0);" id="smastBookRecom">발견하러 가기 ></a>
							</span>
						</div>
						<div class="person_img">
							<img src="/resources/ict/smartBook/img/common/character.png" alt="" class="person_img_front"/>
							<img src="/resources/ict/smartBook/img/common/character_shadow.png" class="person_img_back" alt=""/>
						</div>
					</div>
					<div class="reco_slide_03 reco_slide"></div>
					<div class="content" id="landscape_01">
						<c:if test="${fn:length(getKeywordBookList) < 1}">
						<div class="no_content">
							<div class="no_wrapper">
								<img src="/resources/ict/common/img/Astronaut.gif" alt="">
								<h3>등록된 책소개가 없어요</h3>
							</div>
						</div>
						</c:if>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:if test="${fn:length(getKeywordBookList) > 0}">
									<c:forEach items="${getKeywordBookList}" var="i" varStatus="status">
										<c:if test="${status.index % 14 == 0}">
											<div class="swiper-slide">
										</c:if>
										<div class="slide-item" onclick="goDetail('${i.isbn}','L_ISBN');">
											<img alt="" src="${i.bookimageURL}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';"/>
											<div class="book_title">${i.bookname}</div>
											<div class="writer">${i.author}</div>
										</div>
										<c:if test="${status.index % 14 == 13 || status.index == fn:length(getKeywordBookList) - 1}">
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<div class="content" id="portrait_01">
						<c:if test="${fn:length(getKeywordBookList) < 1}">
						<div class="no_content">
							<div class="no_wrapper">
							<img src="/resources/ict/common/img/Astronaut.gif" alt="">
							<h3>등록된 책소개가 없어요</h3>
							</div>
						</div>
						</c:if>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:if test="${fn:length(getKeywordBookList) > 0}">
									<c:forEach items="${getKeywordBookList}" var="i" varStatus="status">
										<c:if test="${status.index % 9 == 0}">
											<div class="swiper-slide">
										</c:if>
										<div class="slide-item" onclick="goDetail('${i.isbn}','L_ISBN');">
											<img alt="" src="${i.bookimageURL}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';"/>
											<div class="book_title">${i.bookname}</div>
											<div class="writer">${i.author}</div>
										</div>
										<c:if test="${status.index % 9 == 8 || status.index == fn:length(getKeywordBookList) - 1}">
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

	<div class="popup_overlay" id="popup" style="display: none">
		<div class="popup_wrapper">
			<div class="popup_title">로그인</div>
			<div class="popup_content">
				회원 전용 서비스입니다.<br>
				확인 버튼을 클릭하면 로그인 화면으로 이동합니다.
			</div>
			<div class="button_wrapper">
				<div class="action_button white close">
					취소
				</div>
				<div class="action_button black">
					확인
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
	</body>
	
<script type="text/javascript">
	$(document).ready(function () {

    $("#loading").show();


    setTimeout(function () {
        $("#loading").fadeOut(); 
    }, 2000);
});

</script>
</html>