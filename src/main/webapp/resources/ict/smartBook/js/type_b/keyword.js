const colors = ['#1773EB', '#45C4EC', '#F3666C', '#2BA675', '#7E6AA7', '#A6C944', '#FDA92B'];

$(document).ready(function() {
	for (let i = 1; i <= 12; i++) {
		let item = '.keyword_bubble_chart_item:nth-child('+i+')';

		const randomColor = colors[Math.floor(Math.random() * colors.length)];
		$(item).css('background-color', randomColor + ' !important');
	}
});

$('.change_word_wrap').click(function () {
	$('.keyword_bubble_chart_item').each(function () {
		const randomColor = colors[Math.floor(Math.random() * colors.length)];
		$(this).css('background-color', randomColor);
	});
});

$(function () {
	// 게시판
	$('.reco_tab a').click(function () {
		var tab_id = $(this).attr('data-tab');

		$('.reco_tab a').removeClass('active');
		$('.tab_content').removeClass('active');

		$(this).addClass('active');
		$('#' + tab_id).addClass('active');
	});
});

$(function () {
	// 게시판
	$('.recom_tab a').click(function () {
		var tab_id = $(this).attr('data-tab');

		$('.recom_tab a').removeClass('active');
		$('.tab_contentt').removeClass('active');

		$(this).addClass('active');
		$('#' + tab_id).addClass('active');
	});
});

$(function () {
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 1,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
});

$(function () {
    $('.person_said a').on('click', function (event) {
        event.preventDefault(); // a 태그의 기본 동작 방지
        $('.bg_rectangle').addClass('show'); // show 클래스 추가
    });
});

$(function () {
    $('#keyword_result .component_leave').on('click', function (event) {
		$('.bg_rectangle').removeClass('show');
    });
});
