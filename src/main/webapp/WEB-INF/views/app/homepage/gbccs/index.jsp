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

			$('#calendar-box').load('calendar3.do', function() {
				//$(window).trigger('resize');
				});
			
			
			$('#board-box .notice-box .title ul li').on('click', function(){
				var tab = $(this).attr('keyValue');
				if (!$(this).hasClass("on")) {
					if (tab == 'tab1') { // 공지사항
						$('#board-more-btn a').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=222&manage_idx=541');
						$('#invitation-list').hide();
						$('#show-list').hide();
						$('#notice-list').show();
						$('#news-list').hide();
					} else if (tab == 'tab2') { // 보도자료
						$('#board-more-btn a').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=224&manage_idx=580');
						$('#invitation-list').hide();
						$('#show-list').hide();
						$('#notice-list').hide();
						$('#news-list').show();
					} else if (tab == 'tab3') { // 초청전시
						$('#board-more-btn a').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=167&manage_idx=580');
						$('#invitation-list').show();
						$('#show-list').hide();
						$('#notice-list').hide();
						$('#news-list').hide();
					} else if (tab == 'tab4') {	// 공연자료실
						$('#board-more-btn a').attr('href', '/${homepage.context_path}/board/index.do?menu_idx=172&manage_idx=580');
						$('#invitation-list').hide();
						$('#show-list').show();
						$('#notice-list').hide();
						$('#news-list').hide();
					}
				}
				
				$('#board-box .notice-box .title ul li').removeClass('on');
				$(this).addClass('on');
			});

			$('.video-box').on('click', function(e){
			    e.preventDefault();			    
			    $('.main_hongBo2').css('display','block');
			    $('.main_hongBo2').css('z-index','2');
			    $('.main_hongBo2')[0].contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
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
			<div class="main0-scroll">
				<div class="scroll-down">
					<p>Scroll Down</p>
					<div class="scroll_down">
						<span></span>
					</div>
					<div class="scroll_down_line"></div>
				</div>
			</div>

			<div class="mid-sections main0">
				<div class="main0-top">
					<div class="search-box">
						<div class="main-box">
							<form id="mainSearchForm" action="/${homepage.context_path}/intro/search/index.do">
								<input type="hidden" name="menu_idx" value="52">
								<input type="hidden" name="search_type2" value="L_TITLEAUTHOR">
								<fieldset>
									<legend class="blind">통합검색</legend>
									<div class="box1">
										<div class="box2">
											<label for="search_text_1">소장자료검색</label>
											<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서 정보를 입력하세요." style="ime-mode:active;"/>
										</div>
									</div>
									<button id="main-search-btn">통합검색</button>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				
				<div class="main0-middle">
					<div class="title">
						<p><b>꿈</b>과 <b>미래</b>를 위한 <b>만남</b></p>
						<span>경상북도교육청문화원이 여러분의 꿈과 희망을 펼쳐갑니다</span>
					</div>

					<div class="info-box">
						<ul>
							<c:choose>
								<c:when test="${not empty notificationZone1}">
									<li>
										<a href="${notificationZone1.link_url}" ${notificationZone1.link_target eq 'BLANK' ? 'target="_blank"' : '' }>
											<span>${notificationZone1.notification_zone_code_name}</span>
											<h3>${notificationZone1.title}</h3>
											<p>${notificationZone1.sub_title}</p>
											<p>${notificationZone1.contents}</p>
											<p class="btn">
												${notificationZone1.link_type eq 'APPLY' ? '신청하기' : '자세히보기' }
											</p>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="info-none">
										<span>문화체험</span>
										<img src="/resources/homepage/gbccs/img/main/none-logo.png" alt="경상북도교육청문화원 로고" title="경상북도교육청문화원 로고">
										<p>준비중입니다</p>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${not empty notificationZone2}">
									<li>
										<a href="${notificationZone2.link_url}" ${notificationZone2.link_target eq 'BLANK' ? 'target="_blank"' : '' }>
											<span>${notificationZone2.notification_zone_code_name}</span>
											<h3>${notificationZone2.title}</h3>
											<p>${notificationZone2.sub_title}</p>
											<p>${notificationZone2.contents}</p>
											<p class="btn">
												${notificationZone2.link_type eq 'APPLY' ? '신청하기' : '자세히보기' }
											</p>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="info-none">
										<span>공연대관</span>
										<img src="/resources/homepage/gbccs/img/main/none-logo.png" alt="경상북도교육청문화원 로고" title="경상북도교육청문화원 로고">
										<p>준비중입니다</p>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${not empty notificationZone3}">
									<li>
										<a href="${notificationZone3.link_url}" ${notificationZone3.link_target eq 'BLANK' ? 'target="_blank"' : '' }>
											<span>${notificationZone3.notification_zone_code_name}</span>
											<h3>${notificationZone3.title}</h3>
											<p>${notificationZone3.sub_title}</p>
											<p>${notificationZone3.contents}</p>
											<p class="btn">
												${notificationZone3.link_type eq 'APPLY' ? '신청하기' : '자세히보기' }
											</p>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="info-none">
										<span>전시관람</span>
										<img src="/resources/homepage/gbccs/img/main/none-logo.png" alt="경상북도교육청문화원 로고" title="경상북도교육청문화원 로고">
										<p>준비중입니다</p>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${not empty notificationZone4}">
									<li>
										<a href="${notificationZone4.link_url}" ${notificationZone4.link_target eq 'BLANK' ? 'target="_blank"' : '' }>
											<span>${notificationZone4.notification_zone_code_name}</span>
											<h3>${notificationZone4.title}</h3>
											<p>${notificationZone4.sub_title}</p>
											<p>${notificationZone4.contents}</p>
											<p class="btn">
												${notificationZone4.link_type eq 'APPLY' ? '신청하기' : '자세히보기' }
											</p>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="info-none">
										<span>도서행사</span>
										<img src="/resources/homepage/gbccs/img/main/none-logo.png" alt="경상북도교육청문화원 로고" title="경상북도교육청문화원 로고">
										<p>준비중입니다</p>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>

			<div class="main0-bottom">
				<div class="calendar-box" id="calendar-box">
					
				</div>
			</div>

			<div class="swiper-container mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide mvimg01"></div>
					<div class="swiper-slide mvimg02"></div>
					<div class="swiper-slide mvimg03"></div>
				</div>
			</div>
		</div>
		
		<!--main1-->
		<div id="main1" class="section">
			<div class="qmenu">
				<ul>
					<li class="qm1">
						<a href="/${homepage.context_path}/html.do?menu_idx=12" title="층별안내">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q1.png" alt="층별안내"></div>
							<div class="qtxt">층별안내</div>
						</a>
					</li>
					<li class="qm2">
						<a href="/${homepage.context_path}/module/teach/index.do?menu_idx=27&searchCate1=17&searchCate2=2" title="수강신청">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q2.png" alt="수강신청"></div>
							<div class="qtxt">수강신청</div>
						</a>
					</li>
					<li class="qm3">
						<a href="/gbccs/module/teach/applyList.do?menu_idx=34" title="수강확인">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q3.png" alt="수강확인"></div>
							<div class="qtxt">수강확인</div>
						</a>
					</li>
					<li class="qm4">
						<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=39" title="공연/전시일정">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q4.png" alt="공연/전시일정"></div>
							<div class="qtxt">공연/전시일정</div>
						</a>
					</li>
					<li class="qm5">
						<a href="/${homepage.context_path}/html.do?menu_idx=65" title="대관안내">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q5.png" alt="대관안내"></div>
							<div class="qtxt">대관안내</div>
						</a>
					</li>
					<li class="qm6">
						<a href="/${homepage.context_path}/html.do?menu_idx=36" title="독도체험관">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q6.png" alt="독도체험관"></div>
							<div class="qtxt">독도체험관</div>
						</a>
					</li>
					<li class="qm7">
						<a href="/${homepage.context_path}/html.do?menu_idx=44" title="자료실안내">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q7.png" alt="자료실안내"></div>
							<div class="qtxt">자료실안내</div>
						</a>
					</li>
					<li class="qm8">
						<a href="/${homepage.context_path}/board/index.do?menu_idx=84&manage_idx=582" title="행사동영상">
							<div class="image"><img src="/resources/homepage/gbccs/img/contents/q9.png" alt="행사동영상"></div>
							<div class="qtxt">행사동영상</div>
						</a>
					</li>
					<!-- <homepageTag:quickMenu quickMenuList="${quickMenuList}" /> -->
				</ul>
			</div>
			
			<div class="main1-bottom">
				<div class="main1-inner-left">
					<div class="popupzone-box">
						<div class="title">
							<h3>알림판</h3>
						</div>
						<div class="popupzonenew">
							<c:choose>
								<c:when test="${fn:length(popupZoneList) > 0}">
									<homepageTag:popupZone popupZoneList="${popupZoneList}" />
								</c:when>
								<c:otherwise>
									<ul>
										<li><a href="javascript:void(0);"><img src="/resources/common/img/notice_type04/popupnone.png" alt="" /></a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>		
				<div class="main1-inner-right" id="board-box">
					<div class="notice-box">
						<div class="title">
							<ul>
								<li class="on" keyValue="tab1">
									<a href="javascript:void(0);" title="공지사항 보기">
										공지사항
									</a>
								</li>
								<li keyValue="tab2">
									<a href="javascript:void(0);" title="보도자료 보기">
										보도자료
									</a>
								</li>
								<!--<li keyValue="tab3">
									<a href="javascript:void(0);" title="초청전시 보기">
										초청전시
									</a>
								</li>
								<li keyValue="tab4">
									<a href="javascript:void(0);" title="공연자료실 보기">
										공연자료실
									</a>
								</li>-->
							</ul>
							<div class="more-btn" id="board-more-btn">
								<a href="/${homepage.context_path}/board/index.do?menu_idx=222&manage_idx=541" title="공지사항 더보기">
									<img src="/resources/homepage/gbccs/img/main/board-more.png" alt="공지사항 더보기 이미지" title="공지사항 더보기 이미지">
								</a>
							</div>
						</div>
						<div class="list" id="notice-list">
							<ul>
								<c:if test="${fn:length(noticeList) < 1}">
									<li>
										<a href="javascript:void(0);" title="게시글 자세히 보기">
											<div class="con">
												<h3>등록된 게시물이 없습니다.</h3>
												<span></span>
											</div>
										</a>
									</li>
								</c:if>
								<c:forEach var="i" items="${noticeList}" varStatus="status">
									<c:choose>
										<c:when test="${status.index == 0}">
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=222&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													<div class="date">
														<fmt:formatDate value="${i.add_date}" pattern="yyyy"/>
														<p><fmt:formatDate value="${i.add_date}" pattern="MM-dd"/></p>
													</div>
													<div class="con">
														<h3>${i.title}</h3>
														<span>${i.content_summary}</span>
													</div>
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=222&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													${i.title}
												</a>
												<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						
						<div class="list" id="news-list" style="display:none;">
							<ul>
								<c:if test="${fn:length(newsList) < 1}">
									<li>
										<a href="javascript:void(0);" title="게시글 자세히 보기">
											<div class="con">
												<h3>등록된 게시물이 없습니다.</h3>
												<span></span>
											</div>
										</a>
									</li>
								</c:if>
								<c:forEach var="i" items="${newsList}" varStatus="status">
									<c:choose>
										<c:when test="${status.index == 0}">
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=224&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													<div class="date">
														<fmt:formatDate value="${i.add_date}" pattern="yyyy"/>
														<p><fmt:formatDate value="${i.add_date}" pattern="MM-dd"/></p>
													</div>
													<div class="con">
														<h3>${i.title}</h3>
														<span>${i.content_summary}</span>
													</div>
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=224&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													${i.title}
												</a>
												<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>

						<!--<div class="list" id="invitation-list" style="display:none;">
							<ul>
								<c:if test="${fn:length(invitationList) < 1}">
									<li>
										<a href="javascript:void(0);" title="게시글 자세히 보기">
											<div class="con">
												<h3>등록된 게시물이 없습니다.</h3>
												<span></span>
											</div>
										</a>
									</li>
								</c:if>
								<c:forEach var="i" items="${invitationList}" varStatus="status">
									<c:choose>
										<c:when test="${status.index == 0}">
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=167&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													<div class="date">
														<fmt:formatDate value="${i.add_date}" pattern="yyyy"/>
														<p><fmt:formatDate value="${i.add_date}" pattern="MM-dd"/></p>
													</div>
													<div class="con">
														<h3>${i.title}</h3>
														<span>${i.content_summary}</span>
													</div>
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=167&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													${i.title}
												</a>
												<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						
						<div class="list" id="show-list" style="display:none;">
							<ul>
								<c:if test="${fn:length(showList) < 1}">
									<li>
										<a href="javascript:void(0);" title="게시글 자세히 보기">
											<div class="con">
												<h3>등록된 게시물이 없습니다.</h3>
												<span></span>
											</div>
										</a>
									</li>
								</c:if>
								<c:forEach var="i" items="${showList}" varStatus="status">
									<c:choose>
										<c:when test="${status.index == 0}">
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=172&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													<div class="date">
														<fmt:formatDate value="${i.add_date}" pattern="yyyy"/>
														<p><fmt:formatDate value="${i.add_date}" pattern="MM-dd"/></p>
													</div>
													<div class="con">
														<h3>${i.title}</h3>
														<span>${i.content_summary}</span>
													</div>
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="/${homepage.context_path}/board/view.do?menu_idx=172&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" title="게시글 자세히 보기">
													${i.title}
												</a>
												<span><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></span>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>-->

					</div>
				</div>		
			</div>
		</div>
		
		<!--main2-->
		<div id="main2" class="section">
			<div class="main2-left">
				<div id="result" style="position:relative">
					<div class="title">
						<h3>
							L-큐레이션 <a href="http://q.gbelib.kr/index.jsp?gid=24" target="_blank" class="more-btn"><img src="/resources/homepage/gbccs/img/main/board-more.png" alt="더보기"></a>
						</h3>
					</div>
					<div class="list">
						<div class="bx-controls bx-has-controls-direction">
							<div class="bx-controls-direction">
								<a class="bx-prev" id="bxprev" href="javascript:void(0);">Prev</a>
								<a class="bx-next" id="bxnext" href="javascript:void(0);">Next</a>
							</div>
						</div>
						<ul>
							<li>
								<a href="" title="큐레이션 자세히 보기">
									<div class="img-box">
										<img src="http://q.gbelib.kr/CATE_IMG/45/1DF3371D-350A-85DF-35CD-111246191F47.jpg" alt="10월 테마도서">
									</div>
									<div class="txt-box">
										<h3>10월 테마도서</h3>
										<p></p>
										<span>2022-09-29</span>
									</div>
								</a>
							</li>
							<li>
								<a href="" title="큐레이션 자세히 보기">
									<div class="img-box">
										<img src="http://q.gbelib.kr/CATE_IMG/45/1DEFD240-020B-9114-260A-8B97C9B130B6.jpg" alt="10월 추천도서">
									</div>
									<div class="txt-box">
										<h3>10월 추천도서</h3>
										<p></p>
										<span>2022-09-29</span>
									</div>
								</a>
							</li>
							<li>
								<a href="" title="큐레이션 자세히 보기">
									<div class="img-box">
										<img src="http://q.gbelib.kr/CATE_IMG/45/A67D4B01-EF0F-4465-8258-EB5078ADEB87.jpg" alt="9월 테마도서 안내">
									</div>
									<div class="txt-box">
										<h3>9월 테마도서 안내</h3>
										<p></p>
										<span>2022-08-30</span>
									</div>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="main2-right">
				<div class="gallery-box">
					<div class="title">
						<h3>
							포토갤러리
							<a href="/${homepage.context_path}/board/index.do?menu_idx=225&manage_idx=542" class="more-btn"><img src="/resources/homepage/gbccs/img/main/gallery-more.png" alt="더보기"></a>
						</h3>
					</div>
					<div class="con">
						<c:if test="${fn:length(galleryList) < 1}">
							<a href="javascript:void(0);" class="more-btn">
								<div class="txt-box">
									<div class="txt">
										<p>등록된 게시물이 없습니다.</p>
										<span></span>
									</div>
								</div>
								<div class="img-box">
									<img src="/resources/homepage/gbccs/img/main/gallery-img.jpg" alt="더보기">
								</div>
							</a>
						</c:if>
						<c:forEach var="i" items="${galleryList}" varStatus="status">
							<a href="/${homepage.context_path}/board/view.do?menu_idx=225&amp;manage_idx=${i.manage_idx}&amp;board_idx=${i.board_idx}" class="more-btn">
								<div class="txt-box">
									<div class="txt">
										<p>${i.title}</p>
										<span><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></span>
									</div>
								</div>
								<div class="img-box">
									<c:choose>
										<c:when test="${i.preview_img ne null}">
											<c:choose>
												<c:when test="${fn:contains(i.preview_img, 'http')}">
													<img src="${i.preview_img}" alt="${i.title}"/>
												</c:when>
												<c:otherwise>
													<img class="previewImg" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}"/>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<img src="/resources/homepage/gbccs/img/main/gallery-img.jpg" alt="더보기">
										</c:otherwise>
									</c:choose>
								</div>
							</a>
						</c:forEach>
						
					</div>
				</div>
				<div class="video-box" style="position:relative;">
					<div class="title">
						<h3>홍보영상 바로 보기</h3>
					</div>
 					<!-- <img class="main_hongBo1" src="/resources/homepage/gbccs/img/main/hongBoImg.png" alt="이미지썸네일" class="play" id="play" style="position:absolute; top:0; left:0; z-index: 0; width:100%; opacity:0.9"/> -->
 					<!-- <img class="main_hongBo_button" src="/resources/homepage/gbccs/img/main/hongBo-play-button.png"/> -->
 					<iframe class="main_hongBo2" width="100%" height="100%" src="https://www.youtube.com/embed/Psw-6tbzq9w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="position:absolute;left:0;top:0; display: none;"></iframe>
				</div>
			</div>
		</div>

		<div class="site-box sections">
			<ul>
				<li>
					<div class="site_link">
						<select onchange="if (this.options[this.selectedIndex].value != '')window.open(this.options[this.selectedIndex].value,'_blank')">
							<option value='' selected>전국교육문화회관</option>
							<option value="https://www.dge.go.kr/dccs/main.do " title="대구학생문화센터">대구학생문화센터</option>
							<option value="https://home.pen.go.kr/bacs/main.do" title="부산광역시교육청학생예술문화회관">부산광역시교육청학생예술문화회관</option>
							<option value="https://home.pen.go.kr/becs/main.do" title="부산광역시학생교육문화회관">부산광역시학생교육문화회관</option>
							<option value="http://www.iecs.go.kr/" title="인천학생교육문화회관">인천학생교육문화회관</option>
							<option value="http://lib.gen.go.kr/student/" title="광주학생독립운동기념회관">광주학생독립운동기념회관</option>
							<option value="https://lib.gen.go.kr/gecs/" title="광주학생교육문화회관">광주학생교육문화회관</option>
							<option value="https://dsecc.djsch.kr/djsecc/main.do" title="대전학생교육문화원">대전학생교육문화원</option>
							<option value="http://www.cbec.go.kr/home/main.php" title="충청북도교육문화원">충청북도교육문화원</option>
							<option value="https://www.jcsh.go.kr/index.do" title="충청북도제천학생회관">충청북도제천학생회관</option>
							<option value="https://chsl.cne.go.kr/" title="충청남도학생교육문화원">충청남도학생교육문화원</option>
							<option value="https://lib.jbe.go.kr/jec/index.do" title="전주교육문화회관">전주교육문화회관</option>
							<option value="http://jsecc.jne.go.kr/index.es?sid=c2" title="전라남도학생교육문화회관">전라남도학생교육문화회관</option>
							<option value="https://lib.jbe.go.kr/gec/index.do" title="군산교육문화회관">군산교육문화회관</option>
							<option value="https://lib.jbe.go.kr/isec/index.do" title="익산교육문화회관">익산교육문화회관</option>
							<option value="http://www.necc.go.kr/index.do" title="남원교육문화회관">남원교육문화회관</option>
							<option value="https://lib.jbe.go.kr/bec/index.do" title="부안교육문화회관">부안교육문화회관</option>
							<option value="https://lib.jbe.go.kr/gecc/index.do" title="김제교육문화회관">김제교육문화회관</option>
							<option value="http://www.lifelo.or.kr/" title="제주학생문화원">제주학생문화원</option>
							<option value="https://org.jje.go.kr/sscc/index.jje" title="서귀포학생문화원">서귀포학생문화원</option>
							<option value="https://lib.jbe.go.kr/jec/index.do" title="전주교육문화회관">전주교육문화회관</option>
							<option value="https://www.dge.go.kr/dccs/main.do" title="대구학생문화센터">대구학생문화센터</option>
							<option value="https://chsl.cne.go.kr/index.do" title="충청남도학생교육문화원">충청남도학생교육문화원</option>
						</select>
					</div>
				</li>
				<li>
					<div class="site_link">
						<select onchange="if (this.options[this.selectedIndex].value != '')window.open(this.options[this.selectedIndex].value,'_blank')">
							<option value='' selected>직속기관</option>
							<option value="http://www.gber.kr" title="경상북도교육청연구원">경상북도교육청연구원</option>									
							<option value="http://www.gbeti.or.kr/" title="경상북도교육청연수원">경상북도교육청연수원</option>					
							<option value="http://www.gbelib.kr/geic" title="경상북도교육청정보센터">경상북도교육청정보센터</option>					
							<option value="http://www.gbe.kr/hwarang/main.do" title="화랑교육원">화랑교육원</option>					
							<option value="https://www.gbe.kr/gsei/main.do" title="경상북도교육청과학원">경상북도교육청과학원</option>					
							<option value="http://www.gbelib.kr/gm/" title="경상북도교육청 구미도서관">경상북도교육청 구미도서관</option>					
							<option value="http://www.gbelib.kr/ad/" title="경상북도교육청 안동도서관">경상북도교육청 안동도서관</option>					
							<option value="http://gbelib.kr/sj/" title="경상북도교육청 상주도서관">경상북도교육청 상주도서관</option>					
							<option value="https://www.gbelib.kr/yj/index.do" title="경상북도교육청 영주선비도서관">경상북도교육청 영주선비도서관</option>					
							<option value="http://www.gbccs.kr" title="경상북도교육청문화원">경상북도교육청문화원</option>					
							<option value="http://www.gbe.kr/gbsea/main.do" title="경상북도교육청해양수련원">경상북도교육청해양수련원</option>
						</select>
					</div>
				</li>
				<li>
					<div class="site_link">
						<select onchange="if (this.options[this.selectedIndex].value != '')window.open(this.options[this.selectedIndex].value,'_blank')">
							<option value='' selected>도·지역청</option>
							<option value="http://www.gbe.kr/main/main.do" title="경상북도교육청">경상북도교육청</option>		
							<option value="http://www.gbe.kr//ph/main.do" title="포항교육지원청">포항교육지원청</option>									
							<option value="http://www.gbe.kr//gj/main.do" title="경주교육지원청">경주교육지원청</option>						
							<option value="http://www.gbe.kr//gc/main.do" title="김천교육지원청">김천교육지원청</option>						
							<option value="http://www.gbe.kr//ad/main.do" title="안동교육지원청">안동교육지원청</option>						
							<option value="http://www.gbe.kr/gm/main.do" title="구미교육지원청">구미교육지원청</option>						
							<option value="http://www.gbe.kr//yj/main.do" title="영주교육지원청">영주교육지원청</option>						
							<option value="http://www.gbe.kr//yc/main.do" title="영천교육지원청">영천교육지원청</option>						
							<option value="http://www.gbe.kr//sje/main.do" title="상주교육지원청">상주교육지원청</option>						
							<option value="http://www.gbe.kr//mg/main.do" title="문경교육지원청">문경교육지원청</option>						
							<option value="http://www.gbe.kr//gs/main.do" title="경산교육지원청">경산교육지원청</option>						
							<option value="http://www.gbe.kr//gw/main.do" title="군위교육지원청">군위교육지원청</option>						
							<option value="http://www.gbe.kr//us/main.do" title="의성교육지원청">의성교육지원청</option>						
							<option value="http://www.gbe.kr//cs/main.do" title="청송교육지원청">청송교육지원청</option>						
							<option value="http://www.gbe.kr//yy/main.do" title="영양교육지원청">영양교육지원청</option>						
							<option value="http://www.gbe.kr//yd/main.do" title="영덕교육지원청">영덕교육지원청</option>						
							<option value="http://www.gbe.kr//cd/main.do" title="청도교육지원청">청도교육지원청</option>						
							<option value="http://www.gbe.kr//gr/main.do" title="고령교육지원청">고령교육지원청</option>						
							<option value="http://www.gbe.kr//sj/main.do" title="성주교육지원청">성주교육지원청</option>						
							<option value="http://www.gbe.kr//cg/main.do" title="칠곡교육지원청">칠곡교육지원청</option>						
							<option value="http://www.gbe.kr//ycg/main.do" title="예천교육지원청">예천교육지원청</option>						
							<option value="http://www.gbe.kr//bh/main.do" title="봉화교육지원청">봉화교육지원청</option>						
							<option value="http://www.gbe.kr//uj/main.do" title="울진교육지원청">울진교육지원청</option>						
							<option value="http://www.gbe.kr//ul/main.do" title="울릉교육지원청">울릉교육지원청</option>
						</select>
					</div>
				</li>
				<li>
					<div class="site_link">
						<select onchange="if (this.options[this.selectedIndex].value != '')window.open(this.options[this.selectedIndex].value,'_blank')">
							<option value='' selected>타시도 교육청</option>
							<option value="https://www.moe.go.kr" title="교육부">교육부</option>									
							<option value="http://www.sen.go.kr" title="서울특별시교육청">서울특별시교육청</option>						
							<option value="http://www.pen.go.kr" title="부산광역시교육청">부산광역시교육청</option>						
							<option value="http://www.dge.go.kr" title="대구광역시교육청">대구광역시교육청</option>						
							<option value="http://www.ice.go.kr" title="인천광역시교육청">인천광역시교육청</option>						
							<option value="http://www.gen.go.kr" title="광주광역시교육청">광주광역시교육청</option>						
							<option value="http://www.dje.go.kr" title="대전광역시교육청">대전광역시교육청</option>						
							<option value="http://www.use.go.kr" title="울산광역시교육청">울산광역시교육청</option>						
							<option value="http://www.goe.go.kr" title="경기도교육청">경기도교육청</option>						
							<option value="http://www.gwe.go.kr" title="강원도교육청">강원도교육청</option>						
							<option value="http://www.cbe.go.kr" title="충청북도교육청">충청북도교육청</option>						
							<option value="http://www.cne.go.kr" title="충청남도교육청">충청남도교육청</option>						
							<option value="http://www.jbe.go.kr" title="전라북도교육청">전라북도교육청</option>						
							<option value="http://www.jne.go.kr" title="전라남도교육청">전라남도교육청</option>						
							<option value="http://www.gne.go.kr" title="경상남도교육청">경상남도교육청</option>						
							<option value="http://www.jje.go.kr" title="제주특별자치도교육청">제주특별자치도교육청</option>						
							<option value="http://www.sje.go.kr" title="세종특별자치시교육청">세종특별자치시교육청</option>
						</select>
					</div>
				</li>
				<li>
					<div class="site_link">
						<select onchange="if (this.options[this.selectedIndex].value != '')window.open(this.options[this.selectedIndex].value,'_blank')">
							<option value='' selected>유관기관</option>
							<option value="https://www.gb.go.kr/" title="경상북도">경상북도</option>									
							<option value="https://council.gb.go.kr/" title="경상북도의회">경상북도의회</option>						
							<option value="http://www.edunet.net" title="에듀넷">에듀넷</option>						
							<option value="http://www.niied.go.kr/main/main.do" title="국립국제교육원">국립국제교육원</option>						
							<option value="http://nas.go.kr" title="대한민국학술원">대한민국학술원</option>						
							<option value="http://kice.re.kr" title="한국교육과정평가원">한국교육과정평가원</option>						
							<option value="http://keris.or.kr" title="한국교육학술정보원">한국교육학술정보원</option>						
							<option value="https://www.riss.kr/index.do" title="학술연구정보서비스">학술연구정보서비스</option>						
							<option value="http://kedi.re.kr" title="한국교육개발원">한국교육개발원</option>						
							<option value="http://www.krivet.re.kr" title="한국직업능력개발원">한국직업능력개발원</option>
							<!-- <option value="https://home.pen.go.kr/becs/main.do" title="부산광역시 학생교육문화회관">부산광역시 학생교육문화회관</option> -->
						</select>
					</div>
				</li>
			</ul>
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
								<a class="more" href="/${homepage.context_path}/bannermap/index.do?menu_idx=138"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
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
