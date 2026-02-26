<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<tiles:insertAttribute name="header" />

<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.fullpage.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.swiper.css"/>
<script type="text/javascript" src="/resources/common/js/jquery.fullpage.js"></script>

<div id="wrap">
	<nav id="menu"></nav>
	<div id="header">

		<tiles:insertAttribute name="top" />
		<tiles:insertAttribute name="topMenu" />

	</div>
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

			//키보드로 팝업 닫기 버튼
			$('.close-btn').on('keydown', function(e) {
				if (e.keyCode==32) {
					$('html, body').animate({scrollTop: 0 }, 'fast');  //spacebar 바로 인해 내려간 화면을 다시 올려줌
					var $this = $(this);
					var checkInput = $this.parent().find('input');
					var popupId = checkInput.val();
					if ( checkInput.prop('checked') ) {
						var todayDate 	= new Date();
						todayDate 		= new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
						document.cookie = popupId + "=no" + "; path=/; expires=" + todayDate.toGMTString() + ";"
					}
					$('div#'+popupId).hide();
				}
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
				if ($('input#search_text_1').val() == '') {
					alert('찾으시는 도서 정보를 입력하세요.');
					$('input#search_text_1').focus();
					return false;
				}
				$('#mainSearchForm').submit();
			});

			$('div.mb4').load('calendar2.do');
			
			$('#calendar-box').load('calendar3.do', function() {
				//$(window).trigger('resize');
			});
			
			$('#book-list').load('newBook.do');
			
			$('#book-box .tab li').on('click', function(){
				var tab = $(this).attr('keyValue');
				if (!$(this).hasClass("on")) {
					if (tab == 'tab1') { // 신착도서
						$(this).find('span a').attr('href', '/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=208');
						$('#book-list').load('newBook.do');
					} else if (tab == 'tab2') { // 추천도서
						$('#more-link').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=137&manage_idx=10');
						$('#book-list').load('bestBook.do?manage_idx=10&count=4');
					}
				}
				
				$('#book-box .tab li').removeClass('on');
				$(this).addClass('on');
			});
			
			
			$('#main1 .board-box ul li').on('click', function(){
				var tab = $(this).attr('keyValue');
				if (!$(this).hasClass("on")) {
					if (tab == 'tab1') { // 공지사항
						$('#notice-list').show();
						$('#news-list').hide();
						$('#lost-list').hide();
					} else if (tab == 'tab2') { // 뉴스
						$('#notice-list').hide();
						$('#news-list').show();
						$('#lost-list').hide();
					} else if (tab == 'tab3') { // 유실물
						$('#notice-list').hide();
						$('#news-list').hide();
						$('#lost-list').show();
					}
				}
				
				$('#main1 .board-box ul li').removeClass('on');
				$(this).addClass('on');
			});
			
			$('#main2 #it-box #it-list').load('itLecutre01.do?menu_idx=0&homepage_id=${homepage.homepage_id}&manage_idx=839&count=8');
			
			$('#main2 #it-tab li').on('click', function() {
				var tab = $(this).attr('keyValue');
				if (!$(this).hasClass("on")) {
					if (tab == 'tab1') {
						$('#main2 #it-box #it-list').load('itLecutre01.do?menu_idx=0&homepage_id=${homepage.homepage_id}&manage_idx=839&count=8');
					} else if (tab == 'tab2'){
						$('#main2 #it-box #it-list').load('itLecutre02.do?menu_idx=0&homepage_id=${homepage.homepage_id}&manage_idx=840&count=8');
					} else if (tab == 'tab3') {
						$('#main2 #it-box #it-list').load('itLecutre03.do?menu_idx=0&homepage_id=${homepage.homepage_id}&manage_idx=841&count=8');
					}
					
					$('#main2 #it-tab li').removeClass('on');
					$(this).addClass('on');
				}
			});

		});
	</script>

	<div class="popupWrap section">
		<div id="popupLayer">
			<c:forEach items="${popupList}" var="i" varStatus="status">
			<c:if test=""></c:if>
			<div id="popup_${i.homepage_id}_${i.popup_idx}" style="display:none; position: absolute; z-index: 999999; width: ${i.width}px; top: ${i.y_position}px; left: ${i.x_position}px;">
				<div class="popup-cont type1">
					<a target="${i.link_target eq 'BLANK' ? '_blank' : '_self' }" href="${i.link_url}" >
						<c:choose>
						<c:when test="${i.homepage_id eq 'h1' and i.popup_idx eq '3'}">
									<img style="width:${i.width}px;height:${i.height}px" alt="경상북도교육청 공공도서관 회원가입 안내
						경상북도교육청 소속 공공도서관(28개관)은 2017년부터 도서관통합정보시스템 구축으로 회원정보가 통합운영됩니다.
						하나의 아이디와 대출회원증으로 28개 도서관 홈페이지, 대출/반납 서비스를 이용할 수 있습니다.
						2017년 이전(시스템 통합 전)에 가입한 대출회원은 통합회원 동의를 통해 28개 도서관 홈페이지와 전자도서관 등을 이용할 수 있습니다.
						 통합회원 동의 방법
						 홈페이지 로그인 다음 통합회원 동의안내 다음 중복회원은 하나의 ID선택(대출이력통합 처리) 다음 30분 이내 적용완료됨
						 로그인 방법 변경 안내
						 '개인정보의 안전성 확보조치 기준'에 의해 2017년 12월 1일부터 ID/비밀번호로만 로그인 됩니다. 대출회원번호/이름으로는 로그인 할 수 없습니다.
						 ID가 없는 회원은 12월 1일 이전에 ID를 생성하시기 바랍니다.
						 ID 생성 방법
						 홈페이지 로그인 (대출회원번호/이름) 다음 통합회원 동의안내 다음 ID생성" src="/data/popup/${i.homepage_id}/${i.real_file_name}">
						<i class="fa fa-external-link"></i>
						</c:when>
						<c:otherwise>
						<img style="width:${i.width}px;height:${i.height}px" alt="${i.popup_name}" src="/data/popup/${i.homepage_id}/${i.real_file_name}">
						</c:otherwise>
						</c:choose>
					</a>
				</div>
				<div class="popup-func">
					<div class="checkbox">
						<input id="pop${i.homepage_id}_${i.popup_idx}" name="popup_${i.homepage_id}_${i.popup_idx}" value="popup_${i.homepage_id}_${i.popup_idx}" type="checkbox">
						<label title="오늘하루 열지않음" style="line-height: 34px;" for="pop${i.homepage_id}_${i.popup_idx}">오늘하루 열지않음</label>
					</div>
					<a tabindex="1" class="btn close-btn">
						<i class="fa fa-close"></i>
					<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<c:if test="${not empty popupFullList}">
	<!--통합팝업-->
		<div id="all-popup-wrap" class="all-popup-${homepage.homepage_id}" style="display:none"/>
			
		</div>
	<!--//통합팝업-->
	</c:if>

	<div id="fullpage">
		<!--main0-->
		<div id="main0" class="section">
			<div class="main-box">
				<div class="box0-1">
					<div class="popupzone">
						<ul>
						<c:choose>
							<c:when test="${fn:length(popupZoneList) > 0}">
								<c:forEach  var="i" items="${popupZoneList}">
									<li>
										<div class="txt">
											<h3>${i.popup_zone_name}</h3>
											<p>${i.content}</p>
											<a href="${i.link_url}" target="${i.link_target eq 'BLANK' ? '_blank' : '_self' }" title="${i.popup_zone_name}" class="read_more">
												자세히보기
											</a>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li>
									<div class="txt">
										<h3>등록된 팝업이 없습니다.</h3>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
					<div class="search-quick">
						<form id="mainSearchForm" action="/${homepage.context_path}/intro/search/index.do">
						<div class="search-box">
							<div class="box1">
								<div class="box2">
										<input type="hidden" name="menu_idx" value="129">
										<input type="hidden" name="search_type2" value="L_TITLEAUTHOR">
										<fieldset>
											<legend class="blind">통합검색</legend>
											<!-- <div class="box1">
												<div class="box2"> -->
													<label for="search_text_1" class="blind">자료검색</label>
													<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서의 정보를 입력해주세요." style="ime-mode:active;"/>
												<!-- </div>
											</div> -->
										</fieldset>
								</div>
							</div>
							<button id="main-search-btn"><img src="/resources/homepage/geic/img/search-btn.png" alt="돋보기 이미지" title="돋보기 이미지"></button>
						</div>
						</form>
						<div class="quick-box1">
							<ul>
								<a href="/${homepage.context_path}/html.do?menu_idx=2" title="교육행정포털">
									<li class="q1-1">
											<span>교육행정포털</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/html.do?menu_idx=196" title="정보화연수">
									<li class="q1-2">
											<span>정보화연수</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/html.do?menu_idx=200" title="나이스교무연수">
									<li class="q1-3">
											<span>나이스교무연수</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=162&searchCate1=18" title="평생교육신청">
									<li class="q1-4">
											<span>평생교육신청</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/intro/search/index.do?menu_idx=129" title="자료검색">
									<li class="q1-5">
											<span>자료검색</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=90" title="대출조회예약">
									<li class="q1-6">
											<span>대출조회예약</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=213" title="희망도서신청">
									<li class="q1-7">
											<span>희망도서신청</span>
									</li>
								</a>
								<a href="/${homepage.context_path}/html.do?menu_idx=177" title="도서관이용안내">
									<li class="q1-8">
											<span>도서관이용안내</span>
									</li>
								</a>
								<a href="https://www.gbelib.kr/elib/index.do" title="전자도서관" target="_blank">
									<li class="q1-9">
											<span>전자도서관</span>
									</li>
								</a>
							</ul>
						</div>
					</div>
				</div>
				<div class="box0-2">
					<div class="calendar-box" id="calendar-box">
					</div>
					
					<div class="book-box" id="book-box">
						<ul class="tab green">
							<li class="on" keyValue="tab1">
								<span>
									신착도서
									<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=208" title="신착도서 링크">
										<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
									</a>
								</span>
							</li>
							<li keyValue="tab2">
								<span>
									추천도서
								</span>
								<a href="/${homepage.context_path}/board/index.do?menu_idx=137&manage_idx=10" title="추천도서 링크">
									<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
								</a>
							</li>
						</ul>
						<div class="Booklist">
							<div id="book-list">

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--main1-->
		<div id="main1" class="section">
			<div class="main-box" style="height:auto;">
				<div class="box1-1">
					<div class="board-box">
						<ul class="tab green">
							<li class="on" keyValue="tab1">
								<span>
									공지사항
									<a href="/${homepage.context_path}/board/index.do?menu_idx=52&manage_idx=1" title="공지사항 게시물">
										<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
									</a>
								</span>
							</li>
							<li keyValue="tab2">
								<span>
									센터뉴스
									<a href="/${homepage.context_path}/board/index.do?menu_idx=77&manage_idx=8" title="센터뉴스 게시물">
										<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
									</a>
								</span>
							</li>
							<li keyValue="tab3">
								<span>
									유실물안내
									<a href="/${homepage.context_path}/board/index.do?menu_idx=69&manage_idx=7" title="유실물안내 게시물">
										<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
									</a>
								</span>
							</li>
						</ul>
						<ul class="board-list" id="notice-list">
							<c:forEach var="i" items="${noticeList}">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=52&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="공지사항 자세히 보기">
										${i.title}
									</a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
								</li>
							</c:forEach>
							<c:if test="${fn:length(noticeList) < 1}">
								<li>
									<a href="javascript:void(0);" title="공지사항 자세히 보기">
										등록된 게시물이 없습니다.
									</a>
									<span></span>
								</li>
							</c:if>
						</ul>
						<ul class="board-list" style="display: none;" id="news-list">
							<c:forEach var="i" items="${newsList}">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=77&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="센터뉴스 자세히 보기">
										${i.title}
									</a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
								</li>
							</c:forEach>
							<c:if test="${fn:length(newsList) < 1}">
								<li>
									<a href="javascript:void(0);" title="공지사항 자세히 보기">
										등록된 게시물이 없습니다.
									</a>
									<span></span>
								</li>
							</c:if>
						</ul>
						<ul class="board-list" style="display: none;" id="lost-list">
							<c:forEach var="i" items="${lostList}">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=69&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="유실물안내 자세히 보기">
										${i.title}
									</a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
								</li>
							</c:forEach>
							<c:if test="${fn:length(lostList) < 1}">
								<li>
									<a href="javascript:void(0);" title="공지사항 자세히 보기">
										등록된 게시물이 없습니다.
									</a>
									<span></span>
								</li>
							</c:if>
						</ul>
					</div>
					<script>
					$(function(){
						var _width = $(window).width();
						var _Gslide;

							var Books = function(){
								try {
									if( _Gslide ) _Gslide.destroySlider();
								} catch (e) {
									// TODO: handle exception
								}

								if( _width <= 380 ){
									_Gslide = $('.Gslide ul').bxSlider({
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
								else if( _width <= 450 && _width > 380 ){
									_Gslide = $('.Gslide ul').bxSlider({
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
								else if( _width <= 720 && _width > 450 ){
									_Gslide = $('.Gslide ul').bxSlider({
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
								else if( _width <= 1024 && _width > 720 ){
									_Gslide = $('.Gslide ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 190,
										slideMargin: 20
									});
								}
								else if( _width <= 1700 && _width > 1024 ){
									_Gslide = $('.Gslide ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 300,
										slideMargin: 0
									});
								}
								else {
									_Gslide = $('.Gslide ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 2,
										slideWidth: 300,
										slideMargin: 20,
										//autoControls: true
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
					<div class="gallery-box Gslide">
						<h4>
							사진으로 보는 센터
							<a href="/${homepage.context_path}/board/index.do?menu_idx=77&manage_idx=8" title="사진으로 보는 센터 링크">
								<img src="/resources/homepage/geic/img/more-view-btn-b.png" alt="더보기 이미지" title="더보기 이미지">
							</a>
						</h4>
						<ul class="gallery-list2">
							<c:choose>
								<c:when test="${fn:length(newsList) > 0}">
									<c:forEach var="i" items="${newsList}" begin="0" end="1">
										<li>
											<a href="/${homepage.context_path}/board/view.do?menu_idx=77&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="센터뉴스 자세히 보기">
												<c:choose>
												<c:when test="${i.preview_img ne null}">
													<c:choose>
														<c:when test="${fn:contains(i.preview_img, 'http')}">
															<img src="${i.preview_img}" alt="${i.title}"/>
															<p>${i.title}</p>
															<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
														</c:when>
														<c:otherwise>
															<img class="previewImg" src="/data/board/${i.manage_idx}/${i.board_idx}/thumb/${i.preview_img}" alt="${i.title}"/>
															<p>${i.title}</p>
															<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<img src="/resources/common/img/noimg-gall.png" alt="${i.title}">
												</c:otherwise>
												</c:choose>
											</a>								
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<!-- <li>
										<a href="javascript:void(0);" title="센터뉴스 자세히 보기">
											<img src="/resources/common/img/blank.gif" alt="이미지 없음" title="이미지 없음">
										</a>								
									</li> -->
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<div class="box1-2">
					<div id="result" class="quration-box">
					</div>
				</div>
			</div>
		</div>
		
		<!--main2-->
		<!--
		<div id="main2" class="section">
			<div class="main-box main-box2">
				<div class="box2-1">
					<div class="quick-box2">
						<ul>
							<li class="q2-1">
								<a href="http://www.gbelib.kr/geic/module/training/index.do?menu_idx=197&searchCate1=24" title="정보화 연수신청">
									<span>정보화<br class="pcBr">연수신청</span>
								</a>
							</li>
							<li class="q2-2">
								<a href="http://www.gbelib.kr/geic/module/training/index.do?menu_idx=220&searchCate1=23" title="나이스교무업무 연수신청">
									<span>나이스교무업무<br class="pcBr">연수신청</span>
								</a>
							</li>
							<li class="q2-3">
								<a href="/${homepage.context_path}/module/support/index.do?menu_idx=8" title="학교정보화 지원신청">
									<span>학교정보화<br class="pcBr">지원신청</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="quick-box3">
						<ul>
							<li class="q3-1">
								<a href="/${homepage.context_path}/html.do?menu_idx=286" title="교무업무 동영상메뉴얼">
									<p>교무업무</p>
									<span>동영상메뉴얼</span>
								</a>
							</li>
							<li class="q3-2">
								<a href="/${homepage.context_path}/html.do?menu_idx=294" title="학교 정보화 지원 동영상메뉴얼">
									<p>학교 정보화 지원</p>
									<span>동영상메뉴얼</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="box2-2" id="it-box">
					<div class="itstudy-box">
						<div class="info-box">
							<h4>IT교육센터</h4>
							<ul class="tab purple" id="it-tab">
								<li class="on" keyValue="tab1">
									<span>
										일반강좌
									</span>
								</li>
								<li keyValue="tab2">
									<span>
										자격증강좌
									</span>
								</li>
								<li keyValue="tab3">
									<span>
										추천강좌
									</span>
								</li>
							</ul>
						</div>
						<div id="it-list" class="Itlist list-box">
						</div>
					</div>
				</div>
			</div>
		</div>
		-->
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
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=242"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
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
if ( $(window).width() < 1281 ) {
	if ($('#fullpage').hasClass('fp-destroyed')){
	} else {
		fullpage_api.destroy('all');
	}
} else {
	fullPage();
};

// 리사이즈 될때 모바일 화면에서 fullpage 미사용
$( window ).resize( function(e) {
	if ( $(window).width() < 1281 ) {
		if ($('#fullpage').hasClass('fp-destroyed')){
		} else {
			fullpage_api.destroy('all');
		}
	} else {
		fullPage();
	};
});
</script>