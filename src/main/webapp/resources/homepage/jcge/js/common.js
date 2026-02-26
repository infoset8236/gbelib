$(function(){
	
	var _width = $(window).width();
	var _bookPick;

	var Curation = function(){
		try {
			if( _bookPick ) _bookPick.destroySlider();
		} catch (e) {
			// TODO: handle exception
		}

		if(_width > 1024) 
		{
			_bookPick = $('div.bookPickList ul').bxSlider({
				auto: true,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:true,
				moveSlides:1,
				maxSlides: 4,
				slideWidth: 335,
				slideMargin: 50
			});
		}
		else if( _width <= 1024 && _width > 768 )
		{
			_bookPick = $('div.bookPickList ul').bxSlider({
				auto: true,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:true,
				moveSlides:1,
				maxSlides: 2,
				slideWidth: 305,
				slideMargin: 35
			});
		}
		else if( _width <= 768 && _width > 425 )
		{
			_bookPick = $('div.bookPickList ul').bxSlider({
				auto: true,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:true,
				moveSlides:1,
				maxSlides: 1,
				slideWidth: 305,
				slideMargin: 20
			});
		}
		else if( _width <= 425 )
		{
			_bookPick = $('div.bookPickList ul').bxSlider({
				auto: true,
				pager:false,
				controls:false,
				autoControls:false,
				autoControlsCombine:true,
				moveSlides:1,
				maxSlides: 1,
				slideWidth: 305,
				slideMargin: 20
			});
		}

		$('a.bx-prev').on('click',function(){
			if(_bookPick != null ){
				_bookPick.goToPrevSlide();
			}
			return false;
		});
		$('a.bx-next').on('click',function(){
			if(_bookPick != null){
				_bookPick.goToNextSlide();
			}
			return false;
		});
	};
	Curation();

	$(window).on('resize', function(e){
		e.preventDefault();
		_width = $(window).width();
		//console.log(_width);
		Curation();
	});

});