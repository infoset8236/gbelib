<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	$(function(){
		var _width = $(window).width();
		var _newBookList;

			var newBooks = function(){
				try {
					if( _newBookList ) _newBookList.destroySlider();
				} catch (e) {
					// TODO: handle exception
				}

				if( _width <= 380 ){
					_newBookList = $('.newbookbox ul').bxSlider({
						auto: true,
						autoHover: true,
						speed: 500,
						pager: false,
						moveSlides:1,
						maxSlides: 1,
						slideWidth: 256,
						slideMargin: 0
					});
				}
				else if( _width <= 550 && _width > 380 ){
					_newBookList = $('.newbookbox ul').bxSlider({
						auto: true,
						autoHover: true,
						speed: 500,
						pager: false,
						moveSlides:1,
						maxSlides: 1,
						slideWidth: 256,
						slideMargin: 0
					});
				}
				else if( _width <= 768 && _width > 550 ){
					_newBookList = $('.newbookbox ul').bxSlider({
						auto: true,
						autoHover: true,
						speed: 500,
						pager: false,
						moveSlides:1,
						maxSlides: 1,
						slideWidth: 256,
						slideMargin: 0
					});
				}
				else if( _width <= 1024 && _width > 768 ){
					_newBookList = $('.newbookbox ul').bxSlider({
						auto: true,
						autoHover: true,
						speed: 500,
						pager: false,
						moveSlides:1,
						maxSlides: 2,
						slideWidth: 256,
						slideMargin: 20
					});
				}
				else if( _width <= 1600 && _width > 1024 ){
					_newBookList = $('.newbookbox ul').bxSlider({
						auto: true,
						autoHover: true,
						speed: 500,
						pager: false,
						moveSlides:1,
						maxSlides: 2,
						slideWidth: 256,
						slideMargin: 10
					});
				}
				else {
					_newBookList = $('.newbookbox ul').bxSlider({
						auto: true,
						autoHover: true,
						speed: 500,
						pager: false,
						moveSlides:1,
						maxSlides: 2,
						slideWidth: 256,
						slideMargin: 20
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
<div class="newbookbox con">
	<!-- 이 안에 내용을 셀렉트박스를 선택하고 보기를 누르면 해당도서관의 신착자료 2개를 newBookUI에 새롭게 load되게 처리 -->
	<ul class="book_photo newBookUl">
		<c:forEach var="i" items="${newBookList.dsNewBookList}">
		<li>
			<a href="/${homepage.context_path}/intro/search/detail.do?vLoca=${i.LOCA}&vCtrl=${i.CTRLNO}&vImg=${i.COVER_SMALLURL }&menu_idx=12" title="도서 자세히 보기">
				<div class="book-loan">대출가능</div>
				<div class="book-thimbnail"><img src="${not empty i.COVER_SMALLURL ? i.COVER_SMALLURL : '/resources/homepage/gm/img/noimg1.png' }" alt="${i.TITLE}" title="${i.TITLE}"/></div>
				<div class="book-title">${i.TITLE}</div>
			</a>
		</li>
		</c:forEach>
	</ul>
</div>