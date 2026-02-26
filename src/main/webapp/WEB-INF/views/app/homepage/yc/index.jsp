<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertAttribute name="header" />

<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.fullpage.css"/>
<script type="text/javascript" src="/resources/common/js/jquery.fullpage.js"></script>

<div id="wrap" class="main">
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
	   	
	   	$(window).resize(function() {
	   		var $imgTags = $('div.lt1 img');
	   		$imgTags.width($imgTags.parent().parent().width() * 0.9);
	   	}).trigger('resize');
	   	
	   	
	   	$('div.libClosed > div.box').load('calendar2.do', function() {
			$(window).trigger('resize');
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
	   	
		$('#main3 div.list .bookListTop').load('bestBook.do?manage_idx=306&count=10');
		
		$('#main3 .main3-wrap .title ul li').on('click', function() {
			var tab = $(this).attr('keyValue');
			if (!$(this).hasClass("on")) {
				if (tab == 'tab1') {
					$('#more-link').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=21&manage_idx=306');
					$('#main3 div.list .bookListTop').load('bestBook.do?manage_idx=306&count=10');
				} else {
					$('#more-link').attr('href', '/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12');
					$('#main3 div.list .bookListTop').load('newBook.do');
				}
				
				$('#main3 .main3-wrap .title ul li').removeClass('on');
				$(this).addClass('on');
			}
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
		<div id="main0" class="section" style="z-index:10;">
			<div class="main0-wrap">
				<div class="main0-top">
					<div class="sections main0">
						<div class="main0-inner-left">
							<div class="popZone">
								<c:choose>
									<c:when test="${fn:length(popupZoneList) > 0}">
										<homepageTag:popupZone popupZoneList="${popupZoneList}" />
									</c:when>
									<c:otherwise>
										<ul>
											<li><a href="javascript:void(0);"><img src="/resources/common/img/popupnone01.png" alt="등록된 팝업이 없습니다." /></a></li>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- <div class="main-txt">
								<p class="txt01"><span class="">#꿈</span><span class="">#도서관</span><span class="">#미래</span><span class="">#책</span></p>
								<p class="txt02">꿈은 도서관에서,</p>
								<p class="txt02">미래는 책 속에서</p>
							</div> -->
						</div>
						<!-- <div class="main0-inner-right">
							<div class="popZone">
								<c:choose>
									<c:when test="${fn:length(popupZoneList) > 0}">
										<homepageTag:popupZone popupZoneList="${popupZoneList}" />
									</c:when>
									<c:otherwise>
										<ul>
											<li><a href="javascript:void(0);"><img src="/resources/common/img/popupnone01.png" alt="등록된 팝업이 없습니다." /></a></li>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
						</div> -->
					</div>
					<div class="end"></div>
				</div>
				<div class="main0-bottom">
					<div class="outer">
						<div class="inner">
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
					</div>
				</div>
			</div>
		</div>
		<div class="end"></div>
		
		<!--퀵+공지-->
		<div id="main2" class="section" style="background:none;z-index:9;">			
			<div class="main2-top">
				<div class="sections">
					<div class="title">
						<h3>MAIN <span>SERVICE</span></h3>
						<p>꿈은 도서관에서<br />미래는 책 속에서!</p>
					</div>
					<div class="line"></div>
					<div class="end"></div>
					<div class="qmenu">
						<ul>
							<li class="qm1">
								<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=115">
									<div class="image"><img src="/resources/common/img/quick_type02/q1.png" alt="대출조회·예약"></div>
									<div class="qtxt">대출조회·예약</div>
								</a>
							</li>
							<li class="qm2">
								<a href="/${homepage.context_path}/html.do?menu_idx=90">
									<div class="image"><img src="/resources/common/img/quick_type02/q2.png" alt="이용안내"></div>
									<div class="qtxt">이용안내</div>
								</a>
							</li>
							<li class="qm3">
								<a href="/${homepage.context_path}/board/index.do?menu_idx=74&manage_idx=309">
									<div class="image"><img src="/resources/common/img/quick_type02/q3.png" alt="자주하는질문"></div>
									<div class="qtxt">자주하는질문</div>
								</a>
							</li>
							<li class="qm4">
								<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=16">
									<div class="image"><img src="/resources/common/img/quick_type02/q4.png" alt="희망도서신청"></div>
									<div class="qtxt">희망도서신청</div>
								</a>
							</li>
							<li class="qm5">
								<a href="https://www.gbelib.kr/gbelib/index.do" target="_blank">
									<div class="image"><img src="/resources/common/img/quick_type02/q5.png" alt="통합도서관"></div>
									<div class="qtxt">통합도서관</div>
								</a>
							</li>
							<li class="qm6">
								<a href="http://www.gbelib.kr/elib/index.do" target="_blank">
									<div class="image"><img src="/resources/common/img/quick_type02/q6.png" alt="전자도서관"></div>
									<div class="qtxt">전자도서관</div>
								</a>
							</li>
							<!-- <homepageTag:quickMenu quickMenuList="${quickMenuList}" /> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="main2-bottom">
				<div class="sections">
					<div class="news-box">
						<div class="list">
							<ul>
								<c:forEach var="i" items="${noticeList}">
									<li>
										<a href="/${homepage.context_path}/board/view.do?menu_idx=58&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="공지사항 자세히 보기">
											<p>${i.title}</p>
											<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
										</a>
									</li>
								</c:forEach>
								<c:if test="${empty noticeList}">
									<li>
										<a href="javascript:void(0)">
											<div>
												등록된 공지사항이 없습니다.
											</div>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
						<div class="line"></div>
						<div class="title">
							<a href="/${homepage.context_path}/board/index.do?menu_idx=58&manage_idx=305" title="공지사항 더보기">공지사항</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="end"></div>
		
		<!--일정+행사-->
		<div id="main2" class="section">
			<div class="main2-wrap">
				<div class="calendar-box" id="calendar-box">
					
				</div>

				<div class="event-box">
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
									_cultures = $('.culList ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager:false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 250,
										slideMargin: 0
									});
								}
								else if( _width <= 768 && _width > 320 ){
									_cultures = $('.culList ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager:false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 300,
										slideMargin: 0
									});
								}
								else if( _width <= 1160 && _width > 768 ){
									_cultures = $('.culList ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager:false,
										moveSlides:1,
										maxSlides: 2,
										slideWidth: 300,
										slideMargin: 20
									});
								}
								else if( _width <= 1450 && _width > 1160 ){
									_cultures = $('.culList ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager:false,
										moveSlides:1,
										maxSlides: 3,
										slideWidth: 350,
										slideMargin: 20
									});
								}
								else {
									_cultures = $('.culList ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager:false,
										moveSlides:1,
										maxSlides: 3,
										slideWidth: 400,
										slideMargin: 70
									});
								}
							};
							
							Cultures();
							/*
							$(window).on('resize', function(e){
								e.preventDefault();
								_width = $(window).width();
								console.log(_width);
								Cultures();
							});
							*/
						});
					</script>
					<div class="culList">
						<ul>
							<c:forEach var="i" items="${teachList}">
								<li>
									<a href="/${homepage.context_path}/module/teach/detail.do?menu_idx=153&searchCate1=${i.large_category_idx}&group_idx=${i.group_idx}&category_idx=${i.category_idx}&teach_idx=${i.teach_idx}&homepage_id=${i.homepage_id}">
										<div>
											<h3>${i.teach_name}</h3>
											<img src="/data/teach/${homepage.homepage_id}/img/${i.image_real_file_name}" alt="${i.teach_name} 강좌 이미지" onError="this.src='/resources/homepage/yc/img/culture-noimg.png'">
											<!-- <span>${i.teach_desc}</span><br class="pcBr"/><br /> -->
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

					<div class="more">
						<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=153&searchCate1=16,17" title="행사리스트 더보기 버튼">
							행사리스트 더보기 +
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="end"></div>
		
		<!--도서-->
		<div id="main3" class="section">
			<div class="main3-wrap sections">				
				<div class="title">
					<ul>
						<li class="on" keyValue="tab1">
							<a href="javascript:void(0);" title="추천도서 보기" >
								추천도서
							</a>
						</li>
						<li keyValue="tab2">
							<a href="javascript:void(0);" title="신착도서 보기">
								신착도서
							</a>
						</li>
					</ul>
					<div class="more-btn">
						<a href="/${homepage.context_path}/board/index.do?menu_idx=21&manage_idx=306" title="도서 목록 보기" id="more-link">
							MORE <span>+</span>
						</a>
					</div>
				</div>

				<div class="list">
					<div class="bookListTop">
					
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
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=159"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
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