$(function () {
	const swiper = new Swiper('.notice_slider', {
		loop: true, // 무한 반복
		slidesPerView: 4, // 항상 4개의 슬라이드 표시
		loopedSlides: 4, // 최소 4개의 슬라이드가 보이도록 설정
		speed: 58000,
		autoplay: {
			delay: 0,
		},
	});
});