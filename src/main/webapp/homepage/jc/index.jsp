<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertAttribute name="header" />
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
	   	
	   	
	   	$('div.libClosed > div.box').load('calendar2.do', function() {
			$(window).trigger('resize');
		});
	   	
	   	$('#main-search-btn').on('click', function() {
			if( $('input#search_text_1').val() == '' ) {
				alert('검색어를 입력하세요.');
				$('input#search_text_1').focus();
				return false;
			}
				$('#mainSearchForm').submit();
		});
	});
	</script>

	<div class="popupWrap section">
		<div id="popupLayer">
			<homepageTag:popup popupList="${popupList}"/>
		</div>
	</div>
	<div id="container" class="main">
		<div class="main1">
			<div class="section">
				<div class="search">
					<div class="search_secition">				
					<h3>통합자료검색</h3>
					<p class="search_txt">검색어를 입력하시면, 해당 자료를 쉽고 빠르게 찾을 수 있습니다.</p>
						<div class="search-box">
							<form id="mainSearchForm" action="/${homepage.context_path}/intro/search/index.do">
									<input type="hidden" name="menu_idx" value="8">
									<fieldset>
										<legend>통합검색</legend>
										<input name="search_text" id="search_text_1" type="text" class="text" placeholder="검색어를 입력해주세요"/>
										<button id="main-search-btn">통합검색</button>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				<div class="like_book">
					<div class="tit">
						<h3>신착&amp;추천도서</h3>
						<p>연령에 맞게 공감할 수 있는 도서 선정</p>
						<a href="/${homepage.context_path}/board/index.do?menu_idx=149&manage_idx=293" class="more">더보기</a>
					</div>
					<div class="box">
						<div class="box2">
							<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:1120, slides:3}]">
								<c:forEach items="${bookList}" var="i">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=149&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}">
										<c:choose>
											<c:when test="${fn:indexOf(i.preview_img, 'http') > -1 }">
												<img src="${i.preview_img}" alt="${i.title}" style="width:80px;height:105px" />
											</c:when>
											<c:otherwise>
												<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}" style="width:80px;height:105px" />
											</c:otherwise>
										</c:choose>
										<span>${i.title}</span>
									</a>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="main2">
				<ul>
					<li class="mb1">
						<a href="http://dream.nl.go.kr/dream/chaeknarae/index.do" target="_blank" class="box">
							<strong>책나래</strong>
							<i>무료 우편서비스</i>
							<span>도서관 방문이 어려운 이용자들을 위한 도서관 자료 무료 배송</span>
						</a>
					</li>
					<li class="mb2">
						<a href="http://storytelling.nlcy.go.kr/DmhMain/DmhMainRecommendList.do" target="_blank" class="box storytelling">
							<strong>다국어 동화구연</strong>
							<span>다양한 세상을 이어주는 동화</span>
						</a>
					</li>
					<li class="mb3">
						<a href="http://www.nl.go.kr/nill/user/index.jsp" target="_blank" class="box">
							<strong>책바다</strong>
							<i>국가상호대차서비스</i>
							<span>소장 자료를 서로 공유하는<br />전국 도서관 자료 공동 활용</span>
						</a>
					</li>
					<li class="mb4">
						<a href="http://www.nlcy.go.kr/menu/14610/contents/20033/view.do" target="_blank" class="box">
							<strong>청소년을 위한<br/>독서칼럼</strong>
							<span>책을 통해 만나는 인생<br />선배들의 꿈과 희망의 메시지</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="main3">	
				<div class="box">
					<div class="banner">
						<div class="banner-wrap type2">
							<div class="banner-t">
								<h3>배너모음</h3>
								<div class="control">
									<a class="prev" href="#prev"><i class="fa fa-chevron-up"></i><span class="blind">이전</span></a>
									<a class="stop active" href="#stop"><i class="fa fa-pause"></i><span class="blind">정지</span></a>
									<a class="play" href="#play"><i class="fa fa-play"></i><span class="blind">시작</span></a>
									<a class="next" href="#next"><i class="fa fa-chevron-down"></i><span class="blind">다음</span></a>
									<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=163"><i class="fa fa-navicon"></i><span class="blind">더보기</span></a>
								</div>
							</div>
							<div class="banner-box">
								<homepageTag:banner bannerList="${bannerList}"/>
							</div>
						</div>
					</div>
					<div class="main_visual">
						<div class="box">
							<div class="t1">
								<p><b>책으로</b> 여는,<br /><b>행복한</b> <i>내일</i></p>
							</div>
							<div class="t2">
								책으로 소통하고 꿈으로 성장하는 점촌도서관이 함께 합니다.
							</div>
						</div>
						<ul class="main_img">
							<c:forEach var="i" items="${mainImgList}">
								<li><img src="/data/mainImg/${i.homepage_id}/${i.real_file_name}" alt="${i.title }"/></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="main4">
				<div class="popupzone">
					<c:choose>
						<c:when test="${fn:length(popupZoneList) > 0}">
							<homepageTag:popupZone popupZoneList="${popupZoneList}" />
						</c:when>
						<c:otherwise>
							<ul>
								<li><a href="javascript:alert('현재 팝업이 없습니다.')"><img src="/resources/common/img/type12/popupnone.jpg" /></a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="news">
					<div class="box">
						<h3>공지사항</h3>
						<ul>
							<c:forEach var="i" items="${noticeList}">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=58&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em></a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
								</li>
							</c:forEach>
						</ul>
						<a href="/${homepage.context_path}/board/index.do?menu_idx=58&manage_idx=198" class="more">더보기</a>
					</div>
				</div>
				<div class="mb5">
					<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=33" class="box">도서관행사일정</a>
				</div>
			</div>
		</div>
		<div class="qmenu">
			<h3 class="blind">QUICK MENU</h3>
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:340, slides:2},{screen:450, slides:3},{screen:600, slides:4},{screen:767, slides:6},{screen:1000, slides:${fn:length(quickMenuList)}}]">
					<homepageTag:quickMenu quickMenuList="${quickMenuList}"/>
				</ul>
			</div>
		</div>
	</div>

</div>
	
<tiles:insertAttribute name="footer" />