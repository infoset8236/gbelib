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
		
		$('#tab1').on('click', function () {
			$('#like_book2_1').show();
			$('#like_book2_2').hide();
		});

		$('#tab2').on('click', function () {
			$('#like_book2_1').hide();
			$('#like_book2_2').show();
		});

		$('#calendar-box').load('calendar3.do', function() {
			//$(window).trigger('resize');
			});
		
		$('#main3 div.list .bookListTop').load('newBook.do');
		
		$('#main3 .main3-wrap .title ul li').on('click', function() {
			var tab = $(this).attr('keyValue');
			if (!$(this).hasClass("on")) {
				if (tab == 'tab1') {
					$('#more-link').attr('href', '/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12');
					$('#main3 div.list .bookListTop').load('newBook.do');
				} else {
					$('#more-link').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=21&manage_idx=341');
					$('#main3 div.list .bookListTop').load('bestBook.do?manage_idx=341&count=10');
				}
				
				$('#main3 .main3-wrap .title ul li').removeClass('on');
				$(this).addClass('on');
			}
		});
	});
	</script>

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
				<div class="main0-inner-right">
					<div class="main0-inner-right-top">
						<div class="main-txt">
							<p class="txt01">읽는 <b>행복</b>, 배우는 <b>기쁨</b>, 함께하는</p>
							<p class="txt02">경상북도교육청 칠곡도서관에 오신 것을 환영합니다. </p>
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
									<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=115" title="대출조회">
											<div class="image"><img src="/resources/common/img/main_type07/q1.png" alt="대출조회"></div>
											<div class="qtxt">대출조회</div>
										</a>

									</li>
									<li class="qm2">
									<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=16" title="희망도서신청">
											<div class="image"><img src="/resources/common/img/main_type07/q2.png" alt="희망도서신청"></div>
											<div class="qtxt">희망도서신청</div>
										</a>
									</li>
									<li class="qm3">
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=166&searchCate1=16,17" title="문화행사신청">
											<div class="image"><img src="/resources/common/img/main_type07/q3.png" alt="문화행사신청"></div>
											<div class="qtxt">문화행사신청</div>
										</a>
									</li>
									<li class="qm4">
									<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=150&searchCate1=18" title="평생교육강좌신청">
											<div class="image"><img src="/resources/common/img/main_type07/q4.png" alt="평생교육강좌신청"></div>
											<div class="qtxt">평생교육강좌신청</div>
										</a>
									</li>
									<li class="qm5">
									<a href="https://www.gbelib.kr/elib/index.do" title="전자도서관 새창으로 열립니다." target="_blank">
											<div class="image"><img src="/resources/common/img/main_type07/q5.png" alt="전자도서관"></div>
											<div class="qtxt">전자도서관</div>
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
		<div class="end"></div>
		
		<!--퀵+공지-->
		<div id="main2" class="section" style="background:none;height:100%;">
			<div class="main2-top">
				<div class="sections">
					<div class="qmenu">
						<ul>
							<li class="qm1">
									<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=104" title="이달의행사">
									<div class="image"><img src="/resources/homepage/cg/img/main/q1.png" alt="이달의행사 "></div>
									<div class="qtxt">이달의행사</div>
								</a>

							</li>
							<li class="qm2">
									<a href="/${homepage.context_path}/module/quizReq/index.do?menu_idx=41" title="독서퀴즈">
									<div class="image"><img src="/resources/homepage/cg/img/main/q2.png" alt="독서퀴즈"></div>
									<div class="qtxt">독서퀴즈</div>
								</a>
							</li>
							<li class="qm3">
									<a href="/${homepage.context_path}/html.do?menu_idx=29" title="책바다">
									<div class="image"><img src="/resources/homepage/cg/img/main/q3.png" alt="책바다"></div>
									<div class="qtxt">책바다</div>
								</a>
							</li>
							<li class="qm4">
									<a href="/${homepage.context_path}/html.do?menu_idx=179" title="책이음">
									<div class="image"><img src="/resources/homepage/cg/img/main/q4.png" alt="책이음"></div>
									<div class="qtxt">책이음</div>
								</a>
							</li>
							<li class="qm5">
									<a href="/${homepage.context_path}/html.do?menu_idx=60" title="자원봉사신청">
									<div class="image"><img src="/resources/homepage/cg/img/main/q5.png" alt="자원봉사신청"></div>
									<div class="qtxt">자원봉사신청</div>
								</a>
							</li>
							<li class="qm6">
									<a href="/${homepage.context_path}/html.do?menu_idx=90" title="이용안내">
									<div class="image"><img src="/resources/homepage/cg/img/main/q6.png" alt="이용안내"></div>
									<div class="qtxt">이용안내</div>
								</a>
							</li>

							<!-- <homepageTag:quickMenu quickMenuList="${quickMenuList}" /> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="main2-bottom">
				<div class="main2-top-wrap">
					<div class="sections">
						<div class="main2-top-left-box">
							<div class="notice-title">
								<h2>공지사항</h2>
								<a href="/${homepage.context_path}/board/index.do?menu_idx=58&manage_idx=340" class="more">더보기 +</a>
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
		</div>
		<div class="end"></div>
		
		<!--일정+행사-->
		<div id="main2" class="section">
			<div class="main2-wrap mid-sections">
				<div class="calendar-box">
					<div class="title">
						<h3>CALENDAR</h3>
						<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=104" title="일정 더보기 버튼">
							<img src="/resources/common/img/culture_type02/more-btn-b.png" alt="일정 더보기 이미지" title="일정 더보기 이미지">
						</a>
					</div>
					<div class="calendar-box" id="calendar-box">
					</div>
				</div>
				<div class="event-box">
					<div class="title">
						<h3>EVENT</h3>
						<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=166&searchCate1=16,17" title="행사 더보기 버튼">
							<img src="/resources/common/img/culture_type02/more-btn-b.png" alt="행사 더보기 이미지" title="행사 더보기 이미지">
						</a>
					</div>
					<div class="list">
						<ul>
							<c:forEach var="i" items="${teachList}">
								<li>
									<a href="/${homepage.context_path}/module/teach/detail.do?menu_idx=166&searchCate1=${i.large_category_idx}&group_idx=${i.group_idx}&category_idx=${i.category_idx}&teach_idx=${i.teach_idx}&homepage_id=${i.homepage_id}">
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
		<div class="end"></div>
		
		<!--도서-->
		<div id="main3" class="section">
			<div class="main3-wrap sections">				
				<div class="title">
					<ul>
						<li class="on" keyValue="tab1">
							<a href="javascript:void(0);" title="신착도서 보기">
								신착도서
							</a>
						</li>
						<li keyValue="tab2">
							<a href="javascript:void(0);" title="추천도서 보기" >
								추천도서
							</a>
						</li>
					</ul>
					<div class="more-btn">
						<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12" title="도서 목록 보기" id="more-link">
							<img src="/resources/common/img/book_type03/book-more-btn-b.png" alt="도서목록 더보기 이미지" title="도서목록 더보기 이미지">
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
		<div class="end"></div>

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
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=158"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
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