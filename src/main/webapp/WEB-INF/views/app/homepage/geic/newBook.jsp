<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function(){
	var _width = $(window).width();
	var _newBooklist;

		var newBooks = function(){
			try {
				if( _newBooklist ) _newBooklist.destroySlider();
			} catch (e) {
				// TODO: handle exception
			}

			if( _width <= 200 ){
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 1,
					slideWidth: 120,
					slideMargin: 0
				});
			}
			else if( _width <= 1024 && _width > 960 ){
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
					auto: true,
					autoHover: true,
					speed: 500,
					pager: false,
					moveSlides:1,
					maxSlides: 1,
					slideWidth: 130,
					slideMargin: 10
				});
			}
			else if( _width <= 1330 && _width > 1200 ){
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
				_newBooklist = $('.Booklist ul').bxSlider({
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
		newBooks();
		$(window).on('resize', function(){
			_width = $(window).width();
			newBooks();
		});
});
</script>

<ul class="book-list">
<c:forEach var="i" items="${newBookList.dsNewBookList}">
	<li>								
		<a href="/${homepage.context_path}/intro/search/detail.do?vLoca=${i.LOCA}&vCtrl=${i.CTRLNO}&vImg=${i.COVER_SMALLURL }&menu_idx=208" title="도서 자세히 보기">
			<c:if test="${i.COVER_SMALLURL eq ''}">
			<div>
				<img src="/resources/common/img/bookNoImgMain2.png" alt="${i.TITLE}" title="${i.TITLE}"/>
				<span class="noimg-txt">
					<span class="noimg-title">${i.TITLE}</span>
					<span class="noimg-author">${i.AUTHOR}</span>
					<span class="noimg-publisher">${i.PUBLER}</span>
				</span>
			</div>
			<p>${i.TITLE}</p>
			</c:if>
			<c:if test="${i.COVER_SMALLURL ne ''}">
			<div><img src="${i.COVER_SMALLURL}" alt="${i.TITLE}" title="${i.TITLE}"/></div>
			<p>${i.TITLE}</p>
			</c:if>
		</a>
	</li>
</c:forEach>
</ul>