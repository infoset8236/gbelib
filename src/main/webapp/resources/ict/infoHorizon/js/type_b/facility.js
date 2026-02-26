//시설안내
$(document).ready(function () {
	$('.faci_tab a').click(function () {
		var tab_id = $(this).attr('data-tab');

		$('.faci_tab a').removeClass('active');
		$('.tab_content').removeClass('active');

		$(this).addClass('active');
		$('#' + tab_id).addClass('active');
	});
});

$(function () {
	const swiper = new Swiper('.floor_slide_01', {
		slidesPerView: 1, // 한 번에 한 슬라이드만 보이도록 설정
		spaceBetween: 10, // 슬라이드 사이의 간격 설정 (30px)
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
});

$(function () {
	const swiper = new Swiper('.floor_slide_02', {
		slidesPerView: 1, // 한 번에 한 슬라이드만 보이도록 설정
		spaceBetween: 10, // 슬라이드 사이의 간격 설정 (30px)
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
});

$(function () {
	const swiper = new Swiper('.floor_slide_03', {
		slidesPerView: 1, // 한 번에 한 슬라이드만 보이도록 설정
		spaceBetween: 10, // 슬라이드 사이의 간격 설정 (30px)
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
});
