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
	<nav id="menu"></nav>
	<div id="header">

		<tiles:insertAttribute name="top" />
		<tiles:insertAttribute name="topMenu" />

	</div>
<script type="text/javascript">
$(function() {
   $('.bx-wrapper').css('margin','0 auto');
		//$('.bx-viewport').css("padding","20px 0");
		//$('.bx-controls-auto').css('display','none');

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

	$('#planBox').load('calendar3.do', function() {
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
		<div id="all-popup-wrap" class="all-popup-${homepage.homepage_id}" style="display:none">
			
		</div>
	<!--//통합팝업-->
	</c:if>

	<div id="fullpage">
		<!--메인-->
		<div id="main0" class="section">
			<div class="sections main0">
				<div class="main0-inner-right">
					<div class="main0-inner-right-top">
						<div class="main-txt">
							<p class="txt01">책 읽는 선비, 미래를 꿈꾸는 도서관</p>
							<p class="txt02">경상북도교육청 영주선비도서관에 오신 것을 환영합니다. </p>
						</div>
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
												<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서의 정보를 입력해주세요." style="ime-mode:active;"/>
											</div>
										</div>
										<button id="main-search-btn">통합검색</button>
									</fieldset>
								</form>
							</div>
						</div>
					</div>

					<div class="main0-inner-right-bottom">
						<div class="qmenu">
							<ul>
								<li class="qm1">
									<a href="/${homepage.context_path}/html.do?menu_idx=90" title="이용안내">
										<div class="image"><img src="/resources/homepage/yj/img/main/q1-1.png" alt="이용안내"></div>
										<div class="qtxt">이용안내</div>
									</a>

								</li>
								<li class="qm2">
									<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=115" title="대출조회·예약">
										<div class="image"><img src="/resources/homepage/yj/img/main/q1-2.png" alt="대출조회·예약"></div>
										<div class="qtxt">대출조회·예약</div>
									</a>
								</li>
								<li class="qm3">
									<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=16" title="희망도서신청">
										<div class="image"><img src="/resources/homepage/yj/img/main/q1-3.png" alt="희망도서신청"></div>
										<div class="qtxt">희망도서신청</div>
									</a>
								</li>
								<li class="qm4">
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=176&searchCate1=16,17" title="문화행사신청">
										<div class="image"><img src="/resources/homepage/yj/img/main/q1-4.png" alt="문화행사신청"></div>
										<div class="qtxt">문화행사신청</div>
									</a>
								</li>
								<li class="qm5">
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=151&searchCate1=18" title="평생교육신청">
										<div class="image"><img src="/resources/homepage/yj/img/main/q1-5.png" alt="평생교육신청"></div>
										<div class="qtxt">평생교육신청</div>
									</a>
								</li>
								<!-- <homepageTag:quickMenu quickMenuList="${quickMenuList}"/> -->
							</ul>
						</div>
					</div>
				</div>
				<div class="main0-inner-left">

					<div class="popZone">
						<c:choose>
							<c:when test="${fn:length(popupZoneList) > 0}">
								<homepageTag:popupZone popupZoneList="${popupZoneList}" />
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href="javascript:void(0);"><img src="/resources/common/img/popupnone02.jpg" alt="등록된 팝업이 없습니다." /></a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>				
				<div class="end"></div>
			</div>
		</div>
		
		<!--퀵+공지-->
		<div id="main2" class="section">
			<div class="main2-top">
				<div class="main2-top-wrap">
					<div class="sections">
						<div class="main2-top-left-box">
							<div class="notice-title">
								<h2>공지사항</h2>
								<a href="/${homepage.context_path}/board/index.do?menu_idx=58&manage_idx=333" class="more">더보기 +</a>
							</div>
						</div>
						<div class="main2-top-right-box">
							<div class="news">
								<ul>
									<c:forEach var="i" items="${noticeList}">
										<li>
											<a href="/${homepage.context_path}/board/view.do?menu_idx=58&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em>
											<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
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
						<div class="end"></div>
					</div>
				</div>
			</div>
			<div class="main2-bottom">
				<div class="sections">
					<div class="qmenu">
						<ul>
							<li class="qm1">
								<a href="/${homepage.context_path}/module/quizReq/index.do?menu_idx=207" title="독서퀴즈">
									<div class="image"><img src="/resources/homepage/yj/img/main/q2-1.png" alt="독서퀴즈"></div>
									<div class="qtxt">독서퀴즈</div>
								</a>

							</li>
							<li class="qm2">
								<a href="https://www.gbelib.kr/elib/index.do" title="전자도서관 새창으로 열립니다." target="_blank">
									<div class="image"><img src="/resources/homepage/yj/img/main/q2-2.png" alt="전자도서관"></div>
									<div class="qtxt">전자도서관</div>
								</a>
							</li>
							<li class="qm3">
								<a href="/${homepage.context_path}/html.do?menu_idx=29" title="책바다">
									<div class="image"><img src="/resources/homepage/yj/img/main/q2-3.png" alt="책바다"></div>
									<div class="qtxt">책바다</div>
								</a>
							</li>
							<li class="qm4">
								<a href="/${homepage.context_path}/html.do?menu_idx=194" title="책이음">
									<div class="image"><img src="/resources/homepage/yj/img/main/q2-4.png" alt="책이음"></div>
									<div class="qtxt">책이음</div>
								</a>
							</li>
							<li class="qm5">
								<a href="/${homepage.context_path}/html.do?menu_idx=60" title="자원봉사신청">
									<div class="image"><img src="/resources/homepage/yj/img/main/q2-5.png" alt="자원봉사신청"></div>
									<div class="qtxt">자원봉사신청</div>
								</a>
							</li>
							<li class="qm6">
								<a href="/${homepage.context_path}/board/index.do?menu_idx=74&manage_idx=335" title="자주하는질문">
									<div class="image"><img src="/resources/homepage/yj/img/main/q2-6.png" alt="자주하는질문"></div>
									<div class="qtxt">자주하는질문</div>
								</a>
							</li>

							<!-- <homepageTag:quickMenu quickMenuList="${quickMenuList}" /> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!--주요서비스-->
		<div id="main3" class="section">
			<div class="qservice sections">
				<ul>
					<li class="q1">
						<div>
							<h3>이용안내</h3>
							<p>우리 도서관을 더욱 편리하게<br class="pcBr">이용하실 수 있도록 도와드립니다.</p>
							<ul>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=90" title="이용시간 안내">
										이용시간 안내
									</a>
								</li>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=91" title="회원가입 안내">
										회원가입 안내
									</a>
								</li>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=93" title="도서대출 안내">
										도서대출 안내
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="q2">
						<div>
							<h3>프로그램 신청</h3>
							<p>다양한 프로그램을 통해<br class="pcBr">책과 더욱 가까워져보세요.</p>
							<ul>
								<li>
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=176&searchCate1=16,17" title="문화행사 신청">
										문화행사 신청
									</a>
								</li>
								<li>
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=151&searchCate1=18" title="평생교육 신청">
										평생교육 신청
									</a>
								</li>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=59" title="견학/체험 신청">
										견학/체험 신청
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="q3">
						<div>
							<h3>자료이용 안내</h3>
							<p>다양한 자료 이용방법을<br class="pcBr">안내해 드리겠습니다.</p>
							<ul>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=153" title="자료실 안내">
										자료실 안내
									</a>
								</li>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=227" title="야간대출 신청">
										야간대출 신청
									</a>
								</li>
								<li>
									<a href="/${homepage.context_path}/html.do?menu_idx=228" title="도서택배서비스">
										도서택배서비스
									</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<!--행사+일정-->
		<div id="main4" class="section">
			<div class="main4-visual">
				<div class="main4-bottom">
					<div class="sections">
						<div class="outer">
							<div class="inner">
								<div class="title">
									<h2>CALENDAR</h2>
									<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=182" class="more">MORE <img src="/resources/common/img/culture_type01/notice-view-btn.png" alt="더보기"></a>
								</div>
								<div id="planBox" class="">
				
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="main4-top">
					<div class="sections">
						<div class="outer">
							<div class="inner">
								<div class="title">
									<h2>EVENT</h2>
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=176&searchCate1=16,17" class="more">MORE <img src="/resources/common/img/culture_type01/notice-view-btn.png" alt="더보기"></a>
								</div>
								<script>
									$(function(){
										var _width = $(window).width();
										var _cultures;

										var Cultures = function(){
											try {
												if( _cultures ) _cultures.destroySlider();
											} catch (e) {
												// TODO: handle exception
											}

											if( _width <= 320 ){
												_cultures = $('.cultureList ul').bxSlider({
													auto: true,
													autoHover: true,
													speed: 500,
													pager:false,
													moveSlides:1,
													maxSlides: 1,
													slideWidth: 320,
													slideMargin: 0
												});
											}
											else if( _width <= 550 && _width > 320 ){
												_cultures = $('.cultureList ul').bxSlider({
													auto: true,
													autoHover: true,
													speed: 500,
													pager:false,
													moveSlides:1,
													maxSlides: 1,
													slideWidth: 350,
													slideMargin: 0
												});
											}
											else if( _width <= 1024 && _width > 550 ){
												_cultures = $('.cultureList ul').bxSlider({
													auto: true,
													autoHover: true,
													speed: 500,
													pager:false,
													moveSlides:1,
													maxSlides: 2,
													slideWidth: 350,
													slideMargin: 10
												});
											}
											else if( _width <= 1450 && _width > 1024 ){
												_cultures = $('.cultureList ul').bxSlider({
													auto: true,
													autoHover: true,
													speed: 500,
													pager:false,
													moveSlides:1,
													maxSlides: 3,
													slideWidth: 350,
													slideMargin: 10
												});
											}
											else {
												_cultures = $('.cultureList ul').bxSlider({
													auto: true,
													autoHover: true,
													speed: 500,
													pager:false,
													moveSlides:1,
													maxSlides: 4,
													slideWidth: 350,
													slideMargin: 10
												});
											}
										};
										
										Cultures();
										/*$(window).on('resize', function(e){
											e.preventDefault();
											_width = $(window).width();
											console.log(_width);
											Cultures();
										});*/
									});
								</script>
								<div class="cultureList">
									<ul>
										<c:forEach var="i" items="${teachList}">
										<li>
											<a href="/${homepage.context_path}/module/teach/detail.do?menu_idx=176&searchCate1=${i.large_category_idx}&group_idx=${i.group_idx}&category_idx=${i.category_idx}&teach_idx=${i.teach_idx}&homepage_id=${i.homepage_id}">
												<div class="">
													<h3 class="tit">${i.teach_name}</h3>
													<div class="cont">
														${i.teach_desc }
													</div>
													<div class='date'>
														<p><span class="">강좌기간</span> : ${i.start_date} ~ ${i.end_date }</p>
														<p><span class="">접수기간</span> : ${i.start_join_date} ~ ${i.end_join_date}</p>
													</div>
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
				</div>
			</div>
		</div>
		
		
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
								maxSlides: 1,
								slideWidth: 190,
								slideMargin: 20
							});

							_bookListBottom = $('.bookListBottom ul').bxSlider({
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
						else if( _width <= 1600 && _width > 1024 ){
							_bookListTop = $('.bookListTop ul').bxSlider({
								auto: true,
								autoHover: true,
								speed: 500,
								pager: false,
								moveSlides:1,
								maxSlides: 1,
								slideWidth: 190,
								slideMargin: 10
							});

							_bookListBottom = $('.bookListBottom ul').bxSlider({
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
						else {
							_bookListTop = $('.bookListTop ul').bxSlider({
								auto: true,
								autoHover: true,
								speed: 500,
								pager: false,
								moveSlides:1,
								maxSlides: 3,
								slideWidth: 210,
								slideMargin: 10
							});

							_bookListBottom = $('.bookListBottom ul').bxSlider({
								auto: true,
								autoHover: true,
								speed: 500,
								pager: false,
								moveSlides:1,
								maxSlides: 3,
								slideWidth: 210,
								slideMargin: 10
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
		<!--도서-->
		<div id="main5" class="section">
			<div class="main5-wrap">
				<div class="main5-inner-left">
					<div class="book-box">
						<div class="title">
							<h3>신착도서</h3>
							<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12" title="신착도서 더보기">
								<img src="/resources/common/img/book_type02/book-more-btn-b.png" alt="신착도서 더보기 버튼이미지" title="신착도서 더보기 버튼이미지">
							</a>
						</div>
						<div class="list">
							<div class="bookListTop">
								<ul>
									<c:forEach var="i" items="${newBookList.dsNewBookList}">
										<li>
											<a href="/${homepage.context_path}/intro/search/detail.do?vLoca=${i.LOCA}&vCtrl=${i.CTRLNO}&vImg=${i.COVER_SMALLURL }&menu_idx=12" title="신착도서 자세히 보기">
												<img src="${not empty i.COVER_SMALLURL ? i.COVER_SMALLURL : '/resources/homepage/gm/img/noimg1.png' }" alt="${i.TITLE}" title="${i.TITLE}"/>
												<p class="book-title">${i.TITLE}</p>
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
				<div class="main5-inner-right">
					<div class="book-box">
						<div class="title">
							<h3 class="white">추천도서</h3>
							<a href="/${homepage.context_path}/board/index.do?menu_idx=21&manage_idx=331" title="추천도서 더보기">
								<img src="/resources/common/img/book_type02/book-more-btn-w.png" alt="추천도서 더보기 버튼이미지" title="추천도서 더보기 버튼이미지">
							</a>
						</div>
						<div class="list">
							<div class="bookListBottom">
								<ul>
									<c:forEach items="${bookList}" var="i">
										<li>
											<a href="/${homepage.context_path}/board/view.do?menu_idx=21&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}" title="추천도서 자세히 보기">
												<c:choose>
													<c:when test="${fn:indexOf(i.preview_img, 'http') > -1 }">
														<img src="${i.preview_img}" alt="${i.title}" title="${i.title}"/>
														<p class="book-title white">${i.title}</p>
													</c:when>
													<c:otherwise>
														<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}" title="${i.title}"/>
														<p class="book-title white">${i.title}</p>
													</c:otherwise>
												</c:choose>
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
			</div>
		</div>
		<div class="end"></div>
		
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
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=162"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
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
		anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage', '5thPage', '6thPage'],
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
			}  else if( destination.index == 4 ) {
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