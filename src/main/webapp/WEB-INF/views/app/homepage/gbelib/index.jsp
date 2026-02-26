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
<script type="text/javascript" src="/resources/homepage/${homepage.context_path}/js/libinfo.js"></script>

<script type="text/javascript">
	$(function() {
		slideAct();
		$('a#twitter-link').on('click', function(e) {
			e.preventDefault();

			var agent = navigator.userAgent.toLowerCase();
			//alert(agent);

			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
				alert("인터넷익스 플로러를 이용한 트위터 서비스가 종료되어 더이상 사용이 불가능합니다. \n\r익스플로러 엣지, 크롬, 파이어폭스등의 브라우저를 이용 부탁드립니다.");
			}
			else
			{
				window.open("https://twitter.com/gbelibkr");
			}

		});

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
		
		//팝업 키보드로 닫기
		$('.close-btn').on('keydown', function(e) {
			if(e.keyCode==32){
				$('html, body').animate({scrollTop: 0 }, 'fast');  //spacebar 바로 인해 내려간 화면을 다시 올려줌
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

		doAjaxLoad('div.like_book', 'newBook.do','');
		
		$('#holiday-notice-info').load('holiandnotice.do?menu_idx=52&homepage_id=h28&manage_idx=1&count=2');
		
		$('#main1 .map a.lib-btn').on('click', function(){
			var homepage_id = $(this).attr('keyValue2');
			var manage_idx = $(this).attr('keyValue3');
			var menu_idx = $(this).attr('keyValue4');
			var count = 2;
			
			$('#holiday-notice-info').load('holiandnotice.do?menu_idx='+menu_idx+'&homepage_id='+homepage_id+'&manage_idx='+manage_idx+'&count='+count);
		});
		
		
		$('#main1 #mapArea').on('change', function(){
			var homepage_id = $("#main1 #mapArea option:selected").attr('keyValue2');
			var manage_idx = $("#main1 #mapArea option:selected").attr('keyValue3');
			var menu_idx = $("#main1 #mapArea option:selected").attr('keyValue4');
			var count = 2;
			
			$('#holiday-notice-info').load('holiandnotice.do?menu_idx='+menu_idx+'&homepage_id='+homepage_id+'&manage_idx='+manage_idx+'&count='+count);
		});
		
		$('#libInfoArea .lib-info h4 a').on('click', function(){
			var homepage_id = $(this).attr('keyValue2');
			var manage_idx = $(this).attr('keyValue3');
			var menu_idx = $(this).attr('keyValue4');
			var count = 2;
			
			console.log(homepage_id + "/" + manage_idx + "/" + menu_idx);
			
			$('#holiday-notice-info').load('holiandnotice.do?menu_idx='+menu_idx+'&homepage_id='+homepage_id+'&manage_idx='+manage_idx+'&count='+count);
		});
		
		$('#newbookArea').load('newBookTotal.do?homepage_code=00147046');
		
		$('#search-newbook').on('click', function(){
			var homepage_code = $('select#newbook option:selected').val();
			
			$('#newbookArea').load('newBookTotal.do?homepage_code='+homepage_code);
		});
	});

	</script>
<div id="wrap">
<div class="main">
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />

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
		<div id="main0" class="section">
			<div class="main0-scroll">
				<div class="scroll-down">
					<p>Scroll Down</p>
					<div class="scroll_down">
						<span></span>
					</div>
					<div class="scroll_down_line"></div>
				</div>
			</div>
			<div class="main0-wrap">
				<div class="">
					<div class="main_txt">
						<p class="txt-one">도민과 <b>함께 성장</b>하는 <b>책 읽는</b> 경북</p>
						<p class="txt-two">책으로 소통하고 꿈으로 성장하는 통합공공도서관</p>
					</div>

					<div class="button-box">
						<ul>
							<li><a href="#secondPage">지역도서관알리미</a></li>
							<li><a href="https://www.gbelib.kr/elib/index.do" target="_blank" title="전자도서관">전자도서관</a></li>
						</ul>
					</div>

					<div class="quickmenu-box">
						<div class="main-box">
							<div class="qmenus">
								<ul>
									<li class="qm1">
										<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=124&searchCate1=18" class="circle round" title="평생교육강좌">
										<div class="outer">
											<div class="inner">
												<img src="/resources/homepage/${homepage.context_path}/img/section01/q1.png" alt="평생교육강좌" />
												<span>평생교육강좌</span>
											</div>
										</div>
										</a>
									</li>
									<li class="qm2">
										<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=12" class="circle round" title="신간도서">
										<div class="outer">
											<div class="inner">
												<img src="/resources/homepage/${homepage.context_path}/img/section01/q2.png" alt="신간도서" />
												<span>신간도서</span>
											</div>
										</div>
										</a>
									</li>
									<li class="qm3">
										<a href="/${homepage.context_path}/html.do?menu_idx=95" class="circle round" title="모바일앱">
										<div class="outer">
											<div class="inner">
												<img src="/resources/homepage/${homepage.context_path}/img/section01/q3.png" alt="모바일앱" />
												<span>모바일앱</span>
											</div>
										</div>
										</a>
									</li>	
									<li class="qm4">
										<c:choose>
										<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">

										<c:choose>
										<c:when test="${sessionScope.member.loca eq '00147046'}"> <!--정보센터-->
										<c:set var="url" value="/geic/intro/search/hope/index.do?menu_idx=213" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147032'}"> <!--영주선비-->
										<c:set var="url" value="/yj/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147014'}"> <!--금호-->
										<c:set var="url" value="/ycgh/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147020'}"> <!--점촌-->
										<c:set var="url" value="/jc/intro/search/hope/index.do?menu_idx=158" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147019'}"> <!--의성-->
										<c:set var="url" value="/us/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147012'}"> <!--영양-->
										<c:set var="url" value="/yy/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147021'}"> <!--청도-->
										<c:set var="url" value="/cd/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147002'}"> <!--고령-->
										<c:set var="url" value="/gr/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147009'}"> <!--성주-->
										<c:set var="url" value="/sjl/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147023'}"> <!--칠곡-->
										<c:set var="url" value="/cg/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147015'}"> <!--예천-->
										<c:set var="url" value="/yc/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147007'}"> <!--봉화-->
										<c:set var="url" value="/bh/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147017'}"> <!--울릉-->
										<c:set var="url" value="/ul/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147010'}"> <!--안동-->
										<c:set var="url" value="/ad/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147105'}"> <!--문화원-->
										<c:set var="url" value="/gbccs/intro/search/hope/index.do?menu_idx=55" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147011'}"> <!--안동용상-->
										<c:set var="url" value="/adys/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147008'}"> <!--상주-->
										<c:set var="url" value="/sj/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147016'}"> <!--외동-->
										<c:set var="url" value="/od/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147024'}"> <!--영주풍기-->
										<c:set var="url" value="/yjpg/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147004'}"> <!--삼국유사군위-->
										<c:set var="url" value="/gw/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147022'}"> <!--청송-->
										<c:set var="url" value="/cs/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147031'}"> <!--영덕-->
										<c:set var="url" value="/yd/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147003'}"> <!--구미-->
										<c:set var="url" value="/gm/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147018'}"> <!--울진-->
										<c:set var="url" value="/uj/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147006'}"> <!--점촌가은-->
										<c:set var="url" value="/jcge/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147039'}"> <!--안동풍산-->
										<c:set var="url" value="/adps/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147040'}"> <!--상주화령-->
										<c:set var="url" value="/sjhr/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:when test="${sessionScope.member.loca eq '00147013'}"> <!--영일-->
										<c:set var="url" value="/yi/intro/search/hope/index.do?menu_idx=16" />
										</c:when>
										<c:otherwise>
										<c:set var="url" value="/geic/intro/search/hope/index.do?menu_idx=213" />
										</c:otherwise>
										</c:choose>
										<a href="${url}" class="circle round" title="희망도서신청" target="_blank">

										</c:when>
										<c:otherwise>
										<c:set var="url" value="javascript:alert('로그인 후 이용바랍니다.');location.href='/gbelib/intro/login/index.do?menu_idx=137';" />
										<a href="${url}" class="circle round" title="희망도서신청">
										</c:otherwise>
										</c:choose>
										<div class="outer">
											<div class="inner">
												<img src="/resources/homepage/${homepage.context_path}/img/section01/q4.png" alt="희망도서신청" />
												<span>희망도서신청</span>
											</div>
										</div>
										</a>
									</li>
									<li class="qm5">
										<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=115" class="circle round" title="대출조회·예약">
										<div class="outer">
											<div class="inner">
												<img src="/resources/homepage/${homepage.context_path}/img/section01/q5.png" alt="대출조회·예약" />
												<span>대출조회·예약</span>
											</div>
										</div>
										</a>
									</li>
									<li class="qm6">
										<a href="/${homepage.context_path}/html.do?menu_idx=92" class="circle round" title="책이음서비스">
										<div class="outer">
											<div class="inner">
												<img src="/resources/homepage/${homepage.context_path}/img/section01/q6.png" alt="책이음서비스" />
												<span>책이음서비스</span>
											</div>
										</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="line"></div>
					</div>

					<div class="search-box">
						<div class="search-area" id="main_search">
							<form id="mainSearchForm" action="/gbelib/intro/totalSearch/index.do">
							<input type="hidden" name="menu_idx" value="150">
							<input type="hidden" name="booktype" value="TOTAL">
							<fieldset>
								<legend class="blind">통합검색</legend>
								<div class="main-box">
									<div class="box1">
										<div class="box2">
											<label for="search_text_1">통합자료검색</label>
											<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서 정보를 입력하세요." style="ime-mode:active;"/>
										</div>
									</div>
									<button id="main-search-btn">검색하기</button>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
			<div class="main0-empty">
			</div>
		</div>
		
		<div id="main1" class="section">
			<div class="main1-wrap">
				<div class="sections">
					<div class="innerLeft">
						<div class="title"><h3>통합공공도서관 정보를 한눈에!</h3></div>
						<div class="map web-view">
							<span class="mp1"><a href="#mp1on" class="mp1on lib-btn" keyValue='lib01' keyValue2="h28" keyValue3="1" keyValue4="52">경산</a></span>
							<div class="mapBg1 libmap"></div>
							<span class="mp2"><a href="#mp2on" class="mp2on lib-btn" keyValue='lib02' keyValue2="h20" keyValue3="491" keyValue4="58">고령</a></span>
							<div class="mapBg2 libmap"></div>
							<span class="mp3"><a href="#mp3on" class="mp3on lib-btn" keyValue='lib03' keyValue2="h9" keyValue3="96" keyValue4="58">경주</a></span>
							<div class="mapBg3 libmap"></div>
							<span class="mp4"><a href="#mp4on" class="mp4on lib-btn" keyValue='lib04' keyValue2="h19" keyValue3="97" keyValue4="58">청도</a></span>
							<div class="mapBg4 libmap"></div>
							<span class="mp5"><a href="#mp5on" class="mp5on lib-btn" keyValue='lib05' keyValue2="h12" keyValue3="535" keyValue4="58">영천</a></span>
							<div class="mapBg5 libmap"></div>
							<span class="mp6"><a href="#mp6on" class="mp6on lib-btn" keyValue='lib06' keyValue2="h22" keyValue3="340" keyValue4="58">칠곡</a></span>
							<div class="mapBg6 libmap"></div>
							<span class="mp7"><a href="#mp7on" class="mp7on lib-btn" keyValue='lib07' keyValue2="h21" keyValue3="153" keyValue4="58">성주</a></span>
							<div class="mapBg7 libmap"></div>
							<span class="mp9"><a href="#mp9on" class="mp9on lib-btn" keyValue='lib09' keyValue2="h2" keyValue3="132" keyValue4="58">구미</a></span>
							<div class="mapBg9 libmap"></div>
							<!--<span class="mp10"><a href="#mp10on" class="mp10on lib-btn" keyValue='lib10' keyValue2="h14" keyValue3="196" keyValue4="58">군위</a></span>
							<div class="mapBg10 libmap"></div>-->
							<span class="mp11"><a href="#mp11on" class="mp11on lib-btn" keyValue='lib11' keyValue2="h31" keyValue3="541" keyValue4="80">포항</a></span>
							<div class="mapBg11 libmap"></div>
							<span class="mp12"><a href="#mp12on" class="mp12on lib-btn" keyValue='lib12' keyValue2="h6" keyValue3="147" keyValue4="58">상주</a></span>
							<div class="mapBg12 libmap"></div>
							<span class="mp13"><a href="#mp13on" class="mp13on lib-btn" keyValue='lib13' keyValue2="h15" keyValue3="496" keyValue4="58">의성</a></span>
							<div class="mapBg13 libmap"></div>
							<span class="mp14"><a href="#mp14on" class="mp14on lib-btn" keyValue='lib14' keyValue2="h16" keyValue3="226" keyValue4="58">청송</a></span>
							<div class="mapBg14 libmap"></div>
							<span class="mp15"><a href="#mp15on" class="mp15on lib-btn" keyValue='lib15' keyValue2="h18" keyValue3="172" keyValue4="58">영덕</a></span>
							<div class="mapBg15 libmap"></div>
							<span class="mp16"><a href="#mp16on" class="mp16on lib-btn" keyValue='lib16' keyValue2="h3" keyValue3="388" keyValue4="58">안동</a></span>
							<div class="mapBg16 libmap"></div>
							<span class="mp17"><a href="#mp17on" class="mp17on lib-btn" keyValue='lib17' keyValue2="h13" keyValue3="198" keyValue4="58">문경</a></span>
							<div class="mapBg17 libmap"></div>
							<span class="mp18"><a href="#mp18on" class="mp18on lib-btn" keyValue='lib18' keyValue2="h23" keyValue3="305" keyValue4="58">예천</a></span>
							<div class="mapBg18 libmap"></div>
							<span class="mp19"><a href="#mp19on" class="mp19on lib-btn" keyValue='lib19' keyValue2="h17" keyValue3="435" keyValue4="58">영양</a></span>
							<div class="mapBg19 libmap"></div>
							<span class="mp20"><a href="#mp20on" class="mp20on lib-btn" keyValue='lib20' keyValue2="h10" keyValue3="333" keyValue4="58">영주</a></span>
							<div class="mapBg20 libmap"></div>
							<span class="mp21"><a href="#mp21on" class="mp21on lib-btn" keyValue='lib21' keyValue2="h24" keyValue3="476" keyValue4="58">봉화</a></span>
							<div class="mapBg21 libmap"></div>
							<span class="mp22"><a href="#mp22on" class="mp22on lib-btn" keyValue='lib22' keyValue2="h25" keyValue3="342" keyValue4="58">울진</a></span>
							<div class="mapBg22 libmap"></div>
							<span class="mp23"><a href="#mp23on" class="mp23on lib-btn" keyValue='lib23' keyValue2="h26" keyValue3="528" keyValue4="58">울릉</a></span>
							<div class="mapBg23 libmap"></div>
						</div>

						<div class="mobile-view">
							<select id="mapArea" class="mapArea">
								<option value="lib01_h28" style="color:#000;" keyValue="" keyValue2="h28" keyValue3="1" keyValue4="52">경산</option>
								<option value="lib02_h20" style="color:#000;" keyValue="" keyValue2="h20" keyValue3="491" keyValue4="58">고령</option>
								<option value="lib03_h9" style="color:#000;" keyValue=""  keyValue2="h9" keyValue3="96" keyValue4="58">경주</option>
								<option value="lib04_h19" style="color:#000;" keyValue=""  keyValue2="h19" keyValue3="97" keyValue4="58">청도</option>
								<option value="lib05_h12" style="color:#000;" keyValue="" keyValue2="h12" keyValue3="535" keyValue4="58">영천</option>
								<option value="lib06_h22" style="color:#000;" keyValue="" keyValue2="h22" keyValue3="340" keyValue4="58">칠곡</option>
								<option value="lib07_h21" style="color:#000;" keyValue="" keyValue2="h21" keyValue3="153" keyValue4="58">성주</option>
								<option value="lib09_h2" style="color:#000;" keyValue="" keyValue2="h2" keyValue3="132" keyValue4="58">구미</option>
								<!--<option value="lib10_h14" style="color:#000;" keyValue="" keyValue2="h14" keyValue3="196" keyValue4="58">군위</option>-->
								<option value="lib11_h31" style="color:#000;" keyValue="" keyValue2="h31" keyValue3="541" keyValue4="80">포항</option>
								<option value="lib12_h6" style="color:#000;" keyValue="" keyValue2="h6" keyValue3="147" keyValue4="58">상주</option>
								<option value="lib13_h15" style="color:#000;" keyValue="" keyValue2="h15" keyValue3="496" keyValue4="58">의성</option>
								<option value="lib14_h16" style="color:#000;" keyValue="" keyValue2="h16" keyValue3="226" keyValue4="58">청송</option>
								<option value="lib15_h18" style="color:#000;" keyValue="" keyValue2="h18" keyValue3="172" keyValue4="58">영덕</option>
								<option value="lib16_h3" style="color:#000;" keyValue="" keyValue2="h3" keyValue3="388" keyValue4="58">안동</option>
								<option value="lib17_h13" style="color:#000;" keyValue="" keyValue2="h13" keyValue3="198" keyValue4="58">문경</option>
								<option value="lib18_h23" style="color:#000;" keyValue="" keyValue2="h23" keyValue3="305" keyValue4="58">예천</option>
								<option value="lib19_h17" style="color:#000;" keyValue="" keyValue2="h17" keyValue3="435" keyValue4="58">영양</option>
								<option value="lib20_h10" style="color:#000;" keyValue="" keyValue2="h10" keyValue3="333" keyValue4="58">영주</option>
								<option value="lib21_h24" style="color:#000;" keyValue="" keyValue2="h24" keyValue3="476" keyValue4="58">봉화</option>
								<option value="lib22_h25" style="color:#000;" keyValue="" keyValue2="h25" keyValue3="342" keyValue4="58">울진</option>
								<option value="lib23_h26" style="color:#000;" keyValue="" keyValue2="h26" keyValue3="528" keyValue4="58">울릉</option>
							</select>
						</div>
					</div>
					
					
					<div class="innerRight" id="libInfoArea">
						<div class="lib-info info-lib01">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h28" keyValue3="1" keyValue4="52">경상북도교육청 정보센터</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/geic/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/geic/html.do?menu_idx=177" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 경산시 원효로 60 (계양동, 경상북도교육청정보센터)</li>
									<li class="info02">053-810-9999</li>
									<li class="info03">매월 둘째 및 넷째 월요일 / 매월 둘째 및 넷째 월요일, 국가의 임시공휴일 또는 특별한 사유로 관장이 지정하여 공고하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib02" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h20" keyValue3="491" keyValue4="58">경상북도교육청 고령도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/gr/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/gr/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 고령군 대가야읍 연조1길 10 (쾌빈리 433-5)</li>
									<li class="info02">054-955-2510</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 공휴일 / 국가의 임시 공휴일 및 관장이 지정하여 공고하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib03" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h9" keyValue3="96" keyValue4="58">경상북도교육청 외동도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/od/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/od/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 경주시 외동읍 입실로 98 (입실리, 외동도서관) </li>
									<li class="info02">사무실 054-776-6960 / 자료실 054-776-7042</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 특별한 사유로 관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib04" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h19" keyValue3="97" keyValue4="58">경상북도교육청 청도도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/cd/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/cd/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 청도군 청도읍 청화로 124 (고수리, 경상북도교육청 청도도서관)</li>
									<li class="info02">054-370-7600</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 기타, 특별한 사유로 인해 관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib05" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h12" keyValue3="535" keyValue4="58">경상북도교육청 금호도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/ycgh/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/ycgh/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 영천시 금호읍 금호로 173 (교대리 130-2번지)</li>
									<li class="info02">054-335-2124, 338-2124</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 국가의 임시 공휴일 또는 관장이 지정하여 공고하는 날은 임시휴관</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib06" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h22" keyValue3="340" keyValue4="58">경상북도교육청 칠곡도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/cg/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/cg/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 칠곡군 왜관읍 군청3길 13 (석전4리 730-11번지)</li>
									<li class="info02">054-971-1507</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 국가공휴일</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib07" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h21" keyValue3="153" keyValue4="58">경상북도교육청 성주도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/sjl/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/sjl/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 성주군 성주읍 주천로 15-11 (예산리)</li>
									<li class="info02">054-933-2095</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 특별한 사유로 인하여 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib09" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h2" keyValue3="132" keyValue4="58">경상북도교육청 구미도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/gm/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/gm/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 구미시 산책길 41</li>
									<li class="info02">054-450-7000</li>
									<li class="info03">매월 둘째, 넷째 월요일 / 일요일을 제외한 법정공휴일 / 특별한 사유로 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<!--<div class="lib-info info-lib10" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h14" keyValue3="196" keyValue4="58">경상북도교육청 군위도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/gw/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/gw/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 군위군 군위읍 군청로 175 (동부리, 경상북도교육청 삼국유사군위도서관)</li>
									<li class="info02">054-382-3961~4</li>
									<li class="info03">매주 월요일 / 법정 공휴일 / 특별한 사유로 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>-->

						<div class="lib-info info-lib11" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="on line-bg" keyValue2="h31" keyValue3="541" keyValue4="80">경상북도교육청문화원</a>
								<a href="javascript:void(0);" class="info-lib11-tab2" keyValue="lib29" keyValue2="h8" keyValue3="43" keyValue4="58">경상북도교육청 영일도서관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/gbccs/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/gbccs/html.do?menu_idx=44" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 포항시 북구 환호로 50 (양덕동, 경상북도교육청문화원)</li>
									<li class="info02">054-245-7715</li>
									<li class="info03">문화원 이용: 토요일, 일요일, 관공서의 공휴일 / 자료실: 일요일, 관공서의 공휴일</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib12" style="display:none;"><!-- 2개 -->
							<h4>
								<a href="javascript:void(0);" class="on line-bg" keyValue2="h6" keyValue3="147" keyValue4="58">경상북도교육청 상주도서관</a>
								<a href="javascript:void(0);" class="info-lib12-tab2" keyValue="lib26" keyValue2="h7" keyValue3="191" keyValue4="58">상주화령분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/sj/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/sj/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 상주시 상서문1길 127 (남성동, 상주도서관)</li>
									<li class="info02">054-530-6300</li>
									<li class="info03">매월 둘째, 넷째 월요일 / 법정공휴일	일요일을 제외한 법정 공휴일 / 임시휴관일	도서관 사정에 의해 관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib13" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h15" keyValue3="496" keyValue4="58">경상북도교육청 의성도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/us/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/us/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 의성군 의성읍 중리길 44 (중리리)</li>
									<li class="info02">054-834-7911</li>
									<li class="info03">매주 월요일 / 「관공서의 공휴일에 관한 규정」에서 정한 공휴일 / 관장이 기타의 사유로 지정하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib14" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h16" keyValue3="226" keyValue4="58">경상북도교육청 청송도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/cs/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/cs/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 청송군 청송읍 군청로 25 (월막리, 경상북도교육청 청송도서관)</li>
									<li class="info02">행정실 054-872-4905, 자료실 872-4908</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 <관공서의 공휴일에 관한 규정>에서 정한 공휴일 / 특별한 사유로 도서관장이 지정하여 공고한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib15" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h18" keyValue3="172" keyValue4="58">경상북도교육청 영덕도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/yd/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/yd/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 영덕군 영덕읍 군청길 102 (화개리, 경상북도교육청 영덕도서관)</li>
									<li class="info02">054-734-3106</li>
									<li class="info03">매주 월요일 / 관공서 공휴일 (일요일 제외, 단 다른 공휴일과 겹치면 휴관) / 관장이 지정하여 공고하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib16" style="display:none;"><!-- 3개 -->
							<h4>
								<a href="javascript:void(0);" class="on line-bg" keyValue2="h3" keyValue3="388" keyValue4="58">경상북도교육청 안동도서관</a> 
								<a href="javascript:void(0);" class="info-lib16-tab2 line-bg" keyValue="lib24" keyValue2="h4" keyValue3="400" keyValue4="58">용상분관</a> 
								<a href="javascript:void(0);" class="info-lib24-tab3" keyValue="lib25" keyValue2="h5" keyValue3="421" keyValue4="58">풍산분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/ad/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/ad/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 안동시 안기천로 48 (당북동)</li>
									<li class="info02">054-840-8414</li>
									<li class="info03">매월 둘째·넷째 월요일 / 일요일이 국경일 혹은 기타 공휴일과 겹치는 경우에는 휴관 / 기타 사유로 휴관이 불가피한 경우</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib17" style="display:none;"><!-- 2개 -->
							<h4>
								<a href="javascript:void(0);" class="on line-bg" keyValue2="h13" keyValue3="198" keyValue4="58">경상북도교육청 점촌도서관</a>
								<a href="javascript:void(0);" class="info-lib17-tab2" keyValue="lib27" keyValue2="h29" keyValue3="767" keyValue4="36">점촌가은분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/jc/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/jc/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경상북도 문경시 호서로 133 (흥덕동 348-1)</li>
									<li class="info02">054-550-3600</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 특별한 사유로 도서관장이 지정하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib18" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h23" keyValue3="305" keyValue4="58">경상북도교육청 예천도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/yc/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/yc/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 예천군 예천읍 시장로 134 보배빌딩 5층(권병원 옆)</li>
									<li class="info02">자료실 054-654-9666 / 행정실 054-652-6076</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 공휴일 / 특별한 사유로 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib19" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h17" keyValue3="435" keyValue4="58">경상북도교육청 영양도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/yy/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/yy/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 영양군 영양읍 팔수로 538 (서부리)</li>
									<li class="info02">054-683-2829</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 법정 공휴일 / 특별한 사유로 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib20" style="display:none;"><!-- 2개 -->
							<h4>
								<a href="javascript:void(0);" class="on line-bg" keyValue2="h10" keyValue3="333" keyValue4="58">경상북도교육청 영주선비도서관</a>
								<a href="javascript:void(0);" class="info-lib20-tab2" keyValue="lib28" keyValue2="h11" keyValue3="338" keyValue4="58">풍기분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/yj/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/yj/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 영주시 영주로60번길 38 (가흥동)</li>
									<li class="info02">054-630-3800</li>
									<li class="info03">매월 둘째, 넷째 월요일 / 일요일을 제외한 관공서의 공휴일 / 특별한 사유로 도서관장이 지정하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib21" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h24" keyValue3="476" keyValue4="58">경상북도교육청 봉화도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/bh/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/bh/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 봉화군 봉화읍 내성로3길 6 (내성리)</li>
									<li class="info02">054-673-0973,0974</li>
									<li class="info03">매월 마지막 월요일 / 일요일을 제외한 관공서의 공휴일 / 임시휴관일	특별한 사유로 도서관장이 지정하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib22" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h25" keyValue3="342" keyValue4="58">경상북도교육청 울진도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/uj/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/uj/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 울진군 울진읍 월변7길 17 (읍내리, 경상북도교육청 울진도서관)</li>
									<li class="info02">054-783-2371~3 </li>
									<li class="info03">매주 월요일, 일요일을 제외한 「관공서의 공휴일에 관한 규정」에서 정한 공휴일 / 특별한 사유로 도서관장이 지정하여 공고하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib23" style="display:none;">
							<h4><a href="javascript:void(0);" class="on" keyValue2="h26" keyValue3="528" keyValue4="58">경상북도교육청 울릉도서관</a></h4>
							<div class="link">
								<a href="https://www.gbelib.kr/ul/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/ul/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 울릉군 울릉읍 봉래길 128-10 (저동리)</li>
									<li class="info02">054-791-2294</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 법정공휴일 / 자료정리 및 시설보수 등의 사유로 관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib24" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="info-lib24-tab1" keyValue="lib16" keyValue2="h3" keyValue3="388" keyValue4="58">안동도서관</a> / 
								<a href="javascript:void(0);" class="on" keyValue2="h4" keyValue3="400" keyValue4="58">안동도서관 용상분관</a> /
								<a href="javascript:void(0);" class="info-lib24-tab3" keyValue="lib25" keyValue2="h5" keyValue3="421" keyValue4="58">풍산분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/adys/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/adys/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 안동시 경동로 884-8 (용상동)</li>
									<li class="info02">054-821-5491</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 특별한 사유로 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib25" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="info-lib24-tab1" keyValue="lib16" keyValue2="h3" keyValue3="388" keyValue4="58">안동도서관</a> / 
								<a href="javascript:void(0);" class="info-lib16-tab2" keyValue="lib24" keyValue2="h4" keyValue3="400" keyValue4="58">용상분관</a> / 
								<a href="javascript:void(0);" class="on" keyValue2="h5" keyValue3="421" keyValue4="58">안동도서관 풍산분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/adps/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/adps/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 안동시 풍산읍 하리들길 22 (하리리)</li>
									<li class="info02">054-858-7603</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 특별한 사유로 도서관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib26" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="info-lib26-tab1" keyValue="lib12" keyValue2="h6" keyValue3="147" keyValue4="58">상주도서관</a> / 
								<a href="javascript:void(0);" class="on" keyValue2="h7" keyValue3="191" keyValue4="58">경상북도교육청 상주화령분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/sjhr/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/sjhr/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 상주시 화서면 중화로 2193 (달천리, 상주도서관화령분관)</li>
									<li class="info02">054-532-4754</li>
									<li class="info03">매주 월요일 / 법정 공휴일 / 기타 관장이 지정한 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib27" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="info-lib27-tab1 line-bg" keyValue="lib17" keyValue2="h13" keyValue3="198" keyValue4="58">점촌도서관</a>
								<a href="javascript:void(0);" class="on" keyValue2="h29" keyValue3="767" keyValue4="36">경상북도교육청 점촌가은분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/jcge/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/jcge/module/useDateInfo/index.do?menu_idx=113" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경상북도 문경시 가은읍 대야로 2508 (왕능리 292-2)</li>
									<li class="info02">054-572-0309</li>
									<li class="info03">매주 월요일과 일요일을 제외한 법정 공휴일 / 특별한 사유로 도서관장이 지정하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib28" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="info-lib28-tab1" keyValue="lib20" keyValue2="h10" keyValue3="333" keyValue4="58">영주선비도서관</a> /
								<a href="javascript:void(0);" class="on" keyValue2="h11" keyValue3="338" keyValue4="58">경상북도교육청 풍기분관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/yjpg/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/yjpg/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">경북 영주시 풍기읍 남원로 152-12 (성내리)</li>
									<li class="info02">054-637-9811</li>
									<li class="info03">매주 월요일 / 「관공서의 공휴일에 관한 규정」에서 정한 공휴일 / 휴관이 불가피한 경우 관장이 지정하여 공고하는 날</li>
								</ul>
							</div>
						</div>

						<div class="lib-info info-lib29" style="display:none;">
							<h4>
								<a href="javascript:void(0);" class="info-lib29-tab1 line-bg" keyValue="lib11" keyValue2="h31" keyValue3="541" keyValue4="80">경상북도교육청문화원</a>
								<a href="javascript:void(0);" class="on" keyValue2="h8" keyValue3="43" keyValue4="58">경상북도교육청 영일도서관</a>
							</h4>
							<div class="link">
								<a href="https://www.gbelib.kr/yi/index.do" class="homepage-go-2" target="_blank">
									<div class="outer">
										<div class="inner">
											누리집<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
								<a href="/yi/html.do?menu_idx=90" class="homepage-go" target="_blank">
									<div class="outer">
										<div class="inner">
											이용안내<br class="web-view"/>바로가기<br/><img src="/resources/homepage/gbelib/img/section02/map-more-icon.png" alt="더보기"/>
										</div>
									</div>
								</a>
							</div>
							<div class="info">
								<ul>
									<li class="info01">포항시 북구 흥해읍 흥해로 101(약성리 100-2)</li>
									<li class="info02">054-261-0994</li>
									<li class="info03">매주 월요일 / 일요일을 제외한 관공서의 공휴일 / 도서관사정에 의한 임시휴관일</li>
								</ul>
							</div>
						</div>

						<!-- 도서관별 선택하면 CMS에 등록된 휴관일과 최근 공지사항 2개를  id = holiday-notice-info 에 load 해주는 방식으로 감.-->
						<!-- 한가지 이슈는 안동, 상주, 문경, 영주 는 안에 도서관이 1개 이상 존재하여 우측에 탭으로 구성할 예정이므로 스크립트 예외처리가 필요할것 같음. -->
						<!-- 스크립트 다 구성해둘테니 load할수 있도록 자바단 매핑 주소 제작 요청 -->
						<div id="holiday-notice-info" class="holiday-notice-info">
							
						</div>
					</div>
					<div class="end"></div>
				</div>
			</div>
		</div>

		<div id="main2" class="section">
			<div class="main2_wrap">
				<div class="outer">
					<div class="inner">

						<div class="midd-sections">

							<div class="main2-left-box">
								<h2>평생교육강좌</h2>
								<div class="coment">
									통합공공도서관의<br class="web-view"/>
									다양한 프로그램을<br class="web-view"/>
									체험해보세요
								</div>
								<div class="lecture-status-info">
									<p><img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-on.png" alt=""> 접수중 </p>
									<p><img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-off.png" alt=""> 접수대기</p>
									<p><img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-off2.png" alt=""> 신청마감</p>
								</div>
							</div>

							<div class="main2-right-box">
								<div class="slider">
									<div class="inners">

										<div class="swiper-location">
											<div class="swiper-prev">이전</div>
											<div class="swiper-next">다음</div>
											<div class="">
												<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=124&searchCate1=18"><img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-more-btn.png" alt="문화강좌 더보기"></a>
											</div>
										</div>

										<div class="swiper-wrapper">

											<!-- 루프시작 - 16개만 보여줌, 접수상태 처리만 추가 하면 됨-->
											<c:forEach var="i" items="${teachList}">
											<div class="list">
												<h3 class="lecture-libname lib${i.context_path}">${i.homepage_alias}</h3>
												<div class="lecture-title">
													${fn:length(i.teach_name) > 20?fn:substring(i.teach_name, 0, 20):i.teach_name}
												</div>
												<div class="lecture-contents">
													<h4>접수기간</h4>
													<p>${i.start_join_date}~${i.end_join_date}</p>
												</div>
												<div class="lecture-link">
													<ul>
														<li>
															<c:choose>
																<c:when test="${i.teach_status eq '0'}">
																	<img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-on.png" alt="접수중">
																</c:when>
																<c:when test="${i.teach_status eq '6'}">
																	<img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-off.png" alt="접수대기">
																</c:when>
																<c:otherwise>
																	<img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-off2.png" alt="신청마감">
																</c:otherwise>
															</c:choose>
															
														</li>
														<li><a href="/${homepage.context_path}/module/teach/index.do?menu_idx=123#${i.homepage_id}_${i.group_idx}_${i.category_idx}_${i.teach_idx}" alt="${i.teach_name}"><img src="/resources/homepage/${homepage.context_path}/img/section03/lecture-icon-view.png" alt=""></a></li>
													</ul>
												</div>
											</div>
											</c:forEach>
											<!-- 루프끝 -->
											<c:if test="${empty teachList}">
												<li>
													<a href="javascript:void(0)">
														<div>
															등록된 강좌가 없습니다.
														</div>
													</a>
												</li>
											</c:if>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>

		<div id="main3" class="section">
			<div class="main3_wrap">
				<div class='mid-sections'>
					<div class="newbook-box">
						<div class="main3_tit">
							<h2 class="title">신간도서</h2>
							<div class="tit_text">통합공공도서관의 신간도서를 만나보세요 <a href="/gbelib/intro/search/newBook/index.do?menu_idx=12"><img src="/resources/homepage/${homepage.context_path}/img/section04/book-more-btn.png" alt="신간도서 더보기"></a></div>
						</div><!-- 셀렉트박스를 선택하고 보기를 누르면 해당도서관의 신착자료 2개를 아래 newBookUI에 새롭게 load되게 처리. 처음에는 정보센터거 초기로드-->
						<div class="title">
							<p>
								<select id="newbook" class="newBook" name="select" title="새창열림">
									<option value="00147046">경상북도교육청정보센터</option>
									<option value="00147003">경상북도교육청 구미도서관</option>
									<option value="00147010">경상북도교육청 안동도서관</option>
									<option value="00147011">경상북도교육청 안동도서관용상분관</option>
									<option value="00147039">경상북도교육청 안동도서관풍산분관</option>
									<option value="00147008">경상북도교육청 상주도서관</option>
									<option value="00147040">경상북도교육청 상주도서관화령분관</option>
									<option value="00147032">경상북도교육청 영주선비도서관</option>
									<option value="00147024">경상북도교육청 영주선비도서관풍기분관</option>
									<option value="00147105">경상북도교육청문화원</option>
									<option value="00147013">경상북도교육청 영일도서관</option>
									<option value="00147016">경상북도교육청 외동도서관</option>
									<option value="00147014">경상북도교육청 금호도서관</option>
									<option value="00147020">경상북도교육청 점촌도서관</option>
									<option value="00147006">경상북도교육청 점촌도서관가은분관</option>
									<!--<option value="00147004">경상북도교육청 삼국유사군위도서관</option>-->
									<option value="00147019">경상북도교육청 의성도서관</option>
									<option value="00147022">경상북도교육청 청송도서관</option>
									<option value="00147012">경상북도교육청 영양도서관</option>
									<option value="00147031">경상북도교육청 영덕도서관</option>
									<option value="00147021">경상북도교육청 청도도서관</option>
									<option value="00147002">경상북도교육청 고령도서관</option>
									<option value="00147009">경상북도교육청 성주도서관</option>
									<option value="00147023">경상북도교육청 칠곡도서관</option>
									<option value="00147015">경상북도교육청 예천도서관</option>
									<option value="00147007">경상북도교육청 봉화도서관</option>
									<option value="00147018">경상북도교육청 울진도서관</option>
									<option value="00147017">경상북도교육청 울릉도서관</option>
								</select>
								<a href="javascript:void(0);" id="search-newbook" class='btn'>선택</a>
							</p>
						</div>
						<div class="newbook" id="newbookArea">
						</div>
					</div>

					<div class="recommand-box">
						<div class="main3_tit">
							<h2 class="title">추천전자책</h2>
							<p class="tit_text">무슨 책을 읽어야 할지 고민될 땐 큐레이션 하세요 <a href="http://q.gbelib.kr/" target="_blank"><img src="/resources/homepage/${homepage.context_path}/img/section04/book-more-btn.png" alt="신간도서 더보기"></a></p>
						</div>
						<div class="recommandbook">
							<div id="result" class="box">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- footer_section -->
		<div class="section fp-auto-height footer_area" id="foot_section">
			<div class="main3-wrap-bottom">
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
									<a class="stop active" href="#stop"><img src="/resources/homepage/${homepage.context_path}/img/section04/banner-stop-btn.png" alt="정지" /><span class="blind">정지</span></a>
									<a class="play" href="#play"><img src="/resources/homepage/${homepage.context_path}/img/section04/banner-start-btn.png" alt="시작" /><span class="blind">시작</span></a>
									<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=162"><img src="/resources/homepage/${homepage.context_path}/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</div>
</div>
</body>
</html>


<script type="text/javascript" src="/resources/common/js/jquery.swiper.min.js"></script>
<script type="text/javascript">
function fullPage() {
	var myFullpage = new fullpage('#fullpage', {
		anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage', '5thPage'],
		navigation:true,
		showActiveTooltip: true,
		menu: '#menu',
		responsiveWidth: 1300,
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
if ( $(window).width() < 1280 ) {
	if ($('#fullpage').hasClass('fp-destroyed')){
	} else {
		fullpage_api.destroy('all');
	}
} else {
	fullPage();
};

// 리사이즈 될때 모바일 화면에서 fullpage 미사용
$( window ).resize( function(e) {
	if ( $(window).width() < 1280 ) {
		if ($('#fullpage').hasClass('fp-destroyed')){
		} else {
			fullpage_api.destroy('all');
		}
	} else {
		fullPage();
	};
});

function slideAct(){
	var view = 0; //보이는 슬라이드 개수
	var realInx = [] //현재 페이지
	var swiperArr = [] //슬라이드 배열

	//슬라이드 배열 생성
	$(".slider").each(function(index){
		realInx.push(0);
		swiperArr.push(undefined);
	})

	//디바이스 체크
	var winWChk = ''
	$(window).on('load resize', function (e){
		e.preventDefault();
		var winW = window.innerWidth;
		if(winWChk != 'mo' && winW <= 1024){ //모바일 버전으로 전환할 때
			slideList()
			winWChk = 'mo';
		}
		if(winWChk != 'pc' && winW >= 1025){ //PC 버전으로 전환할 때
			slideList()
			winWChk = 'pc';
		}
	}) 

	function slideList(){
		//리스트 초기화
		if ($('.slider .list').parent().hasClass('swiper-slide')){
			$('.slider .swiper-slide-duplicate').remove();
			$('.slider .list').unwrap('swiper-slide');
		}
		
		//보이는 슬라이드 개수 설정
		$(".slider").each(function(index){
			if (window.innerWidth > 1024){ //PC 버전
				view = 8;
			}else{ //mobile 버전
				view = 4;
			}

			//리스트 그룹 생성 (swiper-slide element 추가)
			var num = 0;
			$(this).addClass("slider-" + index);
			$(".slider-" + index).find('.list').each(function(i) {
				$(this).addClass("list"+(Math.floor((i+view)/view)));
				num = Math.floor((i+view)/view)
			}).promise().done(function(){
				for (var i = 1; i < num+1; i++) {
					$(".slider-" + index).find('.list'+i+'').wrapAll('<div class="swiper-slide"></div>');
					$(".slider-" + index).find('.list'+i+'').removeClass('list'+i+'')
				}
			});
		}).promise().done(function(){
			sliderStart()
		});
	}
	
	function sliderStart(){
		$(".slider").each(function(index){
			//슬라이드 초기화
			if(swiperArr[index] != undefined) {
				swiperArr[index].destroy();
				swiperArr[index] == undefined;
			}

			//슬라이드 실행
			swiperArr[index] = new Swiper('.slider-' + index + ' .inners', {
				slidesPerView: 1,
				initialSlide :Math.floor(realInx[index]/view),
				resistanceRatio : 0,
				observer : true,
				observeParents : true,
				loop:true,
				navigation: {
					nextEl: $('.slider-' + index).find('.swiper-next'),
					prevEl: $('.slider-' + index).find('.swiper-prev'),
				},
				on: {
					slideChange: function () {
						realInx[index] = this.realIndex*view
					}
				},
			});

			//슬라이드 배열 값 추가
			if(swiperArr[index] == undefined) {
				swiperArr[index] = swiper;
			}
		}); 
	}
}
</script>
