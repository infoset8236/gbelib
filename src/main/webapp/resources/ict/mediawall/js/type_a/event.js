$(function () {
	const swiper = new Swiper('.event_slider', {
		loop: true, // 무한 반복
		slidesPerView: 1, // 항상 4개의 슬라이드 표시
		loopedSlides: 1, // 최소 4개의 슬라이드가 보이도록 설정
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		speed: 15000,
		autoplay: {
			delay: 0,
		},
	});
});
