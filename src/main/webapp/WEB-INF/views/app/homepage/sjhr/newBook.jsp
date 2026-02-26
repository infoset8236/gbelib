<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function(){
	var _width = $(window).width();
	var _bookListTop;
	var _bookListBottom;

		var Books = function(){
			try {
				if( _bookListTop ) _bookListTop.destroySlider();
				if( _bookListBottom ) _bookListBottom.destroySlider();
			} catch (e) {
				// TODO: handle exception
			}

			if( _width <= 380 ){
				_bookListTop = $('.bookListTop ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 190,
					slideMargin: 0
				});

				_bookListBottom = $('.bookListBottom ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 190,
					slideMargin: 0
				});
			}
			else if( _width <= 550 && _width > 380 ){
				_bookListTop = $('.bookListTop ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 190,
					slideMargin: 0
				});

				_bookListBottom = $('.bookListBottom ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 190,
					slideMargin: 0
				});
			}
			else if( _width <= 768 && _width > 550 ){
				_bookListTop = $('.bookListTop ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 190,
					slideMargin: 10
				});

				_bookListBottom = $('.bookListBottom ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 190,
					slideMargin: 10
				});
			}
			else if( _width <= 1024 && _width > 768 ){
				_bookListTop = $('.bookListTop ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 190,
					slideMargin: 20
				});

				_bookListBottom = $('.bookListBottom ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 190,
					slideMargin: 20
				});
			}
			else if( _width <= 1600 && _width > 1024 ){
				_bookListTop = $('.bookListTop ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 190,
					slideMargin: 10
				});

				_bookListBottom = $('.bookListBottom ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 190,
					slideMargin: 20
				});
			}
			else {
				_bookListTop = $('.bookListTop ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 250,
					slideMargin: 30
				});

				_bookListBottom = $('.bookListBottom ul').bxSlider({
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
		};
		Books();
		$(window).on('resize', function(){
			_width = $(window).width();
			Books();
		});
});
</script>

<ul>
	<c:forEach var="i" items="${newBookList.dsNewBookList}">
		<li>
			<a href="/${homepage.context_path}/intro/search/detail.do?vLoca=${i.LOCA}&vCtrl=${i.CTRLNO}&vImg=${i.COVER_SMALLURL }&menu_idx=12" title="도서 자세히 보기">
				<div class="img-box">
					<img src="${not empty i.COVER_SMALLURL ? i.COVER_SMALLURL : '/resources/homepage/gm/img/noimg1.png' }" alt="${i.TITLE}" title="${i.TITLE}"/>
				</div>
				<div class="txt-box">
					<h3>${i.TITLE}</h3>
				</div>
			</a>
		</li>
	</c:forEach>
</ul>


