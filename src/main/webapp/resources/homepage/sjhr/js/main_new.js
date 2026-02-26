$(document).ready(function(){
	pageMain.init();
	
	$('.qmenu li a').mouseover(function(){
		var onsrc = $(this).find('.image').children('img').data('onsrc');
		$(this).find('.image').children('img').attr('src',onsrc);
		$(this).find('.qtxt2').css('display','none');
		$(this).find('.qtxt1').css('color','#fff');
		$(this).find('.qtxt3').css('display','block');
	});
	$('.qmenu li a').mouseout(function(){
		var outsrc = $(this).find('.image').children('img').data('outsrc');
		$(this).find('.image').children('img').attr('src',outsrc);
		$(this).find('.qtxt2').css('display','block');
		$(this).find('.qtxt1').css('color','#333');
		$(this).find('.qtxt3').css('display','none');
	});

});

var pageMain = (function(){
	var init, mainQmenuSlider;

	init = function() {
		mainQmenuSlider();
	};

	mainQmenuSlider = function(){
		if($('#mainQmenu ul li').length >0) {
			$('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				autoControls:false,
				autoControlsCombine:false
			});
		}
	};

	return {
		init: init
	}
})();

$(function(){

	var __width = $(window).width();
	var _qmenuslider;

	var mainQmenuSlide = function(){
		try {
			if( _qmenuslider ) _qmenuslider.destroySlider();
		} catch (e) {
			// TODO: handle exception
		}

		if( __width <= 650){
			_qmenuslider = $('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:false,
				moveSlides:1,
				maxSlides: 1,
				slideWidth: 250,
				slideMargin: 10
			});
		}
		else if( __width <= 768 && __width > 650 ){
			_qmenuslider = $('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:false,
				moveSlides:1,
				maxSlides: 2,
				slideWidth: 260,
				slideMargin: 10
			});
		}
		else if( __width <= 1024 && __width > 768 ){
			_qmenuslider = $('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:false,
				moveSlides:1,
				maxSlides: 3,
				slideWidth: 260,
				slideMargin: 20
			});
		}
		else if( __width <= 1260 && __width > 1024 ){
			_qmenuslider = $('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:false,
				moveSlides:1,
				maxSlides: 4,
				slideWidth: 270,
				slideMargin: 20
			});
		}
		else if( __width <= 1450 && __width > 1260 ){
			_qmenuslider = $('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:false,
				moveSlides:1,
				maxSlides: 5,
				slideWidth: 270,
				slideMargin: 20
			});
		}
		else
		{
			_qmenuslider = $('#mainQmenu ul').bxSlider({
				auto: false,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:false,
				moveSlides:1,
				maxSlides: 5,
				slideWidth: 270,
				slideMargin: 25
			});
		}

	};

	mainQmenuSlide();

	$(window).on('resize', function(){
		__width = $(window).width();
		mainQmenuSlide();
		$('.bx-wrapper').css('margin','0 auto');
		$('.bx-controls-auto').css('display','none');
	});
});