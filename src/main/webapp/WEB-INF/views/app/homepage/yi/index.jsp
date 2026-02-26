<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertAttribute name="header" />

<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.fullpage.css"/>
<script type="text/javascript" src="/resources/common/js/jquery.fullpage.js"></script>

<div id="wrap">
	<nav id="menu"></nav>
	<div id="header">
		<tiles:insertAttribute name="top" />
		<tiles:insertAttribute name="topMenu" />
	</div>
<script type="text/javascript">
$(function() {
	$('.bx-wrapper').css('margin','0 auto');

	// 팝업 관련 코드 START
	$('.close-btn').on('click', function() {
		var $this = $(this);
		var checkInput = $this.parent().find('input');
		var popupId = checkInput.val();
		if (checkInput.prop('checked')) {
			var todayDate = new Date();
			todayDate = new Date(
					parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
			document.cookie = popupId + "=no"
					+ "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}

		$('div#' + popupId).hide();
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
		while (x <= document.cookie.length) {
			var y = (x + nameOfCookie.length);
			if (document.cookie.substring(x, y) == nameOfCookie) {
				if ((endOfCookie = document.cookie
						.indexOf(";", y)) == -1)
					endOfCookie = document.cookie.length;
				result = unescape(document.cookie
						.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
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
	
	$('#all-popup-wrap').each(function(i, v) {
			var result = '';
			var name = $(v).attr('class');
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length) {
				var y = (x + nameOfCookie.length);
				if (document.cookie.substring(x, y) == nameOfCookie) {
					if ((endOfCookie = document.cookie
							.indexOf(";", y)) == -1)
						endOfCookie = document.cookie.length;
					result = unescape(document.cookie
							.substring(y, endOfCookie));
				}
				x = document.cookie.indexOf(" ", x) + 1;
				if (x == 0)
					break;
			}

			if (result != 'no') {
				if  (window.innerWidth < $(v).width() ) {
					$(v).css('width', 'auto');
				}
				$(v).show();
				$('#all-popup-wrap').load('popupAll.do', function() {
					//$(window).trigger('resize');
				});
			} else {
				$('#all-popup-wrap').empty;
			}
		});

	$('#main-search-btn').on('click', function() {
		if( $('input#search_text_1').val() == '' ) {
			alert('찾으시는 도서 정보를 입력하세요.');
			$('input#search_text_1').focus();
			return false;
		}
			$('#mainSearchForm').submit();
	});

	$('#calendar-box').load('calendar3.do', function() {
		//$(window).trigger('resize');
	});

});
</script>

	<div class="popupWrap section">
		<div id="popupLayer">
			<homepageTag:popup popupList="${popupList}"/>
		</div>
	</div>
	
	<c:if test="${not empty popupFullList}">
	<!--통합팝업-->
		<div id="all-popup-wrap" class="all-popup-${homepage.homepage_id}" style="display:none"/>
			
		</div>
	<!--//통합팝업-->
	</c:if>


	<div id="fullpage">
		<!--메인-->
		<div id="main0" class="section">
			<div class="sections main0">
				<div class="main0-top">

					<div class="sections">
						<div class="search-box">

							<div class="main-box">
								<form id="mainSearchForm" action="/${homepage.context_path}/intro/search/index.do">
									<input type="hidden" name="menu_idx" value="8">
									<input type="hidden" name="search_type2" value="L_TITLEAUTHOR">
									<fieldset>
										<legend class="blind">통합검색</legend>
										<div class="box1">
											<div class="box2">
												<label for="search_text_1" class="blind">자료검색</label>
												<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서 정보를 입력하세요." style="ime-mode:active;"/>
											</div>
										</div>
										<button id="main-search-btn">통합검색</button>
									</fieldset>
								</form>
							</div>

						</div>
					</div>

				</div>
				<div class="main0-bottom">

					<div class="qmenu" id="mainQmenu">
						<ul>
							<li class="qm2">
									<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=116" title="대출조회·예약">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/yi/img/main/q2.png" data-onsrc="/resources/homepage/yi/img/main/q2-on.png" data-outsrc="/resources/homepage/yi/img/main/q2.png" alt="대출조회·예약"></div>
											<div class="qtxt1">대출조회·예약</div>
											<div class="qtxt2">이용자 본인의 대출 및 반납내역을 상세하게 확인할 수 있습니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm3">
									<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=16" title="희망도서신청">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/yi/img/main/q3.png" data-onsrc="/resources/homepage/yi/img/main/q3-on.png" data-outsrc="/resources/homepage/yi/img/main/q3.png" alt="희망도서신청"></div>
											<div class="qtxt1">희망도서신청</div>
											<div class="qtxt2">이용하고자 하는 도서가 도서관에 없을 경우, 원하는 도서를 신청할 수 있습니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm4">
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=209&searchCate1=16,17" title="문화행사">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/yi/img/main/q4.png" data-onsrc="/resources/homepage/yi/img/main/q4-on.png" data-outsrc="/resources/homepage/yi/img/main/q4.png" alt="문화행사"></div>
											<div class="qtxt1">문화행사</div>
											<div class="qtxt2">도서관의 문화행사 프로그램을 확인해보세요!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm5">
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=167&searchCate1=18" title="평생교육">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/yi/img/main/q5.png" data-onsrc="/resources/homepage/yi/img/main/q5-on.png" data-outsrc="/resources/homepage/yi/img/main/q5.png" alt="평생교육"></div>
											<div class="qtxt1">평생교육</div>
											<div class="qtxt2">다양한 평생교육프로그램을 통해서 책과 더욱 친해져보세요!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm1">
									<a href="/${homepage.context_path}/html.do?menu_idx=90" title="이용안내">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/yi/img/main/q1.png" data-onsrc="/resources/homepage/yi/img/main/q1-on.png" data-outsrc="/resources/homepage/yi/img/main/q1.png" alt="이용안내"></div>
											<div class="qtxt1">이용안내</div>
											<div class="qtxt2">경상북도교육청 영일도서관 이용방법에 대해서 자세하게 안내드립니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		
		<!--공지+팝업존-->
		<div id="main1" class="section">
			<div class="main1_wrap mid-sections">
				<div class="main1-left-box">
					<div class="notice-box">
						<div class="title">
							<h3>공지사항</h3>
							<a href="/${homepage.context_path}/board/index.do?menu_idx=58&manage_idx=43" title="공지사항 더보기 버튼">
								더보기 +<!-- <img src="/resources/common/img/notice_type03/more-btn.png" alt="공지사항 더보기 이미지" title="공지사항 더보기 이미지"> -->
							</a>
						</div>
						<div class="list">
							<ul>
								<c:forEach var="i" items="${noticeList}">
									<li>
										<a href="/${homepage.context_path}/board/view.do?menu_idx=58&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="공지사항 자세히 보기">
											<h3>${i.title}</h3>
											<p><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></p>
										</a>
									</li>
								</c:forEach>
								<c:if test="${empty noticeList}">
									<li>
										<a href="javascript:void(0)">
											등록된 공지사항이 없습니다.
										</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>

				<div class="main1-right-box">
					<div class="title">
						<h3>팝업존</h3>
					</div>
					<div class="popupzonenew2">
						<c:choose>
							<c:when test="${fn:length(popupZoneList) > 0}">
								<homepageTag:popupZone popupZoneList="${popupZoneList}" />
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href="javascript:void(0);"><img src="/resources/common/img/notice_type03/popupnone.png" alt="팝업이 없습니다." /></a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		
		<!--일정+행사-->
		<div id="main2" class="section">
			<div class="main2-wrap mid-sections">
				<div class="calendar-box">
					<div class="title">
						<h3>일정</h3>
						<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=104" title="일정 더보기 버튼">
							더보기 +<!-- <img src="/resources/common/img/culture_type02/more-btn-b.png" alt="일정 더보기 이미지" title="일정 더보기 이미지"> -->
						</a>
					</div>
					<div class="calendar-box" id="calendar-box">
					</div>
				</div>
				<div class="event-box">
					<div class="title">
						<h3>도서관 행사</h3>
						<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=209&searchCate1=16,17,18" title="행사 더보기 버튼">
							더보기 +<!-- <img src="/resources/common/img/culture_type02/more-btn-b.png" alt="행사 더보기 이미지" title="행사 더보기 이미지"> -->
						</a>
					</div>
					<div class="list">
						<ul>
							<c:forEach var="i" items="${teachList}">
								<li>
									<a href="/${homepage.context_path}/module/teach/detail.do?menu_idx=209&searchCate1=${i.large_category_idx}&group_idx=${i.group_idx}&category_idx=${i.category_idx}&teach_idx=${i.teach_idx}&homepage_id=${i.homepage_id}">
										<div>
											<h3>${i.teach_name }</h3>
											<span>${i.teach_desc }</span><br class="pcBr"/><br />
											<p><b>강좌기간</b>${i.start_date} ~ ${i.end_date }</p>
											<p><b>접수기간</b>${i.start_join_date} ~ ${i.end_join_date}</p>
										</div>
									</a>
								</li>
							</c:forEach>
							<c:if test="${empty teachList}">
								<li>
									<a href="javascript:void(0)">
										<div>
											등록된 강좌가 없습니다.
										</div>
									</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!--도서-->
		<div id="main5" class="section">
			<div class="main5-visual">
				<script>
					$(function(){
						var _width = $(window).width();
						var _bookListTop;
						var _bookListBottom;

							var Books = function(){
								try {
									if( _bookListTop ) _bookListTop.destroySlider();
									if( _bookListBottom ) _bookListBottom.destroySlider();
								} catch (e) {
									// TODO: handle exception
								}

								if( _width <= 380 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 190,
										slideMargin: 0
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 190,
										slideMargin: 0
									});
								}
								else if( _width <= 550 && _width > 380 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 2,
										slideWidth: 190,
										slideMargin: 0
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 2,
										slideWidth: 190,
										slideMargin: 0
									});
								}
								else if( _width <= 768 && _width > 550 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 3,
										slideWidth: 190,
										slideMargin: 10
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 3,
										slideWidth: 190,
										slideMargin: 10
									});
								}
								else if( _width <= 1024 && _width > 768 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 20
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 20
									});
								}
								else if( _width <= 1600 && _width > 1024 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 10
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 20
									});
								}
								else {
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 5,
										slideWidth: 190,
										slideMargin: 30
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 5,
										slideWidth: 190,
										slideMargin: 30
									});
								}
							};
							Books();
							$(window).on('resize', function(){
								_width = $(window).width();
								Books();
							});
					});
				</script>
				<div class="main5-top-wrap">
					<div class="main5-top">
						<div class="mid-sections">
							<div class="main5-top-left">
								<div class="title">
									<h2><div class='stxt'>NEW ARRIVAL BOOK</div><div class='ltxt'>신착도서</div></h2>
									<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=257" class="more"><img src="/resources/common/img/book_type01/book-more-btn.png" alt="더보기" /></a>
								</div>
							</div>
							<div class="main5-top-right">
								<div class="outer">
									<div class="inner">
										<div class="bookListTop">
											<ul>
												<c:forEach var="i" items="${newBookList.dsNewBookList}">
													<li class="item">
														<a href="/${homepage.context_path}/intro/search/detail.do?vLoca=${i.LOCA}&vCtrl=${i.CTRLNO}&vImg=${i.COVER_SMALLURL }&menu_idx=257">
															<div class="">
																<img src="${not empty i.COVER_SMALLURL ? i.COVER_SMALLURL : '/resources/homepage/gm/img/noimg1.png' }" alt="${i.TITLE}" title="${i.TITLE}"/>
															</div>
															<div class="btxt">
																${i.TITLE}
															</div>
														</a>
													</li>
												</c:forEach>
												<c:if test="${empty newBookList.dsNewBookList}">
													<li class="item">
														<a href="javascript:void(0)">
															등록된 신착도서가 없습니다.
														</a>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="end"></div>
						</div>
					</div>
				</div>
				<div class="main5-bottom-wrap">
					<div class="main5-bottom">
						<div class="mid-sections">
							<div class="main5-bottom-right">
								<div class="title">
									<h2><div class='stxt'>RECOMMEND BOOK</div><div class='ltxt'>추천도서</div></h2>
									<a href="/${homepage.context_path}/board/index.do?menu_idx=21&manage_idx=33" class="more"><img src="/resources/common/img/book_type01/book-more-btn.png" alt="더보기" /></a>
								</div>
							</div>
							<div class="main5-bottom-left">
								<div class="outer">
									<div class="inner">
										<div class="bookListBottom">
											<ul>
												<c:forEach items="${bookList}" var="i">
													<li class="item">
														<a href="/${homepage.context_path}/board/view.do?menu_idx=21&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}">
															<div class="">
																<c:choose>
																	<c:when test="${fn:indexOf(i.preview_img, 'http') > -1 }">
																		<img src="${i.preview_img}" alt="${i.title}" title="${i.title}" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</c:when>
																	<c:otherwise>
																		<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}" title="${i.title}" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</c:otherwise>
																</c:choose>
															</div>
															<div class="btxt">
																${i.title}
															</div>
														</a>
													</li>
												</c:forEach>
												<c:if test="${empty bookList}">
													<li class="item">
														<a href="javascript:void(0)">
															등록된 추천도서가 없습니다.
														</a>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>

							<div class="end"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--큐레이션-->
		<div id="main6" class="section">
			<div class="main6-wrap">
				<div id="result" style="position:relative">
				</div>
			</div>
		</div>

		<!-- footer_section -->
		<div class="bottom-banner-wrap">
			<div class="banner-box">
				<div class="sections">
					<!-- 작업할거 없음. 이미 다 처리. -->
					<div class="banner-wrap type6">
						<div class="banner-t6">
							<div class="control">
								<a class="prev" href="#prev"><img src="/resources/homepage/gbelib/img/section04/banner-prev-btn.png" alt="이전" /><span class="blind">이전</span></a>
								<a class="next" href="#next"><img src="/resources/homepage/gbelib/img/section04/banner-next-btn.png" alt="다음" /><span class="blind">다음</span></a>
							</div>
						</div>
						<div class="banner-box6">
							<homepageTag:banner bannerList="${bannerList}"/>
						</div>
						<div class='banner-t6-after'>
							<div class="control">
								<a class="stop active" href="#stop"><img src="/resources/homepage/gbelib/img/section04/banner-stop-btn.png" alt="정지" /><span class="blind">정지</span></a>
								<a class="play" href="#play"><img src="/resources/homepage/gbelib/img/section04/banner-start-btn.png" alt="시작" /><span class="blind">시작</span></a>
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=276"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section fp-auto-height footer_area" id="foot_section">
		<tiles:insertAttribute name="footer" />
		</div>
	</div>

</div>

</body>
</html>


<script type="text/javascript">
function fullPage() {
	var myFullpage = new fullpage('#fullpage', {
		anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage', '5thPage'],
		navigation:true,
		showActiveTooltip: true,
		menu: '#menu',
		responsiveWidth: 1025,
		afterLoad: function(origin, destination, direction){
			var cur_page = destination.index+1;
			if (destination.index == 0 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}  else if( destination.index == 1 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}	else if( destination.index == 2 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}  else if( destination.index == 3 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			} else {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
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