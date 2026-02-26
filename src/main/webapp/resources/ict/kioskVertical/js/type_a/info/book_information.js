//도서정보
$(function () {
	var swiperThumbs = new Swiper('.thumbnail-slider', {
		loop: true,
		spaceBetween: 10,
		slidesPerView: 6,
		freeMode: true,
		watchSlidesProgress: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});

	var swiperMain = new Swiper('.main-slider', {
		spaceBetween: 10,
		effect: 'fade',
		fadeEffect: {
			crossFade: true,
		},
		thumbs: {
			swiper: swiperThumbs,
		},
	});
});
