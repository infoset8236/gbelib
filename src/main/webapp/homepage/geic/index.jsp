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
							+ todayDate.toGMTString() + ";";
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

			$('#main-search-btn').on('click', function() {
				if ($('input#search_text_1').val() == '') {
					alert('검색어를 입력하세요.');
					$('input#search_text_1').focus();
					return false;
				}
				$('#mainSearchForm').submit();
			});

			$('div.mb4').load('calendar2.do');

		});
	</script>

	<div class="popupWrap section">
		<div id="popupLayer">
			<homepageTag:popup popupList="${popupList}" />
		</div>
	</div>

	<div id="fullpage">
		<!--main0-->
		<div id="main0" class="section">
			<div class="main-box">
				<div class="box0-1">
					<div class="popupzone">
						<div class="txt">
							<h3>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</h3>
							<p>9. 1. ~ 10. 1.</p>
							<a href="" title="">
								자세히보기
							</a>
						</div>
						<a href="" title="" class="prev">
							<img src="/resources/homepage/geic/img/popupzone-prev-btn.png" title="이전 화살표">
						</a>
						<a href="" title="" class="next">
							<img src="/resources/homepage/geic/img/popupzone-next-btn.png" title="다음 화살표">
						</a>
					</div>
					<div class="search-quick">
						<div class="search-box">
							<div class="box1">
								<div class="box2">
									<label for="search_text_1">통합자료검색</label>
									<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서의 정보를 입력해주세요" style="ime-mode:active;"/>
								</div>
							</div>
							<button id="main-search-btn"><img src="/resources/homepage/geic/img/search-btn.png" alt="돋보기 이미지" title="돋보기 이미지"></button>
						</div>
						<div class="quick-box1">
							<ul>
								<li class="q1-1">
									<a href="" title="">
										교육행정포털
									</a>
								</li>
								<li class="q1-2">
									<a href="" title="">
										정보화연수
									</a>
								</li>
								<li class="q1-3">
									<a href="" title="">
										나이스교무연수
									</a>
								</li>
								<li class="q1-4">
									<a href="" title="">
										평생교육신청
									</a>
								</li>
								<li class="q1-5">
									<a href="" title="">
										자료검색
									</a>
								</li>
								<li class="q1-6">
									<a href="" title="">
										대출조회예약
									</a>
								</li>
								<li class="q1-7">
									<a href="" title="">
										희망도서신청
									</a>
								</li>
								<li class="q1-8">
									<a href="" title="">
										도서관이용안내
									</a>
								</li>
								<li class="q1-9">
									<a href="" title="">
										전자도서관
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="box0-2">
					<div class="calendar-box">
						<div class="cal-today">
							<p class="cal-n1">2022</p>
							<span class="cal-date">08</span>
							<ul class="arr-box">
								<li>
									<a href="" title="이전 달 보기">
										<img src="/resources/homepage/geic/img/calendar-perv-btn.png" alt="이전 달 화살표" title="이전 달 화살표">
									</a>
								</li>
								<li>
									<a href="" title="다음 달 보기">
										<img src="/resources/homepage/geic/img/calendar-next-btn.png" alt="다음 달 화살표" title="다음 달 화살표">
									</a>
								</li>
							</ul>
							<div class="cal-more-btn">
								<a href="" title="달력 더보기">
									더보기 +
								</a>
							</div>
							<div class="calendar-info">
								<span class="hu">휴관</span>
								<span class="ev">행사</span>
							</div>
						</div>
						<div class="cal-cal">
							<table class="cal-tbl">
								<caption>이달의 일정을 확인할수 있는 표</caption>
								<thead>
									<tr>
										<th class="sun">일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th class="sat">토</th>
									</tr>
								</thead>
								<tbody>											
										<tr>
											<td class="sun">
												<div>
												</div>
											</td>
											<td>
												<div>
												</div>
											</td>
											<td>
												<div>
												</div>
											</td>
											<td>
												<div>
												</div>
											</td>
											<td>
												<div>
												</div>
											</td>
											<td>
												<div>
												</div>
											</td>
											<td class="sat">
												<div>
													<span class="ev showCal" keyvalue="1">1</span>
												</div>
											</td>
										</tr>											
										<tr>
											<td class="sun">
												<div>
													<span class="ev showCal" keyvalue="2">2</span>
												</div>
											</td>
											<td>
												<div>
													<span class="hu showCal" keyvalue="3">3</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="4">4</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="5">5</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="6">6</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="7">7</span>
												</div>
											</td>
											<td class="sat">
												<div>
													<span class="ev showCal" keyvalue="8">8</span>
												</div>
											</td>
										</tr>											
										<tr>
											<td class="sun">
												<div>
													<span class="hu showCal" keyvalue="9">9</span>
												</div>
											</td>
											<td>
												<div>
													<span class="hu showCal" keyvalue="10">10</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="11">11</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="12">12</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="13">13</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="14">14</span>
												</div>
											</td>
											<td class="sat">
												<div>
													<span class="ev showCal" keyvalue="15">15</span>
												</div>
											</td>
										</tr>											
										<tr>
											<td class="sun">
												<div>
													<span class="ev showCal" keyvalue="16">16</span>
												</div>
											</td>
											<td>
												<div>
														17
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="18">18</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="19">19</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="20">20</span>
												</div>
											</td>
											<td>
												<div>
														<span class="ev showCal" keyvalue="21">21</span>
												</div>
											</td>
											<td class="sat">
												<div>
													<span class="ev showCal" keyvalue="22">22</span>
												</div>
											</td>
										</tr>											
										<tr>
											<td class="sun">
												<div>
													<span class="ev showCal" keyvalue="23">23</span>
												</div>
											</td>
											<td>
												<div>															
													24
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="25">25</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="26">26</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="27">27</span>
												</div>
											</td>
											<td>
												<div>
													<span class="ev showCal" keyvalue="28">28</span>
												</div>
											</td>
											<td class="sat">
												<div>
													<span class="ev showCal" keyvalue="29">29</span>
												</div>
											</td>
										</tr>											
										<tr>
											<td class="sun">
												<div>
													<span class="ev showCal" keyvalue="30">30</span>
												</div>
											</td>
											<td>
												<div>															
													31
												</div>
											</td>
											<td>
												<div>															
												</div>
											</td>
											<td>
												<div>															
												</div>
											</td>
											<td>
												<div>															
												</div>
											</td>
											<td>
												<div>															
												</div>
											</td>
											<td class="sat">
												<div>
												</div>
											</td>
										</tr>											
								</tbody>
							</table>
						</div>
					</div>
					<div class="book-box">
						<ul class="tab green">
							<li class="on">
								<span>
									신착도서
									<a href="" title="">
										<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
									</a>
								</span>
							</li>
							<li>
								<span>
									추천도서
								</span>
							</li>
						</ul>
						<ul class="book-list">
							<li>								
								<a href="" title="">
									<img src="/resources/homepage/geic/img/book.jpg" alt="책 이미지" title="책 이미지">
									<p>제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
								</a>
							</li>
							<li>								
								<a href="" title="">
									<img src="/resources/homepage/geic/img/book.jpg" alt="책 이미지" title="책 이미지">
									<p>제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
								</a>
							</li>
							<li>								
								<a href="" title="">
									<img src="/resources/homepage/geic/img/book.jpg" alt="책 이미지" title="책 이미지">
									<p>제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
								</a>
							</li>
							<li>								
								<a href="" title="">
									<img src="/resources/homepage/geic/img/book.jpg" alt="책 이미지" title="책 이미지">
									<p>제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!--main1-->
		<div id="main1" class="section">
			<div class="main-box">
				<div class="box1-1">
					<div class="board-box">
						<ul class="tab green">
							<li class="on">
								<span>
									공지사항
									<a href="" title="">
										<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
									</a>
								</span>
							</li>
							<li>
								<span>
									센터뉴스
								</span>
							</li>
							<li>
								<span>
									유실물안내
								</span>
							</li>
						</ul>
						<ul class="board-list">
							<li>
								<a href="" title="">
									제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
								</a>
								<span>2022-05-10</span>
							</li>
							<li>
								<a href="" title="">
									제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
								</a>
								<span>2022-05-10</span>
							</li>
							<li>
								<a href="" title="">
									제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
								</a>
								<span>2022-05-10</span>
							</li>
							<li>
								<a href="" title="">
									제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
								</a>
								<span>2022-05-10</span>
							</li>
							<li>
								<a href="" title="">
									제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
								</a>
								<span>2022-05-10</span>
							</li>
						</ul>
					</div>
					<div class="gallery-box">
						<h4>
							사진으로 보는 센터
							<a href="" title="">
								<img src="/resources/homepage/geic/img/more-view-btn-b.png" alt="더보기 이미지" title="더보기 이미지">
							</a>
						</h4>
						<ul class="gallery-list2">
							<li>
								<a href="" title="">
									<img src="/resources/homepage/geic/img/gallery.jpg" alt="" title="">
								</a>								
							</li>
							<li>
								<a href="" title="">
									<img src="/resources/homepage/geic/img/gallery.jpg" alt="" title="">
								</a>								
							</li>
						</ul>
					</div>
				</div>
				<div class="box1-2">
					<div class="quration-box">
						<div class="info-box">
							<h4>
								L-큐레이션
								<a href="" title="">
									<img src="/resources/homepage/geic/img/more-view-btn-b.png" alt="" title="">
								</a>								
							</h4>
							<p>
								경상북도교육청정보센터의<br />행사&지식정보를<br />확인하실 수 있습니다.
							</p>
							<ul>
								<li>
									<a href="" title="">
										<img src="/resources/homepage/geic/img/quration-prev-btn.png" alt="" title="">
									</a>								
								</li>
								<li>
									<a href="" title="">
										<img src="/resources/homepage/geic/img/quration-next-btn.png" alt="" title="">
									</a>								
								</li>
							</ul>
						</div>
						<div class="list-box">
							<ul>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/quration.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
										<span>2022-05-02</span>
									</a>
								</li>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/quration.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
										<span>2022-05-02</span>
									</a>
								</li>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/quration.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
										<span>2022-05-02</span>
									</a>
								</li>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/quration.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
										<span>2022-05-02</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--main2-->
		<div id="main2" class="section">
			<div class="main-box main-box2">
				<div class="box2-1">
					<div class="quick-box2">
						<ul>
							<li class="q2-1">
								<a href="" title="">
									<span>정보화<br class="pcBr">연수신청</span>
								</a>
							</li>
							<li class="q2-2">
								<a href="" title="">
									<span>나이스교무업무<br class="pcBr">연수신청</span>
								</a>
							</li>
							<li class="q2-3">
								<a href="" title="">
									<span>학교정보화<br class="pcBr">지원신청</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="quick-box3">
						<ul>
							<li class="q3-1">
								<a href="" title="">
									<p>교무업무</p>
									<span>동영상메뉴얼</span>
								</a>
							</li>
							<li class="q3-2">
								<a href="" title="">
									<p>학교 정보화 지원</p>
									<span>동영상메뉴얼</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="box2-2">
					<div class="itstudy-box">
						<div class="info-box">
							<h4>IT교육센터</h4>
							<ul class="tab purple">
								<li class="on">
									<span>
										일반강좌
										<a href="" title="">
											<img src="/resources/homepage/geic/img/more-view-btn-w.png" alt="더보기 이미지" title="더보기 이미지">
										</a>
									</span>
								</li>
								<li>
									<span>
										자격증강좌
									</span>
								</li>
								<li>
									<span>
										추천강좌
									</span>
								</li>
							</ul>
						</div>
						<div class="list-box">
							<ul>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/it.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
									</a>
								</li>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/it.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
									</a>
								</li>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/it.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
									</a>
								</li>
								<li>
									<a href="" title="">									
										<img src="/resources/homepage/geic/img/it.jpg" alt="" title="">
										<p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- footer_section -->
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
