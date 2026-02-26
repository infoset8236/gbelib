<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tiles:insertAttribute name="header" />

<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.fullpage.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.swiper.css"/>
<script type="text/javascript" src="/resources/common/js/jquery.fullpage.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery.swiper.min.js"></script>

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
	   	
		$('#main-search-btn').on('click', function() {
			if( $('input#search_text_1').val() == '' ) {
				alert('찾으시는 도서 정보를 입력하세요.');
				$('input#search_text_1').focus();
				return false;
			}
				$('#mainSearchForm').submit();
		});

		doAjaxLoad('div.main2 div.newBook', 'newBook.do','startDate=2016-12-01');
	
		$('a.more-btn-on').on('click', function(e) {
			e.preventDefault();
			$('.ebook-box').addClass('on');
			$('.widget').addClass('on');
			$('.more-btn-on').hide();
			$('.more-btn-off').show();
		});

		$('a.more-btn-off').on('click', function(e) {
			e.preventDefault();
			$('.ebook-box').removeClass('on');
			$('.widget').removeClass('on');
			$('.more-btn-on').show();
			$('.more-btn-off').hide();
		});
	});
</script>

<div id="wrap">
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />

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

	<div id="all-area">
		<div class="search-box">
			<div class="box1">
				<form id="mainSearchForm" action="/${homepage.context_path}/module/elib/search/index.do">
					<input type="hidden" name="menu_idx" value="2">
					<fieldset>
						<legend class="blind">통합검색</legend>
						<div class="box">
							<div class="b1">
								<label for="search_text_1" class="blind">통합자료검색</label>
								<input type="text" class="text" name="search_text" id="search_text_1" placeholder="책을 찾는 설레임!"/>
							</div>
							<div class="b2">
<!-- 								<button type="submit" id="main-search-btn"></button> -->
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<button id="main-search-btn">
				<img src="/resources/homepage/${homepage.context_path}/img/search-btn.png" alt="돋보기 이미지" title="돋보기 이미지">
			</button>
		</div>
	
		<div class="main-content-box">
			<div class="ebook-box on">
				<div class="img-box">
					<img src="${bestBook.book_image}" alt="지금 이북 책 표지 사진" title="지금 이북 책 표지 사진" onerror="this.src='/resources/homepage/gm/img/noimg1.png'">
				</div>
				<div class="txt-box">
					<c:choose>
						<c:when test="${bestBook.type eq 'EBK'}"><c:set var="menu_idx_popular" value="15"/></c:when>
						<c:when test="${bestBook.type eq 'ADO'}"><c:set var="menu_idx_popular" value="20"/></c:when>
						<c:when test="${bestBook.type eq 'WEB'}"><c:set var="menu_idx_popular" value="28"/></c:when>
					</c:choose>
					<span>지금 E-BOOK !</span>
					<h3>${bestBook.book_name}</h3>
					<img src="/resources/homepage/${homepage.context_path}/img/ebook-line.png" alt="구분선" title="구분선">
					<p>${bestBook.book_info }</p>
					<div class="detail-btn">
						<a href="/${homepage.context_path}/module/elib/book/view.do?menu_idx=${menu_idx_popular}&menu=BEST&type=${bestBook.type}&book_idx=${bestBook.book_idx}" title="E-BOOK 자세히 보기">자세히보기</a>
					</div>
				</div>
				<div class="end"></div>
			</div>
		
			<div class="widget on">
				<div class="popupzone-box">
					<c:choose>
						<c:when test="${fn:length(popupZoneList) > 0}">
							<homepageTag:popupZone popupZoneList="${popupZoneList}" />
						</c:when>
						<c:otherwise>
							<ul>
								<li><a href="javascript:void(0);"><img src="/resources/homepage/${homepage.context_path}/img/popupzone.jpg" title="팝업존 이미지" alt="팝업존 이미지"></a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="notice-box">
					<ul>
						<c:forEach var="i" items="${noticeList}">
							<li>
								<a href="/${homepage.context_path}/board/view.do?menu_idx=31&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="공지사항 자세히 보기">
									${i.title}
								</a>
								<span><fmt:formatDate value="${i.add_date}" pattern="yy.MM.dd"/></span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div class="widget-btn">
			<a href="#more-btn-off" class="more-btn-off">
				<img src="/resources/homepage/${homepage.context_path}/img/arr-off.png" title="위젯 숨기기" alt="위젯 숨기기">
			</a>
			<a href="#more-btn-on" class="more-btn-on">
				<img src="/resources/homepage/${homepage.context_path}/img/arr-on.png" title="위젯 보기" alt="위젯 보기">
			</a>
		</div>

		<div class="end"></div>

		<div class="quick-box">
			<ul>
				<a href="/elib/module/elib/book/index.do?menu_idx=17&amp;menu=CATEGORY&amp;type=EBK&amp;parent_id=849&amp;cate_id=1174" title="경북독서친구 페이지 바로가기" target="_blank">
					<li class="quick01">
							<span>경북독서친구</span>
					</li>
				</a>
				<a href="/elib/module/elib/book/index.do?menu_idx=15&menu=BEST&type=EBK" title="인기전자책 페이지 바로가기">
					<li class="quick02">
							<span>인기전자책</span>
					</li>
				</a>
				<a href="/elib/module/elib/book/index.do?menu_idx=19&menu=NEW&type=ADO" title="신착오디오북 페이지 바로가기">
					<li class="quick03">
							<span>신착오디오북</span>
					</li>
				</a>
				<a href="/elib/module/elib/book/index.do?menu_idx=28&menu=RECOMMEND&type=WEB" title="인기강좌 페이지 바로가기">
					<li class="quick04">
							<span>인기강좌</span>
					</li>
				</a>
				<a href="/elib/module/elib/moazine.do?menu_idx=69" title="전자잡지 페이지 바로가기">
					<li class="quick05">
							<span>전자잡지</span>
					</li>
				</a>
			</ul>
		</div>
	</div>

	<!-- footer_section -->
	<div class="section fp-auto-height footer_area" id="foot_section">
	<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>