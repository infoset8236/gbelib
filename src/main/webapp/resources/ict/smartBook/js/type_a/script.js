$(window).on('load', function () {
	const $navigationMenus = $('.common_navigation_menu');

	$navigationMenus.removeClass('common_navigation_menu_active').first().addClass('common_navigation_menu_active');

	$navigationMenus.on('click', function () {
		$navigationMenus.removeClass('common_navigation_menu_active');
		$(this).addClass('common_navigation_menu_active');
	});

	$('.bigdata_filtering_list_item')
		.on('click', function () {
			$(this).addClass('bigdata_filtering_list_item_active').siblings().removeClass('bigdata_filtering_list_item_active');
		})
		.first()
		/*.click();*/

	$('.information_popup_trigger').on('click', function () {
		$('.information_popup_overlay').fadeIn();
	});

	$('.information_popup_close, .information_popup_overlay').on('click', function (e) {
		if ($(e.target).closest('.information_popup_wrapper').length === 0 || $(e.target).is('.information_popup_close')) {
			$('.information_popup_overlay').fadeOut();
		}
	});
});

$(document).ready(function () {
	$('.main_search_filtering_list_item').first().addClass('active');
	$('.main_search_filtering_list_item').on('click', function () {
		$('.main_search_filtering_list_item').removeClass('active');
		$(this).addClass('active');
	});
});

$(function () {
	let slidesPerPage = calculateSlidesPerPage(); // 초기 slidesPerPage 설정
	const totalSlides = $('.keyword_result_swiper .swiper-slide').length;
	let totalPages = Math.ceil(totalSlides / slidesPerPage); // 초기 totalPages 계산

	const keywordResultSwiper = new Swiper('.keyword_result_swiper .swiper', {
		pagination: {
			el: '.keyword_result_swiper .swiper-pagination',
			type: 'fraction',
			renderFraction: function (currentClass, totalClass) {
				return '<span class="' + currentClass + '"></span>' + ' / ' + totalPages;
			},
		},
		loopAddBlankSlides: true,
		// loop: true,
		breakpoints: {
			3840: {
				slidesPerGroup: 5,
				slidesPerView: 5,
				spaceBetween: 300,
				grid: {
					rows: 2,
				},
			},
			1920: {
				slidesPerGroup: 5,
				slidesPerView: 5,
				spaceBetween: 130,
				grid: {
					rows: 2,
				},
			},
			1080: {
				slidesPerGroup: 3,
				slidesPerView: 3,
				spaceBetween: 80,
				grid: {
					rows: 3,
				},
			},
			2160: {
				slidesPerGroup: 3,
				slidesPerView: 3,
				spaceBetween: 190,
				grid: {
					rows: 3,
				},
			},
		},
		navigation: {
			nextEl: '.keyword_result_swiper .swiper-button-next',
			prevEl: '.keyword_result_swiper .swiper-button-prev',
		},
	});

	function calculateSlidesPerPage() {
		const width = window.innerWidth;

		if (width === 3840) {
			return 10;
		} else if (width === 1920) {
			return 10;
		} else {
			return 9;
		}
	}

	function updatePagination() {
		slidesPerPage = calculateSlidesPerPage();
		totalPages = Math.ceil(totalSlides / slidesPerPage);
		keywordResultSwiper.pagination.update();
	}

	$(window).on('resize', function () {
		updatePagination();
	});
});

$(function () {
	let slidesPerPage = calculateSlidesPerPage(); // 초기 slidesPerPage 설정
	const totalSlides = $('.common_four_by_four .swiper-slide').length;
	let totalPages = Math.ceil(totalSlides / slidesPerPage); // 초기 totalPages

	const fourByFourSwiper = new Swiper('.common_four_by_four .swiper', {
		speed: 600,
		pagination: {
			el: '.common_four_by_four .swiper-pagination',
			type: 'fraction',
			renderFraction: function (currentClass, totalClass) {
				return '<span class="' + currentClass + '"></span>' + ' / ' + totalPages;
			},
		},
		loopAddBlankSlides: true,
		breakpoints: {
			3840: {
				slidesPerGroup: 5,
				slidesPerView: 5,
				spaceBetween: 200,
			},
			1920: {
				slidesPerGroup: 5,
				slidesPerView: 5,
				spaceBetween: 100,
			},
			1080: {
				slidesPerGroup: 4,
				slidesPerView: 4,
				spaceBetween: 25,
				grid: {
					rows: 3,
				},
			},
			2160: {
				slidesPerGroup: 4,
				slidesPerView: 4,
				spaceBetween: 50,
				grid: {
					rows: 3,
				},
			},
		},
		navigation: {
			nextEl: '.common_four_by_four .swiper-button-next',
			prevEl: '.common_four_by_four .swiper-button-prev',
		},
	});

	function calculateSlidesPerPage() {
		const width = window.innerWidth;

		if (width === 3840) {
			return 5;
		} else if (width === 1920) {
			return 5;
		} else {
			return 12;
		}
	}

	function updatePagination() {
		slidesPerPage = calculateSlidesPerPage();
		totalPages = Math.ceil(totalSlides / slidesPerPage);
		fourByFourSwiper.pagination.update();
	}

	$(window).on('resize', function () {
		updatePagination();
	});
});

