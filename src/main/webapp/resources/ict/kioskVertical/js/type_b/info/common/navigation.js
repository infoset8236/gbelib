$(document).ready(function () {
	function toggleActiveMenu(clickedItem) {
		$('.navigation li').each(function () {
			$(this).find('.active_menu').removeClass('active_menu').addClass('menu');
			$(this).find('span').removeClass('active_caption');

			$(this)
				.find('img.item')
				.attr('src', function (index, src) {
					return src.includes('active_') ? src.replace('active_', '') : src;
				});
		});

		clickedItem.find('.menu').removeClass('menu').addClass('active_menu');
		clickedItem.find('span').addClass('active_caption');

		clickedItem.find('img.item').attr('src', function (index, src) {
			return !src.includes('active_') ? src.replace(/^(.*\/)(.*)$/, '$1active_$2') : src;
		});
	}

	$('.navigation li').on('click', function () {
		toggleActiveMenu($(this));
	});
});
