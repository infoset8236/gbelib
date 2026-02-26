<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertAttribute name="header" />

<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.fullpage.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.swiper.css"/>
<script type="text/javascript" src="/resources/common/js/jquery.fullpage.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery.swiper.min.js"></script>
<div id="wrap">
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />

	<script type="text/javascript">
	$(function() {
		
		// 팝업 관련 코드 START
		$('.close-btn').on('click', function() {
			var $this = $(this);
			var checkInput = $this.parent().find('input');
			var popupId = checkInput.val();
			if ( checkInput.prop('checked') ) {
				var todayDate 	= new Date();   
				todayDate 		= new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);  
				document.cookie = popupId + "=no" + "; path=/; expires=" + todayDate.toGMTString() + ";"	
			}
			
			$('div#'+popupId).hide();
		});
		
		$('input[id*=pop]').on('click', function(e) {
			e.preventDefault();
			$(this).prop('checked', true);
			$(this).parent('div').next('a').click();
		});
		
		$('#popupLayer > div').each(function(i, v) {
			var result = '';
			var name = $(v).attr('id');
			var nameOfCookie = name + "=";  
		    var x = 0;  
		    while ( x <= document.cookie.length ) {  
		       var y = ( x + nameOfCookie.length );
		       if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
		           if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
		               endOfCookie = document.cookie.length;  
		           result = unescape( document.cookie.substring( y, endOfCookie ) );  
		       }  
		       x = document.cookie.indexOf( " ", x ) + 1;  
		       if ( x == 0 )  
		           break;  
		    }  
			
		   	if (result != 'no') {
		   		if  (window.innerWidth < $(v).width() ) {
					$(v).css('width', 'auto');
				}
		      	$(v).show();
		   	}
		});
	   	// 팝업 관련 코드 END
	   	$(window).resize(function() {
	   		$('.lt_photo img').height($('.lt_photo img').width() * 0.9);	
	   	}).trigger('resize');
	   	
	   	
	   	$('div#calendar-box').load('calendar3.do', function() {
			//$(window).trigger('resize');
		});
	   	
	   	$('#main-search-btn').on('click', function() {
			if( $('input#search_text_1').val() == '' ) {
				alert('검색어를 입력하세요.');
				$('input#search_text_1').focus();
				return false;
			}
				$('#mainSearchForm').submit();
		});

		// 팝업존
		if ($('.popZone ul').length > 0) {
			$('.popZone ul').bxSlider({
				mode:'fade',
				pager: true,
				pagerType: 'short',
				auto: true,
				autoControls: true,
				autoControlsCombine: true
			});
		}

		$('.bx-viewport').css('height','348px');
		$('.swiper-slide > span >img').css('height','186px');
	});
	</script>

	<div class="popupWrap section">
		<div id="popupLayer">
			<homepageTag:popup popupList="${popupList}"/>
		</div>
	</div>


	<div id="fullpage">

		<!-- main0 -->
		<div class="section" id="main0">

			<div class="main-visual">

				<div class="swiper-container mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide mvimg01"><div class="mvText"><p class="main_text">함께 하는 독서친구, <b>점촌도서관 가은분관</b></p></div></div>
						<div class="swiper-slide mvimg02"><div class="mvText"><p class="main_text">함께 하는 독서친구, <b>점촌도서관 가은분관</b></p></div></div>
					</div>
				</div>

				<!-- main_search -->
				<div class="search-area" id="main_search">
					<form id="mainSearchForm" action="/${homepage.context_path}/intro/search/index.do">
					<input type="hidden" name="menu_idx" value="11">
					<input type="hidden" name="search_type2" value="L_TITLEAUTHOR">
					<fieldset>
						<legend class="blind">통합검색</legend>
						<div class="main-box">
							<div class="box1">
								<div>
									<label for="search_text_1" class="blind">통합자료검색</label>
									<input name="search_text" id="search_text_1" type="text" class="text" placeholder="검색어를 입력하세요." style="ime-mode:active;"/>
								</div>
							</div>
							<button id="main-search-btn"></button>
						</div>
					</fieldset>
					</form>
				</div>
				<!-- //Main_search -->

				<!--quick-->
				<div class="quickmenu-box">
					<div class="main-box">
						<div class="qmenus">
							<ul>
								<li class="qm1">
									<a href="/${homepage.context_path}/intro/search/index.do?menu_idx=11">
										<img src="/resources/homepage/${homepage.context_path}/img/q1.png" alt="" />
										<span>자료검색</span>
									</a>
								</li>
								<li class="qm2">
									<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=79">
										<img src="/resources/homepage/${homepage.context_path}/img/q2.png" alt="" />
										<span>대출조회예약</span>
									</a>
								</li>
								<li class="qm3">
									<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=16">
										<img src="/resources/homepage/${homepage.context_path}/img/q3.png" alt="" />
										<span>희망도서신청</span>
									</a>
								</li>
								<li class="qm4">
									<a href="/${homepage.context_path}/html.do?menu_idx=50">
										<img src="/resources/homepage/${homepage.context_path}/img/q4.png" alt="" />
										<span>도서관이용안내</span>
									</a>
								</li>
								<li class="qm5">
									<a href="http://www.gbelib.kr/gbelib/index.do" target="_blank">
										<img src="/resources/homepage/${homepage.context_path}/img/q5.png" alt="" />
										<span>통합도서관</span>
									</a>
								</li>
								<li class="qm6">
									<a href="http://www.gbelib.kr/elib/index.do" target="_blank">
										<img src="/resources/homepage/${homepage.context_path}/img/q6.png" alt="" />
										<span>전자도서관</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="line"></div>
				</div>
				<!--//quick-->

				<div class="main_scroll"><div class="main_scroll_wp_white">scroll down</div></div>
			</div>

		</div>
		<!-- //main0 -->


		<div class="section" id="main1">
			<div class='main-section'>
				<div class="notice-box">

					<h3>공지사항</h3>
					<a href="/${homepage.context_path}/board/view.do?menu_idx=36&manage_idx=767" class="big_txt_more">더보기</a>
					<div class="news con">
						<div class="box">

							<c:if test="${fn:length(noticeList) > 0}">
							<ul>
								
								<c:forEach var="i" items="${noticeList}">
								<li>
									<div>
										<a href="/${homepage.context_path}/board/view.do?menu_idx=36&manage_idx=767&board_idx=${i.board_idx}" class="notice-more">
											<p class="title">${i.title}</p>
											<p class="contents">${i.content_summary}</p>
											<p class="date"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></p>
											<a href="/${homepage.context_path}/board/view.do?menu_idx=36&manage_idx=767&board_idx=${i.board_idx}" class="notice-more"><img src="/resources/homepage/${homepage.context_path}/img/notice-more-btn.png" alt="공지사항 더보기"></a>
										</a>
									</div>
								</li>
								</c:forEach>

							</ul>
							</c:if>

							<c:if test="${fn:length(noticeList) eq 0}">
							<div class="center">
								등록된 공지가 없습니다.
							</div>
							</c:if>

						</div>
					</div>

				</div>

				<div class="cal-popzone-box">
					<!--달력-->
					<div class="calendar-box" id="calendar-box">
					</div>

					<div class="popupzone-box">
						<div class="popZone">
							<c:choose>
								<c:when test="${fn:length(popupZoneList) > 0}">
									<homepageTag:popupZone popupZoneList="${popupZoneList}" />
								</c:when>
								<c:otherwise>
									<ul>
										<li><a href="javascript:alert('현재 팝업이 없습니다.')"><img src="/resources/homepage/${homepage.context_path}/img/popupzone-img-test.png" alt="등록된 팝업이 없습니다." /></a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //main1 -->

		<!-- main2 -->
		<div class="section" id="main2">
			<div class='main-section'>
				<h2>L - 큐레이션</h2>
				<p>점촌도서관가은분관의 다양한 소식을 한 눈에 확인해 보세요.</p>

				<div class="curation-box">
					<div class="curation-section">

							<!-- 큐레이션 -->
							<div id="result" class="row row3" style="position:relative">

								<div class="col-sm-3">
									<div class="book-list-section">
										<div>
											<ul class="rolling01">
												<li>
													<div class="thumbnail">
													<a href="#" target="_blank"><img src="http://q.gbelib.kr/CATE_IMG/79/99E7B179-B60F-7951-B946-38C4636C02E8.png" alt="6월 추천도서 안내 "></a>
													</div>
													<div class="contents">
														<h3 class="book-title"><a href="#" target="_blank">6월 추천도서 안내</a></h3>
														<p class="book-desc">경상북도교육청 전자도서관에서 6월의 추천도서를 만나보세요~ 어린이 전자책 10권, 청소년 전자책 10권!</p><span class="book-info">2019-06-10</span>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="book-list-section">
										<div>
											<ul class="rolling01">
												<li>
												<div class="thumbnail">
													<a href="#" target="_blank"><img src="http://q.gbelib.kr/CATE_IMG/79/9991A0FC-540E-2EB9-CE9C-30B4862A40ED.png" alt="이달의 전자도서관 퀴즈왕! 독서퀴즈 이벤트"></a>
												</div>
												<div class="contents">
													<h3 class="book-title"><a href="#" target="_blank">이달의 전자도서관 퀴즈왕! 독서퀴즈 이벤트</a></h3>
													<p class="book-desc">2019년 4월부터 매월 전자도서관 독서퀴즈(초등 저학년, 초등 고학년, 청소년)를 실시합니다. 전자책 읽은 다음 독서퀴즈에 응모하여 상품도 받아가세요~</p>
													<span class="book-info">2019-06-10</span>
												</div>
												</li>
											</ul>
										</div>
									</div>
								</div>


								<div class="col-sm-3">
									<div class="book-list-section">
										<div>
											<ul class="rolling01">
											<li>
												<div class="thumbnail">
													<a href="#" target="_blank"><img src="http://q.gbelib.kr/CATE_IMG/79/9991A14A-740F-8DB1-A04B-5DED40095E77.png" alt="전자도서관 이용안내"></a>
												</div>
												<div class="contents">
													<h3 class="book-title"><a href="#" target="_blank">전자도서관 이용안내</a></h3>
													<p class="book-desc">경북 도내 학생들의 경우, 홈페이지 회원가입만으로 도서관 대출회원(정회원)이 될 수 있습니다. 언제 어디서나, 경상북도교육청 전자도서관에서 다양한 자료를 무료로 이용해 보세요.</p><span class="book-info">2019-06-10</span>
												</div>
											</li>
											</ul>
										</div>
									</div>
								</div>


								<div class="col-sm-3">
									<div class="book-list-section">
										<div>
											<ul class="rolling01">
												<li>
													<div class="thumbnail">
													<a href="#" target="_blank"><img src="http://q.gbelib.kr/CATE_IMG/79/99E7B179-B60F-7951-B946-38C4636C02E8.png" alt="6월 추천도서 안내 "></a>
													</div>
													<div class="contents">
														<h3 class="book-title"><a href="#" target="_blank">6월 추천도서 안내</a></h3>
														<p class="book-desc">경상북도교육청 전자도서관에서 6월의 추천도서를 만나보세요~ 어린이 전자책 10권, 청소년 전자책 10권!</p><span class="book-info">2019-06-10</span>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>


								<div class="bx-controls bx-has-controls-direction">
									<div class="bx-controls-direction">
										<a class="bx-prev" id="bxprev" href="javascript:void(0);"><img src="/resources/homepage/${homepage.context_path}/img/prev-btn.png" alt="이전" /></a>
										<a class="bx-next" id="bxnext" href="javascript:void(0);"><img src="/resources/homepage/${homepage.context_path}/img/next-btn.png" alt="다음" /></a>
									</div>
								</div>
							</div>
							<!-- /큐레이션 -->
							<div class="end"></div>

					</div>
				</div>

			</div>

		</div>
		<!-- //main2 -->


		<!-- main3 -->
		<div class="section main3" id="main3">

			<div class="main-section">
				<div class="book-box web-view">
					<h3>권장도서</h3>
					<div id="main-slide" class="main-floor1">
						<div class="swiper-container gallery-top-main">
							<div class="swiper-wrapper">
								<c:forEach var="i" items="${bookList}">
								<div class="swiper-slide">
									<div class="main-slide1-con">
										<div class="text">
											<h4>${i.title}</h4>
											<p>
												<c:choose>
													<c:when test="${fn:length(i.content_summary) > 224}">
														${fn:substring(i.content_summary, 0, 224)}...
													</c:when>
													<c:otherwise>
														${i.content_summary}
													</c:otherwise>
												</c:choose>
											</p>
										</div>
										<div class="photo">
											<a href="/${homepage.context_path}/board/view.do?menu_idx=13&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}">
											<c:choose>
												<c:when test="${fn:indexOf(i.preview_img, 'http') > -1 }">
													<img src="${i.preview_img}" alt="${i.title}" />
												</c:when>
												<c:otherwise>
													<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}" />
												</c:otherwise>
											</c:choose>
											</a>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-container gallery-thumbs-main">
							<div class="swiper-wrapper">
								<c:forEach var="j" items="${bookList}">
								<div class="swiper-slide">
								<span>
									<c:choose>
										<c:when test="${fn:indexOf(j.preview_img, 'http') > -1 }">
											<img src="${j.preview_img}" alt="${j.title}" />
										</c:when>
										<c:otherwise>
											<img src="/data/board/${j.manage_idx}/${j.board_idx}/${j.preview_img}" alt="${j.title}" />
										</c:otherwise>
									</c:choose>
								</span>
								<span class='title'>${j.title}</span>
								</div>
								</c:forEach>
							</div>
						</div>
						<!-- Add Arrows -->
						<a href="#none" class="swiper-button-next" id="focusA"></a>
						<a href="#none" class="swiper-button-prev"></a>
					</div>

					<script>
						var galleryThumbsMain = new Swiper('.gallery-thumbs-main', {
							spaceBetween: 5,
							slidesPerView: 4,
							loop: true,
							touchRatio: 0.2,
							slideToClickedSlide: true,
							freeMode: true,
							loopedSlides: 8, //looped slides should be the same
							watchSlidesVisibility: true,
							watchSlidesProgress: true,
						});
						var galleryTopMain = new Swiper('.gallery-top-main', {
							spaceBetween: 5,
							effect: 'fade',
							loop:true,
							autoplay: {
								delay: 3000,
								disableOnInteraction: false,
							},
							loopedSlides: 8, //looped slides should be the same
							navigation: {
								nextEl: '.swiper-button-next',
								prevEl: '.swiper-button-prev',
							},
							 pagination: {
								el: '.swiper-pagination',
								clickable: true,
							},
							on: {
								autoplayStop: function() {
									this.$el.find(".ups-icon-videoplay").addClass('stop-status');
								},
								autoplayStart: function() {
									this.$el.find(".ups-icon-videoplay").removeClass('stop-status');
								},
							},
						});
						galleryTopMain.$el.find(".ups-icon-videoplay").on('click', function() {
							if (galleryTopMain.autoplay.running) {
								galleryTopMain.autoplay.stop();
							} else {
								galleryTopMain.autoplay.start();
							}
						});
						galleryTopMain.controller.control = galleryThumbsMain; 
						galleryThumbsMain.controller.control = galleryTopMain;
					</script>
				</div>

				<div class="book-box mobile-view">
					<h3>권장도서</h3>

					<div class="cont bookPickList">
						<ul>
							<c:forEach var="k" items="${bookList}">
							<li>
								<a href="/${homepage.context_path}/board/view.do?menu_idx=13&manage_idx=${k.manage_idx}&board_idx=${k.board_idx}">
									<div class="thumbnails">
										<c:choose>
											<c:when test="${fn:indexOf(k.preview_img, 'http') > -1 }">
												<img src="${k.preview_img}" alt="${k.title}" />
											</c:when>
											<c:otherwise>
												<img src="/data/board/${k.manage_idx}/${k.board_idx}/${k.preview_img}" alt="${k.title}" />
											</c:otherwise>
										</c:choose>
									</div>
									<h3 class="book-title"><c:choose><c:when test="${fn:length(k.title) > 18}">${fn:substring(k.title, 0, 18)}...</c:when><c:otherwise>${k.title}</c:otherwise></c:choose></h3>
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>
			<div class="end"></div>
			
			<div class="banner-box">
				<div class="main-section">

					<div class="main7_banner">
						<div class="banner-wrap type5">
							<div class="banner-t5">
								<div class="control">
									<a class="prev" href="#prev"><img src="/resources/homepage/${homepage.context_path}/img/banner-prev.png" alt="이전" /><span class="blind">이전</span></a>
									<a class="stop active" href="#stop"><img src="/resources/homepage/${homepage.context_path}/img/banner-stop.png" alt="정지" /><span class="blind">정지</span></a>
									<a class="play" href="#play"><img src="/resources/homepage/${homepage.context_path}/img/banner-start.png" alt="시작" /><span class="blind">시작</span></a>
									<a class="next" href="#next"><img src="/resources/homepage/${homepage.context_path}/img/banner-next.png" alt="다음" /><span class="blind">다음</span></a>
								</div>
							</div>
							<div class="banner-box5">
								<homepageTag:banner bannerList="${bannerList}"/>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
		<!-- //main3 -->

		<!-- footer_section -->
		<div class="section fp-auto-height footer_area" id="foot_section">
			<tiles:insertAttribute name="footer" />
		</div>
		<!-- //footer_section -->
		
	</div>

