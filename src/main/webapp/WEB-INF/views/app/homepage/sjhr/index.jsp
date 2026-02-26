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
<script type="text/javascript" src="/resources/common/js/jquery.swiper.min.js"></script>

<script type="text/javascript">
$(function() {
	$('.bx-wrapper').css('margin','0 auto');
	$('.bx-controls-auto').css('display','none');

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

	$(window).resize(function() {
		$('.like_book img').width($('.like_book li').width() * 0.5);
		$('.main2 .box').height($('.main2 .box').width());
	}).trigger('resize');
	
	
	
	var resizeFunc = function() {
		$('.lt_photo img').height($('.lt_photo img').width() * 0.9);  
	};
	$(window).resize(resizeFunc);
	
	$('div.day2 > div.box').load('calendar2.do', resizeFunc);
	resizeFunc();
	
	
	$('#calendar-box').load('calendar3.do', function() {
		//$(window).trigger('resize');
		});
	
	$('#main2 div.list .bookListTop').load('bestBook.do?manage_idx=192&count=10');
	
	$('#main2 .main2-wrap .title ul li').on('click', function() {
		var tab = $(this).attr('keyValue');
		if (!$(this).hasClass("on")) {
			if (tab == 'tab1') {
				$('#more-link').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=21&manage_idx=192');
				$('#main2 div.list .bookListTop').load('bestBook.do?manage_idx=192&count=10');
			} else {
				$('#more-link').attr('href', '/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12');
				$('#main2 div.list .bookListTop').load('newBook.do');
			}
			
			$('#main2 .main2-wrap .title ul li').removeClass('on');
			$(this).addClass('on');
		}
	});
});
</script>

<div id="wrap" class="main">
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />

	<div class="popupWrap section">
		<div id="popupLayer">
			<homepageTag:popup popupList="${popupList}" />
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

					<div class="qmenu">
						<ul>
							<li class="qm1">
								<a href="/${homepage.context_path}/html.do?menu_idx=90" title="도서관 이용안내">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/sjhr/img/main/q1.png" data-onsrc="/resources/homepage/sjhr/img/main/q1-on.png" data-outsrc="/resources/homepage/sjhr/img/main/q1.png" alt="도서관 이용안내"></div>
											<div class="qtxt1">도서관 이용안내</div>
											<div class="qtxt2">우리도서관 이용방법에 대해서 자세하게 안내드립니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm2">
								<a href="/${homepage.context_path}/html.do?menu_idx=45" title="평생교육강좌 안내">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/sjhr/img/main/q2.png" data-onsrc="/resources/homepage/sjhr/img/main/q2-on.png" data-outsrc="/resources/homepage/sjhr/img/main/q2.png" alt="평생교육강좌 안내"></div>
											<div class="qtxt1">평생교육강좌 안내</div>
											<div class="qtxt2">다양한 평생교육프로그램을 편리하게 이용하실 수 있도록 안내드립니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm3">
								<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=115" title="대출조회·예약">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/sjhr/img/main/q3.png" data-onsrc="/resources/homepage/sjhr/img/main/q3-on.png" data-outsrc="/resources/homepage/sjhr/img/main/q3.png" alt="대출조회·예약"></div>
											<div class="qtxt1">대출조회·예약</div>
											<div class="qtxt2">이용자 본인의 대출 및 반납내역을 상세하게 확인할 수 있습니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm4">
								<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=16" title="희망도서신청">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/sjhr/img/main/q4.png" data-onsrc="/resources/homepage/sjhr/img/main/q4-on.png" data-outsrc="/resources/homepage/sjhr/img/main/q4.png" alt="희망도서신청"></div>
											<div class="qtxt1">희망도서신청</div>
											<div class="qtxt2">이용하고자 하는 도서가 도서관에 없을 경우, 원하는 도서를 신청할 수 있습니다!</div>
											<div class="qtxt3">더보기 <img src="/resources/common/img/main_type02/quick-arrow.png" alt="" /></div>
										</div>
									</div>
								</a>
							</li>
							<li class="qm5">
								<a href="https://www.gbelib.kr/elib/index.do" title="전자도서관 새창으로 열립니다." target="_blank">
									<div class="outer">
										<div class="inner">
											<div class="image"><img src="/resources/homepage/sjhr/img/main/q5.png" data-onsrc="/resources/homepage/sjhr/img/main/q5-on.png" data-outsrc="/resources/homepage/sjhr/img/main/q5.png" alt="전자도서관"></div>
											<div class="qtxt1">전자도서관</div>
											<div class="qtxt2">전자책, 오디오북 등 다양한 컨텐츠를 편리하게 이용해보세요!</div>
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
			<div class="main1_wrap sections">
				<div class="main1-left-box">
					<div class="notice-box">
						<div class="title">
							<h3>공지사항</h3>
							<a href="/${homepage.context_path}/board/index.do?menu_idx=58&manage_idx=191" title="공지사항 더보기 버튼">
								<img src="/resources/common/img/notice_type02/more-btn.png" alt="공지사항 더보기 이미지" title="공지사항 더보기 이미지">
							</a>
						</div>
						<div class="list">
							<ul>
								<c:forEach var="i" items="${noticeList}">
									<li>
										<a href="/${homepage.context_path}/board/view.do?menu_idx=58&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="공지사항 자세히 보기">
											<div>
												<strong><fmt:formatDate value="${i.add_date}" pattern="MM.dd"/></strong>
												<span><fmt:formatDate value="${i.add_date}" pattern="yyyy"/></span>
											</div>
											<p>${i.title}</p>
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
					</div>
				</div>

				<div class="main1-right-box">
					<div class="popupzonenew">
						<c:choose>
							<c:when test="${fn:length(popupZoneList) > 0}">
								<homepageTag:popupZone popupZoneList="${popupZoneList}" />
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href="javascript:void(0);"><img src="/resources/common/img/notice_type02/popupnone.png" alt="" /></a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		
		<!--일정+도서-->
		<div id="main2" class="section">
			<div class="main2-wrap mid-sections">
				<div class="calendar-box-wrap">
					<div class="title">
						<h3>일정</h3>
						<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=104" title="일정 더보기 버튼">
							<img src="/resources/common/img/culture_type02/more-btn-b.png" alt="일정 더보기 이미지" title="일정 더보기 이미지">
						</a>
					</div>
					<div class="calendar" id="calendar-box">
						
					</div>
				</div>
				<div class="book-box">
					<div class="title">
						<ul><%-- javascript:void(0) 안먹히는 버그 발생--%>
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
							<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12" title="도서 목록 보기" id="more-link">
								<img src="/resources/common/img/culture_type02/more-btn-b.png" alt="도서목록 더보기 이미지" title="도서목록 더보기 이미지">
							</a>
						</div>
					</div>
					<div class="list-box">
						<div class="list">
							<div class="bookListTop">
							
							</div>
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
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=154"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
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

</body>
</html>


<script type="text/javascript">
function fullPage() {
	var myFullpage = new fullpage('#fullpage', {
		anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage'],
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