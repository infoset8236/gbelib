$(function () {
	var __width = $(window).width();
	$('.newbook_main')
		.on('init', function (event, slick) {})
		.slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: false,
			fade: true,
			asNavFor: '.newbook_thumbnails',
			focusOnSelect: true,
			lazyLoad: 'ondemand',
			variableWidth: false,
			swipeToSlide: true,
			autoplay: true,
			speed: 1000,
		});

	$('.newbook_thumbnails').slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		focusOnSelect: true,
		dots: false,
		arrows: false,
		infinite: true,
		asNavFor: '.newbook_main',
		variableWidth: false,
		swipeToSlide: true,
		adaptiveHeight: true,
	});
});

$(function () {
	var __width = $(window).width();
	$('.newbook_main02')
		.on('init', function (event, slick) {})
		.slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: false,
			fade: true,
			asNavFor: '.newbook_thumbnails02',
			focusOnSelect: true,
			lazyLoad: 'ondemand',
			variableWidth: false,
			swipeToSlide: true,
			autoplay: true,
			speed: 1000,
		});

	$('.newbook_thumbnails02').slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		focusOnSelect: true,
		dots: false,
		arrows: false,
		infinite: true,
		asNavFor: '.newbook_main02',
		variableWidth: false,
		swipeToSlide: true,
		adaptiveHeight: true,
	});
});
