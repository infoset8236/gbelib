<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function(){
	var _width = $(window).width();
	var _Booklist;

		var Books = function(){
			try {
				if( _Booklist ) _Booklist.destroySlider();
			} catch (e) {
				// TODO: handle exception
			}

			if( _width <= 200 ){
				_Booklist = $('.Booklist ul').bxSlider({
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
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 100,
					slideMargin: 20
				});
			}
			else if( _width <= 600 && _width > 450 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 120,
					slideMargin: 20
				});
			}
			else if( _width <= 740 && _width > 600 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 120,
					slideMargin: 20
				});
			}
			else if( _width <= 780 && _width > 740 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 120,
					slideMargin: 20
				});
			}
			else if( _width <= 960 && _width > 780 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 1,
					slideWidth: 110,
					slideMargin: 0
				});
			}
			else if( _width <= 1024 && _width > 960 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 120,
					slideMargin: 10
				});
			}
			else if( _width <= 1200 && _width > 1024 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 1,
					slideWidth: 140,
					slideMargin: 10
				});
			}
			else if( _width <= 1330 && _width > 1200 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 150,
					slideMargin: 15
				});
			}
			else if( _width <= 1550 && _width > 1330 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 2,
					slideWidth: 150,
					slideMargin: 15
				});
			}
			else if( _width <= 1770 && _width > 1550 ){
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 3,
					slideWidth: 170,
					slideMargin: 15
				});
			}
			else {
				_Booklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 4,
					slideWidth: 170,
					slideMargin: 15
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

<ul class="book-list">
<c:forEach items="${bookList}" var="i">
	<li>								
		<a href="/${homepage.context_path}/board/view.do?menu_idx=137&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}" title="도서 자세히 보기">
			<c:choose>
				<c:when test="${fn:indexOf(i.preview_img, 'http') > -1 }">
					<img src="${i.preview_img}" alt="${i.title}" title="${i.title}//${i.preview_img}"/>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${not empty i.preview_img}">
							<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" alt="${i.title}" title="${i.title}"/>
						</c:when>
						<c:otherwise>
							<img src="/resources/homepage/geic/img/book-noimg.jpg" alt="${i.title}" title="${i.title}"/>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<p>${i.title}</p>
		</a>
	</li>
</c:forEach>
</ul>