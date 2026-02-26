<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertAttribute name="header" />
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
	   		$('.grid2 li img').width($('.grid2 ul').width() * 0.5);
	   		$('.grid2 li img').height($('.grid2 li.first img') * 0.6);
	   		$('.grid2 li img').width($('.grid2 ul').width() * 0.35);
	   		$('.grid2 li img').height($('.grid2 li.other img').width() * 0.6);
	   		
// 	   		$('.grid3 li.first img').width($('.grid3 ul').width() * 0.25);
// 	   		$('.grid3 li.first img').height($('.grid3 li.first img') * 0.6);
	   		$('.grid3 li img').width($('.grid3 ul').width() * 0.25);
	   		$('.grid3 li img').height($('.grid3 li.other img').width() * 0.8);
	   		
	   		
	   		
	   		//$('div#likeBook img').width($('div#likeBook li').width() * 1);
	   		//$('div#likeBook img').height($('div#likeBook img').width() * 1.2);
	   	});
	   	$(window).trigger('resize');
	   	// 썸네일 작업
	   	
	   	$('div.qmenu a#quickHide').click();
	   	
	   	doAjaxLoad('div#likeBook', 'newBook.do','');
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
			<div class="main-img">
				<homepageTag:mainImg mainImgList="${mainImgList}"/>
			</div>

			<div class="section">
			
				<div class="popupzone">
					<ul>
						<c:forEach items="${newsList}" var="i">
							<li class="active">
							<dl>
								<dt>
									<span>${i.sub_title }</span>
									<b>${i.title}</b>
								</dt>
								<dd>
									${i.contents}
								</dd>
							</dl>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:350, slides:3},{screen:450, slides:3},{screen:767, slides:4},{screen:1000, slides:${fn:length(quickMenuList)}}]">
					<homepageTag:quickMenu quickMenuList="${quickMenuList}"/>
				</ul>
			</div>
			<div class="control">
				<a href="" id="quickShow">퀵메뉴 보이기</a>
				<a href="" id="quickHide" class="active">퀵메뉴 가리기</a>
			</div>
		</div>

		<div class="Grid grid1" style="display: none;">
			<div class="section">
				<div class="gt">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=33&manage_idx=31">
						<b>새소식</b>
						<span>Center Notice</span>
					</a>
				</div>
				<div class="gd">
					<ul>
						<c:forEach items="${h27noticeList}" varStatus="status" var="i">
						<li class="eventItem">
							<a href="/${homepage.context_path}/board/view.do?menu_idx=33&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}">
								<span class="thumb">
									<c:choose>
										<c:when test="${i.preview_img ne null}">
									<a href="" keyValue="${i.board_idx}">
										<img class="previewImg" src="/data/board/${i.manage_idx}/${i.board_idx}/thumb/${i.preview_img}" alt="${i.title}"/>
									</a>
										</c:when>
										<c:otherwise>
									<a href="" keyValue="${i.board_idx}"><img src="/resources/common/img/noimg-gall.png" alt="${i.title}"></a>
										</c:otherwise>
									</c:choose>
								</span>
								<span class="entry">
									<span>
										<b>${i.title}</b>
										<em class="datetime"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></em>
										<em class="snipet">
											${fn:substring(i.content_summary,0,50)}
										</em>
									</span>
								</span>
							</a>
						</li>
						</c:forEach>
					</ul>
					<script type="text/javascript">
					$('.grid1 .eventItem').each(function(){
						if($(this).find('img').length < 1){
							$(this).addClass('noimg');
						}
					});
					</script>
				</div>
				<div class="see-more">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=33&manage_idx=31" class="more">더보기</a>
				</div>
			</div>
		</div>

		<div class="Grid grid2">
			<div class="section">
				<div class="gt">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=33&manage_idx=31">
						<br/>
						<b>독서문화소식</b>
						<span>Reading Culture event</span>
					</a>
				</div>
				<div class="gd">
					<ul>
						<c:forEach items="${h27noticeList}" var="i" varStatus="status">
						<li class="eventItem">
							<a href="/${homepage.context_path}/board/view.do?menu_idx=33&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}">
								<span class="thumb">
									<c:if test="${i.preview_img ne null}">
									<span><img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}" style="width: 305px; height: 170px"/></span> <!-- alt 해당 글 제목 넣기 -->
									</c:if>
									<c:if test="${i.preview_img eq null}">
									<span class="noImg">
										<img src="/resources/common/img/noImg150x83.gif" alt="noImage" />
										<span>등록된 이미지가<br>없습니다.</span>
									</span> <!-- alt 해당 글 제목 넣기 -->
									</c:if>
								</span>
								<span class="entry">
									<span>
										<em class="sca"><b>${i.title}</b></em>
										<em class="datetime"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></em>
									</span>
								</span>
							</a>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="see-more">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=33&manage_idx=31" class="more">더보기</a>
				</div>
			</div>
		</div>
		
		<div class="Grid grid3">
			<div class="section">
				<div class="gt">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=45&manage_idx=23">
						<br/>
						<b>평생교육소식</b>
						<span>Continuing education courses</span>
					</a>
				</div>
				<div class="gd">
					<ul>
						<c:forEach items="${h27noticeList2}" var="i">
						<li class="eventItem">
							<a href="/${homepage.context_path}/board/view.do?menu_idx=45&manage_idx=23&board_idx=${i.board_idx}">
								<span class="thumb">
									<span><img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt=""/></span> <!-- alt 해당 글 제목 넣기 -->
								</span>
								<span class="entry">
									<span>
										<em class="sca"><b>${fn:substring(i.title,0,30)}</b></em>
										<em class="datetime"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd"/></em>
										<em class="snipet">${fn:substring(i.content_summary,0,60)}
											<c:if test="${fn:length(i.content_summary) > 59}">...</c:if>
										</em>
									</span>
								</span>
							</a>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="see-more">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=45&manage_idx=23" class="more">더보기</a>
				</div>
			</div>
		</div>

		<div class="Grid grid4">
			<div class="section">
				<div class="gt">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=19&manage_idx=10">
						<br/>
						<b>추천도서</b>
						<span>Recommended reading</span>
					</a>
				</div>
				<div class="gd">
					<ul>
						<c:forEach items="${h27bookList}" var="i">
							<li class="eventItem">
								<a href="/${homepage.context_path}/board/view.do?manage_idx=10&board_idx=${i.board_idx}&menu_idx=19&plan_date=${i.imsi_v_1}">
									<span class="thumb">
										<span>
											<c:choose>
												<c:when test="${fn:indexOf(i.preview_img, 'http') > -1 }">
													<img src="${i.preview_img}" alt="${i.title}"/>
												</c:when>
												<c:otherwise>
													<img src="/data/board/10/${i.board_idx}/${i.preview_img}" alt="${i.title}"/>	
												</c:otherwise>
											</c:choose>
										</span> <!-- alt 해당 글 제목 넣기 -->
									</span>
									<span class="entry">
										<span>
											<!-- <em class="sca">[일반도서]</em> -->
											<b>${i.title}</b>
											<em class="datetime">
												<em class="p1">
													<c:if test="${i.imsi_v_3 ne null}">
													저자: ${i.imsi_v_3}
													</c:if>
												</em>
												<em class="p2">
													<c:if test="${i.imsi_v_4 ne null}">
													출판사: ${i.imsi_v_4}
													</c:if>
												</em>
											</em>
											<strong>${i.imsi_v_7}</strong>
										</span>
									</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="see-more">
					<a href="/${homepage.context_path}/board/index.do?menu_idx=19&manage_idx=10" class="more">더보기</a>
				</div>
			</div>
		</div>
		
		<div class="Grid grid4" style="border-top:1px solid #dedede">
			<div class="section">
				<div class="gt">
					<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=9">
						<br/>
						<b>신착도서</b>
						<span>Newly Arrived Books</span>
					</a>
				</div>
				<div class="gd" id="likeBook">
				</div>
				<div class="see-more">
					<a href="/${homepage.context_path}/intro/search/newBook/index.do?menu_idx=9" class="more">더보기</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="clear:both">
<br/>
</div>

<script type="text/javascript">
$('.Grid ul').each(function(e){
	var grid = $(this).parents('div.Grid');
	if (!grid.hasClass('grid4')) {
		$(this).find('li:first').addClass('first');
		$(this).find('li').each(function(e){
			if ( !$(this).hasClass('first') ) {
				$(this).addClass('other');
			} else {
			}
			$(this).addClass('item'+(e+1));
		});
	} else {
		$(this).find('li').each(function(e){
			if ( !$(this).hasClass('first') ) {
				$(this).addClass('other');
			} else {
			}
			$(this).addClass('item'+(e+1));
		});
	}
	
});
</script>
<img id="tmpImg" src="https://4.bp.blogspot.com/-ufYva560LQs/WBl9tOBx__I/AAAAAAAAABk/_PqW-w-GWsUI3rLn-rKMgCBSe9pjUOjHwCLcB/s0/sample.jpg" alt="" style="display:none;">
<img src="/resources/common/img/noImg150x83.gif" alt="noImage" style="display: none;" id="15083">
<tiles:insertAttribute name="footer" />