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
		<link href="/resources/ict/smartBook/css/type_b/keyword_result.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_b/common.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	</head>
	<body>
	<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
	<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
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
	<div class="div_wrap recommendedbooks_wrap info-wrap" id="keyword_result">
		<div class="div_wrap_bg"></div>
		<div class="header">
			<p>smart recommended book</p>
			<h1>스마트도서추천</h1>
		</div>
		<div class="bg_rectangle">
			<div class="tabs">
				<div class="reco_tab_cont">
					<div class="tab_content active">
						<div class="reco_tit_wrap">
							<div class="reco_tit">이런 책은 어떤가요?</div>
							<div class="reco_stit">회원님의 나이, 성별 정보를 분석한 맞춤책을 추천해드려요</div>
						</div>
						<div class="content" id="landscape_08">
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
												<img alt="" src="${i.bookImageURL}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';"/>
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
						<div class="content" id="portrait_08">
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
											<c:if test="${status.index % 12 == 0}">
												<div class="swiper-slide">
											</c:if>
											<div class="slide-item">
												<img alt="" src="${i.bookImageURL}" onerror="this.src='/resources/ict/smartBook/img/common/noimg.png';"/>
												<div class="book_title">${i.bookname}</div>
												<div class="writer">${i.authors}</div>
											</div>
											<c:if test="${status.index % 12 == 11 || status.index == fn:length(popularBookList) - 1}">
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

	<div class="popup_overlay" id="popup_logout" style="display: none">
		<div class="popup_wrapper">
			<div class="popup_title">로그아웃</div>
			<div class="popup_content">
				${homepage.homepage_name}에서 로그아웃 하시겠습니까?
			</div>
			<div class="button_wrapper">
				<div class="action_button white close">
					취소
				</div>
				<div class="action_button black" id="logout-btn">
					확인
				</div>
			</div>
		</div>
	</div>

	<div id="bottom_fix">
		<div class="left_bottom">
			<div class="home_go" onclick="location.href='/${homepage.context_path}/ict/smartBook/main.do'">
				<img alt="돌아가기" class="home_to" src="/resources/ict/smartBook/img/common/home0.svg" />
			</div>
			<div class="component_leave" onclick="location.href='/${homepage.context_path}/ict/smartBook/keywordRecom.do'">
				<img alt="돌아가기" class="turn_to" src="/resources/ict/smartBook/img/common/left_leave.svg" />
			</div>
		</div>
		<c:choose>
			<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
				<div class="user">
					<div class="login_btn">
						<c:choose>
							<c:when test="${sessionScope.member.sex eq '0001'}">
								<img alt="" class="login_women" src="/resources/ict/smartBook/img/common/man_login.png" />
							</c:when>
							<c:otherwise>
								<img alt="" class="login_women" src="/resources/ict/smartBook/img/common/women_login.png" />
							</c:otherwise>
						</c:choose>
						<div class="name_wrap">
						<span>
							<span class="name_span">${sessionScope.member.member_name}</span>
							<span class="name_span">님</span>
						</span>
						</div>
						<div class="login_frame" id="logout-member">
							<img alt="로그아웃" class="group" src="/resources/ict/smartBook/img/common/logout_arrow.svg" />
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
				<div class="user">
					<div class="login_btn">
						<img alt="" class="login_women" src="/resources/ict/smartBook/img/common/admin_login.png" />
						<div class="name_div">
						<span>
							<span class="name_span">최고관리자</span>
							<span class="name_span">님</span>
						</span>
						</div>
						<div class="login_frame" id="logout-admin">
							<img alt="로그아웃" class="group" src="/resources/ict/smartBook/img/common/logout_arrow.svg" />
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
	<script src="/resources/ict/smartBook/js/type_b/keyword.js" type="text/javascript"></script>
	<script>
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
</html>