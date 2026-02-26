$(document).ready(function () {
	var swiper = new Swiper('.swiper-container', {
		direction: 'vertical',
		loop: true,
		slidesPerView: 1,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});

	var initialFloor = '1F';
	$('.selected_floors').text(initialFloor);

	$('.map img').attr('src', '/resources/ict/kioskHorizon/img/type_a/facility/map_1F.png');

	setTimeout(() => {
		$('.selected_floors').addClass('show');
	}, 10);
s
	$('.floors.selected img').attr('src', '/resources/ict/kioskHorizon/img/type_a/facility/yellow_divider.svg');

	$('.floors').on('click', function () {
		var selectedFloor = $(this).children('div').text();

		var mapImageSrc = '';
		if (selectedFloor === '1F') {
			mapImageSrc = '/resources/ict/kioskHorizon/img/type_a/facility/map_1F.png';
		} else if (selectedFloor === '2F') {
			mapImageSrc = '/resources/ict/kioskHorizon/img/type_a/facility/map_2F.svg';
		} else if (selectedFloor === '3F') {
			mapImageSrc = '/resources/ict/kioskHorizon/img/type_a/facility/map_3F.svg';
		}

		$('.map img').attr('src', mapImageSrc);
	
		$('.selected_floors').removeClass('show');
		setTimeout(() => {
			$('.selected_floors').text(selectedFloor).addClass('show');
		}, 100);

		$('.floors').removeClass('selected');
		$('.floors img').attr('src', '/resources/ict/kioskHorizon/img/type_a/facility/divider.svg');

		$(this).addClass('selected');
		$(this).find('img').attr('src', '/resources/ict/kioskHorizon/img/type_a/facility/yellow_divider.svg');
	});
});

$(document).ready(function () {
	$('.slide-item').click(function () {
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