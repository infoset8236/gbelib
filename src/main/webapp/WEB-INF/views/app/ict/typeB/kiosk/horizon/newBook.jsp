<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>신착도서</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/new_book.css" />
<link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />

<!-- <script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script> -->
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/resources/ict/kioskHorizon/js/type_b/new_book.js"></script>

</head>
<body>
<link rel="stylesheet" type="text/css" href="/resources/common/css/swiper.min.css"  />
<style>
.swiper-container-horizontal > .swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction {bottom:-100px;}
.swiper-pagination-bullet-active {opacity:1;background:#fff;}
</style>

<script type="text/javascript">
$(function() {
	slideAct();
});

function goDetail(LOCA, CTRLNO) {
	$('#verDetailForm #vLoca').val(LOCA);
	$('#verDetailForm #vCtrl').val(CTRLNO);
	$('form#verDetailForm').submit();
}
</script>

<form:form modelAttribute="librarySearch" id="verDetailForm" action="detail.do" method="post">
	<input type="hidden" id="vLoca" name="vLoca"/>
	<input type="hidden" id="vCtrl" name="vCtrl"/>
</form:form>

<div class="notice_wrap info detail_wrap info">
	<div class="header">
		<p>NEW BOOK</p>
		<h1>신착도서</h1>
	</div>
	<div class="content">
		<c:if test="${fn:length(newBookList.dsNewBookList) < 1}">
			<div class="no_content">
				<div class="no_wrapper">
					<img src="/resources/ict/common/img/Astronaut.gif" alt="">
					<h3>등록된 책소개가 없어요</h3>
				</div>
			</div>
		</c:if>
		<div class="swiper-container slider">
				<div class="swiper-wrapper">
				
					<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
						<div class="list slide-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
							<c:choose>
								<c:when test="${i.COVER_SMALLURL eq ''}">
									<img alt="book" src="/resources/ict/common/img/noimg.png" />
								</c:when>
								<c:otherwise>
									<img alt="book" src="${i.COVER_SMALLURL}" />
								</c:otherwise>
							</c:choose>
							<div class="book_title">${i.TITLE}</div>
							<div class="writer"><span>${i.AUTHOR}</span><span>/ ${i.PUBLER}</span></div>
						</div>
					</c:forEach>
				
				</div>
				<div class="swiper-pagination"></div>
			</div>
			</div>
</div>

<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/userNav.jsp"/>
<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp"/>

</body>
<script src="/resources/ict/common/js/jquery.swiper.min.js"></script>
<script type="text/javascript">
function slideAct() {
  var view = 12; // 보이는 슬라이드 개수 (PC 기준)
  var realInx = 0; // 현재 페이지
  var swiperInstance; // 단일 슬라이드 인스턴스

  // 슬라이드 초기화
  slideList();

  function slideList() {
    // 리스트 초기화
    if ($('.slider .list').parent().hasClass('swiper-slide')) {
      $('.slider .swiper-slide-duplicate').remove();
      $('.slider .list').unwrap('.swiper-slide');
    }

    // 리스트 그룹화 (swiper-slide element 추가)
    var num = 0;
    $('.slider').find('.list').each(function (i) {
      $(this).addClass('list' + Math.floor((i + view) / view));
      num = Math.floor((i + view) / view);
    }).promise().done(function () {
      for (var i = 1; i <= num; i++) {
        $('.slider').find('.list' + i).wrapAll('<div class="swiper-slide"></div>');
        $('.slider').find('.list' + i).removeClass('list' + i);
      }
      sliderStart();
    });
  }

  function sliderStart() {
    // 슬라이드 초기화
    if (swiperInstance !== undefined) {
      swiperInstance.destroy();
      swiperInstance = undefined;
    }

    // 슬라이드 실행
    swiperInstance = new Swiper('.slider', {
      slidesPerView: 1,
      initialSlide: Math.floor(realInx / view),
      resistanceRatio: 0,
      observer: true,
      observeParents: true,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      on: {
        slideChange: function () {
          realInx = this.realIndex * view;
        },
      },
    });
  }
}

// 함수 실행
slideAct();

</script>
</html>