$(function () {
	let slidesPerPage = calculateSlidesPerPage();
	const totalSlides = $('.bigdata_swiper .swiper-slide').length;
	let totalPages = Math.ceil(totalSlides / slidesPerPage);

	const bigDataSwiper = new Swiper('.bigdata_swiper .swiper', {
		speed: 600,
		pagination: {
			el: '.bigdata_swiper .swiper-pagination',
			type: 'fraction',
			renderFraction: function (currentClass, totalClass) {
				return '<span class="' + currentClass + '"></span>' + ' / ' + totalPages;
			},
		},
		loopAddBlankSlides: true,
		breakpoints: {
			3840: {
				slidesPerGroup: 5,
				slidesPerView: 5,
				spaceBetween: 200,
			},
			1920: {
				slidesPerGroup: 5,
				slidesPerView: 5,
				spaceBetween: 100,
			},
			1080: {
				slidesPerGroup: 3,
				slidesPerView: 3,
				spaceBetween: 100,
				grid: {
					rows: 2,
				},
			},
			2160: {
				slidesPerGroup: 3,
				slidesPerView: 3,
				spaceBetween: 200,
				grid: {
					rows: 2,
				},
			},
		},
		navigation: {
			nextEl: '.bigdata_swiper .swiper-button-next',
			prevEl: '.bigdata_swiper .swiper-button-prev',
		},
	});

	function calculateSlidesPerPage() {
		const width = window.innerWidth;

		if (width === 3840) {
			return 5;
		} else if (width === 1920) {
			return 5;
		} else {
			return 12;
		}
	}

	function updatePagination() {
		slidesPerPage = calculateSlidesPerPage();
		totalPages = Math.ceil(totalSlides / slidesPerPage);
		bigDataSwiper.pagination.update();
	}

	$(window).on('resize', function () {
		updatePagination();
	});
});

$(function () {
	const informationSwiper = new Swiper('.information_swiper .swiper', {
		speed: 600,
		loop: true,
		slidesPerView: 5,
		slidesPerGroup: 5,
		navigation: {
			nextEl: '.information_swiper .swiper-button-next',
			prevEl: '.information_swiper .swiper-button-prev',
		},
		breakpoints: {
			3840: {
				spaceBetween: 125,
			},
			1920: {
				spaceBetween: 62.5,
			},
			1080: {
				spaceBetween: 62.5,
			},
			2160: {
				spaceBetween: 125,
			},
		},
	});
});

$(function () {
	const kioskNoticeXSwiper = new Swiper('.search_swiper', {
		speed: 600,
		direction: 'vertical',
		loop: true,
		spaceBetween: 0,
		slidesPerGroup: 6,
		slidesPerView: 6,
		navigation: {
			nextEl: '.search_swiper .swiper-button-next',
			prevEl: '.search_swiper .swiper-button-prev',
		},
		fadeEffect: {
			crossFade: true,
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'fraction',
		},
	});
});

$(document).ready(function () {
	$('.search_action_btn').click(function () {
		const $table = $(this).closest('.search-item_wrapper').find('.search_table');

		const screenWidth = window.innerWidth;

		let marginTopValue = '20px';
		if (screenWidth === 1080 || screenWidth === 1920) {
			marginTopValue = '10px';
		}

		if ($table.hasClass('active')) {
			$table.removeClass('active');
			setTimeout(() => {
				$table.css('margin-top', '');
			}, 300);
		} else {
			$table.addClass('active');
			$table.css('margin-top', marginTopValue);
		}
	});
});
