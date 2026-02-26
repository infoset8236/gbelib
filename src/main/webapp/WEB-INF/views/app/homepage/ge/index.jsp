<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tiles:insertAttribute name="header" />
<script type="text/javascript">
	$(function() {
		// 메인 일정 관련 코드 START
		$('#planBox').load('calendar3.do', function() {
		//$(window).trigger('resize');
		});
		// 메인 일정 관련 코드 END
		
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
		      	$(v).show();
		   	}
		});
	   	// 팝업 관련 코드 END
	   	
	   	$(window).resize(function() {
	   		$('div.news img').width($('#tmpImg2').width());
		   	$('div.news img').height($('#tmpImg2').width() * 0.6);
		   	$('div.photo-list img').width($('#tmpImg').width());
		   	$('div.photo-list img').height($('#tmpImg').width() * 0.7);
	   	});
	   	
	   	// 썸네일 작업
	   	
	   	$('#news1_1Btn').on('click', function(e) {
	   		$('.newsAll').hide();
	   		$('#news1_1').show();
	   		$('#news1_1Btn').addClass('active');
	   		$('#news1_2Btn').removeClass('active');
	   		e.preventDefault(e);
	   	});
	   	
		$('#news1_2Btn').on('click', function(e) {
	   		$('.newsAll').hide();
	   		$('#news1_2').show();
	   		$('#news1_2Btn').addClass('active');
	   		$('#news1_1Btn').removeClass('active');
	   		e.preventDefault(e);
	   	});
		
		$('#news2_1Btn').on('click', function(e) {
	   		$('.news2All').hide();
	   		$('#news2_1').show();
	   		$('#news2_1Btn').addClass('active');
	   		$('#news2_2Btn').removeClass('active');
	   		e.preventDefault(e);
	   	});
	   	
		$('#news2_2Btn').on('click', function(e) {
	   		$('.news2All').hide();
	   		$('#news2_2').show();
	   		$('#news2_2Btn').addClass('active');
	   		$('#news2_1Btn').removeClass('active');
	   		e.preventDefault(e);
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
	<div id="container" class="main">
		<div id="main-spot">
			<div class="section">
				<div class="main-img">
					<ul class="main_img">
						<c:forEach items="${mainImgList}" var="i">
							<li style="background-image:url('/data/mainImg/${i.homepage_id}/${i.real_file_name}');">&nbsp;</li>
						</c:forEach>
					</ul>
				</div>

				<div class="notice">
					<ul>
						<c:forEach items="${h28noitceListAll}" var="i" varStatus="status">
						<li class="t${status.count}">
							<dl>
								<dt>
									<a href="/${i.context_path}/board/view.do?menu_idx=${i.menu_idx}&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}">${i.title}</a>
									<%-- <span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span> --%>
								</dt>
								<dd>
									<c:choose>
										<c:when test="${fn:length(i.content_summary) > 52}">
											${fn:substring(i.content_summary, 0, 52)}...
										</c:when>
										<c:otherwise>
											${i.content_summary}
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
						</li>
						</c:forEach>
					</ul>
					<!-- <a href="" class="more">더보기</a> -->
				</div>
			</div>
		</div>

		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:350, slides:3},{screen:450, slides:4},{screen:767, slides:5},{screen:1000, slides:${fn:length(quickMenuList)}}]">
					<homepageTag:quickMenu quickMenuList="${quickMenuList}"/>
				</ul>
			</div>
			<!--
			<div class="control">
				<a href="">퀵메뉴 보이기</a>
				<a href="" class="active">퀵메뉴 가리기</a>
			</div>
			-->
		</div>

		<div class="main1">
			<div class="tit_bar red">
				<div class="section">
					<ul>
						<li>주요소식</li>
					</ul>
				</div>
			</div>
			<div class="section">
				<div class="news news1">
					<div class="box">
						<h3>일반공지</h3>
						<p><img src="/resources/homepage/ge/img/new3_1.jpg" alt=""/></p>
						<ul>
							<c:forEach items="${h28noticeList2}" var="i" varStatus="status">
							<li>
								<a href="/ge/board/view.do?menu_idx=52&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em></a>
								<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
							</li>
							</c:forEach>
						</ul>
						<a href="/ge/board/index.do?menu_idx=52&manage_idx=1" class="more">더보기</a>
					</div>
				</div>
				<div class="news news2">
					<div class="box">
						<h3>
							<a id="news1_1Btn" href="javascript:void(0);" class="active">일반직공무원연수</a>
							<span class="txt-bar">&nbsp;</span>
							<a id="news1_2Btn" href="javascript:void(0);">현장지원</a>
						</h3>
						<div class="newsAll" id="news1_1">
							<p><img src="/resources/homepage/ge/img/news1.jpg" alt="일반직공무원연수 사진"/></p>
							<ul>
								<c:forEach var="i" items="${news1_1List}">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=20&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em></a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
								</li>
								</c:forEach>
							</ul>
							<a href="/${homepage.context_path}/board/index.do?menu_idx=20&manage_idx=2" class="more">더보기</a>
						</div>
						<div class="newsAll" id="news1_2" style="display: none;">
							<p><img src="/resources/homepage/ge/img/news1_2.jpg" alt="현장지원 사진"/></p>
							<ul>
								<c:forEach var="i" items="${news1_2List}">
								<li>
									<a href="/${homepage.context_path}/board/view.do?menu_idx=111&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em></a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
								</li>
								</c:forEach>
							</ul>
							<a href="/${homepage.context_path}/board/index.do?menu_idx=111&manage_idx=300" class="more">더보기</a>
						</div>
					</div>
				</div>
				<div class="news news3">
					<div class="box">
						<h3>
							<a id="news2_1Btn" href="javascript:void(0);" class="active">독서문화</a>
							<span class="txt-bar">&nbsp;</span>
							<a id="news2_2Btn" href="javascript:void(0);">평생교육</a>
						</h3>
						<div class="news2All" id="news2_1">
							<p><img src="/resources/homepage/ge/img/news2.jpg" alt="독서문화소식 사진"/></p>
							<ul>
								<c:forEach var="i" items="${news2_1List}">
								<li>
									<a href="/geic/board/view.do?menu_idx=33&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em></a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
								</li>
								</c:forEach>
							</ul>
							<a href="/geic/board/index.do?menu_idx=33&manage_idx=31" class="more">더보기</a>
						</div>
						<div class="news2All" id="news2_2" style="display: none;">
							<p><img src="/resources/homepage/ge/img/news2_2.jpg" alt="평생교육소식 사진"/></p>
							<ul>
								<c:forEach var="i" items="${news2_2List}">
								<li>
									<a href="/geic/board/view.do?menu_idx=45&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}"><em>${i.title}</em></a>
									<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
								</li>
								</c:forEach>
							</ul>
							<a href="/geic/board/index.do?menu_idx=45&manage_idx=23" class="more">더보기</a>
						</div>
					</div>
				</div>

				<div class="news-photo">
					<div class="tit">
						<h3>
							<b><span class="t1">사진으로</span><span class="t2">보는센터</span></b>
						</h3>
						<!-- <p>지금, 정보센터의 이모저모 이야기를 여러분께 알려드립니다.</p> -->
					</div>
					<div class="photo-list">
						<ul>
							<c:forEach items="${h28galleryList}" var="i" varStatus="status">
							<li class="pl${status.count}">
								<a href="/${homepage.context_path}/board/view.do?menu_idx=77&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}">
									<span class="thumb">
										<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}"/>
									</span>
									<span class="date"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
									<span class="sbj">${i.title}</span>
									<span class="snipet">
										<c:choose>
										<c:when test="${fn:length(i.content_summary) > 57}">
											${fn:substring(i.content_summary, 0, 57)}...
										</c:when>
										<c:otherwise>
											${i.content_summary}
										</c:otherwise>
									</c:choose>
									</span>
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
					<a href="/ge/board/index.do?menu_idx=77&manage_idx=8" class="more">더보기</a>
				</div>
			</div>
		</div>

		<div class="main2">
			<div class="tit_bar">
				<div class="section">
					<ul>
						<li>Quick Link</li>
						<li>이달의행사</li>
						<li>알림판</li>
					</ul>
				</div>
			</div>
			<div class="section">
				<div class="qlink">
					<h3>QuickLink</h3>
					<div class="box">
						<ul>
							<li class="ql1"><a href="http://gbelib.kr/geic/board/index.do?menu_idx=39&manage_idx=13">금주의영화</a></li>
							<li class="ql2"><a href="/geic/html.do?menu_idx=75" target="_blank">자원봉사신청</a></li>
							<li class="ql3"><a href="http://www.nl.go.kr/nill/user/index.jsp" target="_blank">국가상호대차 책바다</a></li>
							<li class="ql4"><a href="http://dream.nl.go.kr/dream/chaeknarae/index.do" target="_blank">장애인무료우편서비스 책나래</a></li>
						</ul>
					</div>
				</div>
				<div class="calendar">
					<div class="box">
						<div id="planBox">
							
						</div>
					</div>
				</div>
				<div class="popupzone">
					<h3>알림판</h3>
						<div class="box">
						<c:choose>
							<c:when test="${fn:length(popupZoneList) > 0}">
								<homepageTag:popupZone popupZoneList="${popupZoneList}" />
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href=""><img src="/resources/common/img/type12/popupnone.jpg" alt="" /></a></li>
								</ul>
							</c:otherwise>
						</c:choose>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<img id="tmpImg2" src="/resources/homepage/ge/img/news11.jpg" alt="" style="display:none"> <!-- news 기준 이미지 -->
<img id="tmpImg" src="/resources/homepage/ge/img/01.jpg" alt="" style="display:none"> <!-- 사진으로 보는 센터 기준 이미지 -->
<tiles:insertAttribute name="footer" />