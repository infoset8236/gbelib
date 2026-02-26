<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="close-btn btn2" keyValue="all" >
	<span>오늘 하루 열지 않기</span>
</div>
<div class="close-btn">
	<span>창 닫기</span>
</div>
<div class="title">
	<p>주요 소식을 한 눈에!</p>
	<h3>POPUP LIST</h3>
</div>

<script>
	$(function(){
		$('.btn2').on('click', function() {
			var $this = $(this);
			var type = $(this).attr('keyValue');
			if (type == 'all') {
				var popupId = 'all-popup-${homepage.homepage_id}';
				
				var todayDate = new Date();
				todayDate = new Date(
						parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
				document.cookie = popupId + "=no"
						+ "; path=/; expires="
						+ todayDate.toGMTString() + ";";
						
				$('div.' + popupId).hide();
				
			}
		});
		
		$('.close-btn').on('click', function() {
			var $this = $(this);
			var type = $(this).attr('keyValue');
			if (type != 'all') {
				var popupId = 'all-popup-${homepage.homepage_id}';
						
				$('div.' + popupId).hide();
			}
		});

		var ___width = $(window).width();
		var _popupFullList;

		var Notices = function(){
			try {
				if( _popupFullList ) _popupFullList.destroySlider();
			} catch (e) {
				// TODO: handle exception
			}

			if( ___width <= 425 ){
				_popupFullList = $('#popupFullList ul').bxSlider({
					auto: true,
					autoHover: true,
					autoControls:true,
					autoControlsCombine: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 150,
					slideMargin: 10
				});
			}
			else if( ___width <= 600 && ___width > 425 ){
				_popupFullList = $('#popupFullList ul').bxSlider({
					auto: true,
					autoHover: true,
					autoControls:true,
					autoControlsCombine: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 200,
					slideMargin: 10
				});
			}
			else if( ___width <= 768 && ___width > 600 ){
				_popupFullList = $('#popupFullList ul').bxSlider({
					auto: true,
					autoHover: true,
					autoControls:true,
					autoControlsCombine: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 250,
					slideMargin: 10
				});
			}
			else if( ___width <= 1024 && ___width > 768 ){
				_popupFullList = $('#popupFullList ul').bxSlider({
					auto: true,
					autoHover: true,
					autoControls:true,
					autoControlsCombine: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 400,
					slideMargin: 10
				});
			}
			else if( ___width <= 1260 && ___width > 1024 ){
				_popupFullList = $('#popupFullList ul').bxSlider({
					auto: true,
					autoHover: true,
					autoControls:true,
					autoControlsCombine: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 400,
					slideMargin: 20
				});
			}
			else {
				_popupFullList = $('#popupFullList ul').bxSlider({
					auto: true,
					autoHover: true,
					autoControls:true,
					autoControlsCombine: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 400,
					slideMargin: 20
				});
			}
		};

		Notices();
		
	});
</script>
<div class="list" id="popupFullList">
	<ul>
		<c:forEach var="i" items="${popupFullList}">
			<li>
				<a href="${i.link_url}" ${i.link_target eq 'BLANK' ? 'target="_blank"' : '' } title="자세히보기">
					<c:choose>
						<c:when test="${not empty i.real_file_name}">
							<img src="/data/popup/${i.homepage_id}/${i.real_file_name}" alt="${i.popup_name}" title="${i.popup_name}"  onerror="this.src='/resources/homepage/gm/img/noimg1.png'">
						</c:when>
						<c:otherwise>
							<img src="/resources/homepage/gm/img/noimg1.png" alt="${i.popup_name}" title="${i.popup_name}">
						</c:otherwise>
					</c:choose>
					<c:if test="${i.link_type ne 'NONE' }">
						<p>${i.link_type eq 'APPLY' ? '신청하기' : '자세히보기' }</p>
					</c:if>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>