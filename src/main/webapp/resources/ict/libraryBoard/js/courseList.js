$(function () {
    const $slide_item = $('.slide_item');
	const itemsPerGrid = 4;

	const $slide = $('.slide');

	$slide.empty();

	const totalItems = $slide_item.length;
	const gridCount = Math.ceil(totalItems / itemsPerGrid);
	const slideItemsArray = $slide_item.toArray();

	for (let i = 0; i < gridCount; i++) {
		const $newGrid = $('<div class="grid"></div>');

		const startIndex = i * itemsPerGrid;
		const endIndex = Math.min(startIndex + itemsPerGrid, totalItems);

		for (let j = startIndex; j < endIndex; j++) {
			$newGrid.append(slideItemsArray[j]);
		}

		$slide.append($newGrid);
	}

	$('.slide').slick({
		slidesToShow: 1,
		autoplay: true,
		autoplaySpeed: 8000,
		arrows: false,
		dots: true,
		swipe: false,
		infinite: true,
	});
});