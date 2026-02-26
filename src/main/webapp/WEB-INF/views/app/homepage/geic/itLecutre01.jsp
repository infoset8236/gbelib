<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function(){
	var _width = $(window).width();
	var _Itlist;

		var Books = function(){
			try {
				if( _Itlist ) _Itlist.destroySlider();
			} catch (e) {
				// TODO: handle exception
			}

			if( _width <= 200 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 1,
					slideWidth: 100,
					slideMargin: 0
				});
			}
			else if( _width <= 450 && _width > 200 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 100,
					slideMargin: 15
				});
			}
			else if( _width <= 600 && _width > 450 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 1,
					slideWidth: 150,
					slideMargin: 0
				});
			}
			else if( _width <= 750 && _width > 600 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 150,
					slideMargin: 10
				});
			}
			else if( _width <= 870 && _width > 750 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 180,
					slideMargin: 10
				});
			}
			else if( _width <= 960 && _width > 870 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 180,
					slideMargin: 10
				});
			}
			else if( _width <= 1024 && _width > 960 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 200,
					slideMargin: 10
				});
			}
			else if( _width <= 1050 && _width > 1024 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 200,
					slideMargin: 10
				});
			}
			else if( _width <= 1130 && _width > 1050 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 220,
					slideMargin: 15
				});
			}
			else if( _width <= 1210 && _width > 1130 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 250,
					slideMargin: 15
				});
			}
			else if( _width <= 1400 && _width > 1210 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 250,
					slideMargin: 30
				});
			}
			else if( _width <= 1480 && _width > 1400 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 250,
					slideMargin: 10
				});
			}
			else if( _width <= 1540 && _width > 1480 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 250,
					slideMargin: 30
				});
			}
			else if( _width <= 1660 && _width > 1540 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 300,
					slideMargin: 20
				});
			}
			else if( _width <= 1770 && _width > 1660 ){
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 300,
					slideMargin: 50
				});
			}
			else {
				_Itlist = $('.Itlist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 300,
					slideMargin: 60
				});
			}
		};
		Books();
		$(window).on('resize', function(){
			_width = $(window).width();
			Books();
		});
});
</script>

<ul>
	<c:forEach var="i" items="${itLecutreList}">
		<li>
			<a href="${i.imsi_v_1}" target="_blank" title="${i.title}" alt="새 창으로 열립니다.">									
				<c:choose>
					<c:when test="${i.preview_img ne null}">
						<c:choose>
							<c:when test="${fn:contains(i.preview_img, 'http')}">
								<img src="${i.preview_img}" onerror="this.src='/resources/homepage/geic/img/geic-it-noimg.png'" alt="${i.title}"/>
							</c:when>
							<c:otherwise>
								<img class="previewImg" src="/data/board/${i.manage_idx}/${i.board_idx}/thumb/${i.preview_img}" onerror="this.src='/resources/homepage/geic/img/geic-it-noimg.png'" alt="${i.title}"/>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<img src="/resources/common/img/noimg-gall.png" onerror="this.src='/resources/homepage/geic/img/geic-it-noimg.png'" alt="${i.title}">
					</c:otherwise>
				</c:choose>
				<p>${i.title}</p>
			</a>
		</li>
	</c:forEach>
</ul>
<c:if test="${empty itLecutreList}">
	<span href="javascript:void(0)">
		등록된 강좌가 없습니다.
	</span>
</c:if>