</div>
</body>
</html>



<script type="text/javascript">
function fullPage() {
	var myFullpage = new fullpage('#fullpage', {
		anchors: ['firstPage', 'secondPage', '3rdPage'],
		navigation:true,
		showActiveTooltip: true,
		menu: '#menu',
		responsiveWidth: 1025,
		afterLoad: function(origin, destination, direction){
			var cur_page = destination.index+1;
			if (destination.index == 0 ) {
				$('#header').addClass("background-white");
				$('.Gnb').css('border-top','1px solid #e4e4e4');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#fff');
			}  else if( destination.index == 1 ) {
				$('#header').addClass("background-white");
				$('.Gnb').css('border-top','1px solid #e4e4e4');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#fff');
			}	else if( destination.index == 2 ) {
				$('#header').addClass("background-white");
				$('.Gnb').css('border-top','1px solid #e4e4e4');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#fff');
			}  else if( destination.index == 3 ) {
				$('#header').addClass("background-white");
				$('.Gnb').css('border-top','1px solid #e4e4e4');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#fff');
			} else {
				$('#header').addClass("background-white");
				$('.Gnb').css('border-top','1px solid #e4e4e4');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#fff');
			}
		},
		afterResponsive: function(isResponsive){}
	});
};

fullPage();

// 모바일일 경우 fullpage 미사용
if ( $(window).width() < 1025 ) {
	if ($('#fullpage').hasClass('fp-destroyed')){
	} else {
		fullpage_api.destroy('all');
	}
} else {
	fullPage();
};

// 리사이즈 될때 모바일 화면에서 fullpage 미사용
$( window ).resize( function(e) {
	if ( $(window).width() < 1025 ) {
		if ($('#fullpage').hasClass('fp-destroyed')){
		} else {
			fullpage_api.destroy('all');
		}
	} else {
		fullPage();
	};
});
</script>
<script>
    var mySwiper = new Swiper('.mySwiper', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
	  effect: 'fade',
	  loop: true,
      pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
	$('.start').on('click', function(){
		mySwiper.autoplay.start();
		return false;
	})
	$('.stop').on('click', function(){
		mySwiper.autoplay.stop();
		return false;
	});

</script>
