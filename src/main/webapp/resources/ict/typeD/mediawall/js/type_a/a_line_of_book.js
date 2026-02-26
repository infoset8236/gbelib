function animate() {
	const $container = $('.li_book_tit');
	const text = $container.text().trim(); // 공백 제거
	const $elements = text.split('').map(s => $(`<span>${s}</span>`));

	$container.empty().append($elements); // 기존 텍스트 제거 후 span 추가
	$container.css('position', 'relative'); // 필요 시 position 설정

	$elements.forEach(function ($el, i) {
		$el.css({
			position: 'relative', // top 애니메이션을 위해 필요
			top: '-100px',
			opacity: 0,
		});

		setTimeout(() => {
			$el.css(
				{
					top: '0px',
					opacity: 1,
				},
				800, // 애니메이션 시간
				'easeOutExpo'
			);
		}, 100 * i); // 각 문자에 순차적으로 지연 시간 적용
	});
}
