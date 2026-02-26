$(document).ready(function () {
	$('.button').on('click', function () {
		$('#popup').fadeIn();
	});

	$('.close').on('click', function () {
		$('#popup').fadeOut();
	});

	$(window).on('click', function (e) {
		if ($(e.target).is('#popup')) {
			$('#popup').fadeOut();
		}
	});
});
