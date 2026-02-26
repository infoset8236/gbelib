$(function () {
	var thumbsSwiper = new Swiper('.notice-slide-thumbs', {
		slidesPerView: 5,
		freeMode: true,
		watchSlidesProgress: true,
		loop: true,
		speed: 10000,
		autoplay: {
			delay: 0,
		},
		
	});

	var mainSwiper = new Swiper('.notice-slide', {
		spaceBetween: 10,
		thumbs: {
			swiper: thumbsSwiper,
		},
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		speed: 10000,
		autoplay: {
			delay: 0,
		},
	});
});
