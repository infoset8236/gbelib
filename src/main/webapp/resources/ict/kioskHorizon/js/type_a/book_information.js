$(document).ready(function () {
	var swiper = new Swiper('.swiper-container', {
		loop: true,
		slidesPerView: 1,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
});

$(document).ready(function () {
	$('.location').click(function () {
		$('#modal').fadeIn(300);
	});

	$('.close').click(function () {
		$('#modal').fadeOut(300);
	});

	$(window).click(function (event) {
		if ($(event.target).is('#modal')) {
			$('#modal').fadeOut(300);
		}
	});
});
