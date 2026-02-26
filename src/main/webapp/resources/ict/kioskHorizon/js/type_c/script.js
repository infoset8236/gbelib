$(document).ready(function () {
	function updateDateTime() {
		const now = new Date();

		const hours = String(now.getHours()).padStart(2, '0');
		const minutes = String(now.getMinutes()).padStart(2, '0');
		const formattedTime = `${hours}:${minutes}`;

		const year = now.getFullYear();
		const month = String(now.getMonth() + 1).padStart(2, '0');
		const date = String(now.getDate()).padStart(2, '0');
		const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
		const dayName = daysOfWeek[now.getDay()];
		const formattedDate = `${year}. ${month}. ${date}. ${dayName}`;
		const dateString = `${year}년 ${month}월 ${date}일(${dayName})`;

		$('.media_common_header_time').text(formattedTime);
		$('.media_common_header_date').text(formattedDate);
		$('.media_promotion_date').text(dateString);
		$('.media_promotion_time').text(formattedTime);
		$('.kiosk_main_time').text(formattedTime);
		$('.kiosk_main_date').text(formattedDate + '요일');
		$('.kiosk_main_time_x').text(formattedTime);
		$('.kiosk_main_date_x').text(formattedDate + '요일');
	}

	updateDateTime();
	setInterval(updateDateTime, 60000);

	function updateClock() {
		const now = new Date();
		const seconds = now.getSeconds();
		const minutes = now.getMinutes();
		const hours = now.getHours();

		const $secondHand = $('.media_promotion_clock_second');
		const $minuteHand = $('.media_promotion_clock_minute');
		const $hourHand = $('.media_promotion_clock_hour');

		const secondsDegrees = (seconds / 60) * 360 + 90;
		const minutesDegrees = (minutes / 60) * 360 + (seconds / 60) * 6 + 90;
		const hoursDegrees = (hours / 12) * 360 + (minutes / 60) * 30 + 90;

		$secondHand.css('transform', `rotate(${secondsDegrees}deg)`);
		$minuteHand.css('transform', `rotate(${minutesDegrees}deg)`);
		$hourHand.css('transform', `rotate(${hoursDegrees}deg)`);
	}

	setInterval(updateClock, 1000);
});

const weathers = [
	'thunderstorm with light rain',
	'thunderstorm with rain',
	'thunderstorm with heavy rain',
	'light thunderstorm',
	'thunderstorm',
	'heavy thunderstorm',
	'ragged thunderstorm',
	'thunderstorm with light drizzle',
	'thunderstorm with drizzle',
	'thunderstorm with heavy drizzle',
	'light intensity drizzle',
	'drizzle',
	'heavy intensity drizzle',
	'light intensity drizzle rain',
	'drizzle rain',
	'heavy intensity drizzle rain',
	'shower rain and drizzle',
	'heavy shower rain and drizzle',
	'shower drizzle',
	'light rain',
	'moderate rain',
	'heavy intensity rain',
	'very heavy rain',
	'extreme rain',
	'freezing rain',
	'light intensity shower rain',
	'shower rain',
	'heavy intensity shower rain',
	'ragged shower rain',
	'light snow',
	'snow',
	'heavy snow',
	'sleet',
	'light shower sleet',
	'shower sleet',
	'light rain and snow',
	'rain and snow',
	'light shower snow',
	'shower snow',
	'heavy shower snow',
	'mist',
	'smoke',
	'haze',
	'sand/dust whirls',
	'fog',
	'sand',
	'dust',
	'volcanic ash',
	'squalls',
	'tornado',
	'clear sky',
	'few clouds',
	'scattered clouds',
	'broken clouds',
	'overcast clouds',
];

const weatherskor = [
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'뇌우',
	'이슬비',
	'이슬비',
	'이슬비',
	'이슬비',
	'이슬비',
	'이슬비',
	'이슬비',
	'이슬비',
	'비 약간',
	'적당한 비',
	'비 많이',
	'비 많이',
	'폭우',
	'우박',
	'소나기 약간',
	'소나기',
	'폭우 수준의 소나기',
	'오락가락한 소나기',
	'눈 약간',
	'눈',
	'폭설',
	'진눈째비',
	'약간의 진눈깨비',
	'갑자기 진눈깨비',
	'약간의 비와 눈',
	'비와 눈',
	'갑자기 약간 눈',
	'갑자기 눈',
	'폭설',
	'안개',
	'연기',
	'안개',
	'모래/먼지 소용돌이',
	'모래',
	'모래',
	'먼지',
	'화산재',
	'돌풍',
	'토네이도',
	'맑음',
	'구름 약간',
	'약간 흐림',
	'흐림 구름',
	'구름 많음',
	'흐림',
];

$.ajax({
	url: 'https://api.openweathermap.org/data/2.5/forecast?q=Gumi&appid=3bcf7eca7fc5d5df252135e43043a0a7&units=metric',
	dataType: 'json',
	type: 'GET',
	success: function (data) {
		const weatherDescription = data.list[0].weather[0].description;
		const weatherIndex = weathers.indexOf(weatherDescription);
		const kor = weatherIndex >= 0 ? weatherskor[weatherIndex] : '';

		const iconCode = data.list[0].weather[0].icon.split('@')[0];
		const iconUrl = `/resources/ict/img/${iconCode}.png`;

		$('.media_promotion_feels_like').text(`체감 ${parseFloat(data.list[0].main.feels_like.toFixed(1))}°`);
		$('.media_promotion_weather_icon').attr('src', iconUrl);
		$('.media_promotion_temp').text(`${parseFloat(data.list[0].main.temp.toFixed(1))}°`);
		$('.media_promotion_weather_description').text(kor);
	},
});

$(document).ready(function () {
	const wiseSayings = [
		{
			text: '그림 안의 시간은 한순간에 얼어붙었다기보다 흘러들어 고인 느낌이다.',
			commentary: '‘나는 메트로폴리탄 미술관의 경비원입니다’ 중에서',
		},
		{
			text: '때론 내리는 비를 막아주는 사람보다 함께 비를 맞아주는 사람이 더 위로가 된다.',
			commentary: '‘뜻밖의 위로’ 중에서',
		},
		{
			text: '내가 나도 모르게 오랫동안 했던 일이, 사실은 어떤 미래를 위한 연습이었다면?',
			commentary: '‘너의 목소리가 세상에 울려 퍼지도록’ 중에서',
		},
		{
			text: '내가 어떤 순간에 의미를 부여하면 나의 삶은 의미 있는 순간의 합이 되는 것입니다.',
			commentary: '‘여덟 단어’ 중에서',
		},
		{
			text: '우리는 인생의 날들을 늘릴 수는 없지만, 그 날들에 생기를 불어넣을 수는 있다.',
			commentary: '‘당신의 완벽한 1년’ 중에서',
		},
		{
			text: '인간은 가장 깊은 절망의 순간에서조차 아름다움의 법칙에 따라 자신의 삶을 작곡한다.',
			commentary: '‘참을 수 없는 존재의 가벼움’ 중에서',
		},
		{
			text: '사람이 사람에게 줄 수 있는 최고의 감동은 한결같은 마음이다.',
			commentary: '‘너에게 하고 싶은 말’ 중에서',
		},
		{
			text: '변하지 않아 아름다운 것이 아니라, 아름다운 것이 변함없을 때 비로소 소중해지는 것이다.',
			commentary: '‘좋은 사람에게만 좋은 사람이면 돼’ 중에서',
		},
		{
			text: '계속 반복할 수 있는 기회가 있다면 어떨까? 결국 옳게 해낼 때까지 말이야.',
			commentary: '‘라이프 애프터 라이프’ 중에서',
		},
		{
			text: '사람이 살아가려면 모른척해야 하는 일도 있는 거야. 그래야 계속 살지.',
			commentary: '‘이처럼 사소한 것들’ 중에서',
		},
		{
			text: '내일은 좀 더 좋은 추억을 만들어 주려고 했어.',
			commentary: '‘녹나무의 여신’ 중에서',
		},
		{
			text: '당장 가자. 바다를 보러.',
			commentary: '‘파도의 아이들’ 중에서',
		},
		{
			text: '"난 또 그렇게 할 거야" 개스퍼리가 말했다. "망설이지도 않을 거야"',
			commentary: '‘고요의 바다에서’ 중에서',
		},
	];

	let index = 0;

	function animateTitleText(text) {
		$('.media_line_title').empty();

		$.each(text.split(''), function (i, char) {
			const span = $('<span>').text(char).css({
				opacity: 0,
				transition: 'opacity 1s ease',
			});
			$('.media_line_title').append(span);

			setTimeout(function () {
				span.css('opacity', 1);
			}, i * 100);
		});
	}

	function updateWiseSaying() {
		animateTitleText(wiseSayings[index].text);
		$('.media_line_caption').text(wiseSayings[index].commentary);

		index = (index + 1) % wiseSayings.length;
	}

	updateWiseSaying();
	setInterval(updateWiseSaying, 10000);
});

$(function () {
	const mediaNoticeSwiper = new Swiper('.media_notice_slider', {
		speed: 10000,
		loop: true,
		slidesPerView: 1,
		effect: 'fade',
		fadeEffect: {
			crossFade: true,
		},
		autoplay: {
			delay: 10000,
		},
	});
});

$(function () {
	const mediaNoticeListSwiper = new Swiper('.media_notice_slider_list', {
		speed: 10000,
		loop: true,
		slidesPerView: 4,
		autoplay: {
			delay: 10000,
		},
	});
});

$(function () {
	const mediaEventSwiper = new Swiper('.media_event_slider', {
		speed: 600,
		loop: true,
		effect: 'fade',
		fadeEffect: {
			crossFade: true,
		},
		slidesPerView: 1,
		autoplay: {
			delay: 10000,
			disableOnInteraction: false,
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
		},
	});
});

$(document).ready(function () {
	const $slideImages = $('.kiosk_notice_swiper .swiper-slide img');

	function updateSelectedImage($selectedImg) {
		const selectedImgSrc = $selectedImg.attr('src');

		$('.kiosk_notice_selected_item').attr('src', selectedImgSrc);

		$slideImages.css('border', 'none');
		$selectedImg.css('border', '3px solid #000');
	}

	updateSelectedImage($slideImages.first());

	$slideImages.on('click', function () {
		updateSelectedImage($(this));
	});
});

$(document).ready(function () {
	function setupNavigationBar(itemClass, activeClass) {
		const items = $(`.${itemClass}`);
		items.first().addClass(activeClass);

		items.click(function () {
			items.removeClass(activeClass);
			$(this).addClass(activeClass);
		});
	}

	setupNavigationBar('kiosk_common_navigation_bar_item', 'active');
	setupNavigationBar('kiosk_common_navigation_bar_item_x', 'active_x');
});

$(document).ready(function () {
	function setupFiltering(buttonClass, wrapperClass, floorNameClass) {
		$(`.${buttonClass}:nth-child(2)`).addClass('active');
		$(`.${buttonClass}`).on('click', function () {
			$(`.${buttonClass}`).removeClass('active');
			$(this).addClass('active');

			const floor = $(this).text();

			$(`.${wrapperClass} .${floorNameClass}`).css('animation', 'none');
			$(`.${wrapperClass} img`).attr('src', `/resources/ict/img/map${floor}.png`);

			setTimeout(function () {
				$(`.${wrapperClass} .${floorNameClass}`).text(floor).css('animation', 'moveUp 0.5s ease-out forwards');
			}, 10);
		});
	}

	setupFiltering('kiosk_filtering_btn', 'kiosk_facility_map_wrapper', 'floor_name');
	setupFiltering('kiosk_filtering_btn_x', 'kiosk_facility_map_wrapper_x', 'floor_name_x');
});

$(document).ready(function () {
	function setupPopup(swiperClass, popupClass, closeClass) {
		$(`.${swiperClass} .swiper-item`).click(function () {
			$(`.${popupClass}`).fadeIn();
		});

		$(`.${closeClass}`).click(function () {
			$(`.${popupClass}`).fadeOut();
		});

		$(`.${popupClass}`).click(function (e) {
			if ($(e.target).hasClass(popupClass)) {
				$(this).fadeOut();
			}
		});
	}

	setupPopup('kiosk_facility_swiper', 'kiosk_facility_popup', 'kiosk_facility_popup_close');
	setupPopup('kiosk_facility_swiper_wrapper', 'kiosk_facility_popup_x', 'kiosk_facility_popup_close_x');
});

// 키오스크 슬라이드
$(document).ready(function () {
	function kioskNoticeSwiper() {
		const kioskNoticeSwiper = new Swiper('.kiosk_notice_swiper', {
			speed: 600,
			slidesPerGroup: 5,
			slidesPerView: 5,
			spaceBetween: 45,
			breakpoints: {
				1080: {
					spaceBetween: 22.5,
				},
			},
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
			},
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			loop: true,
		});
	}

	kioskNoticeSwiper();

	function KioskNoticeXSwiper() {
		const swiper = new Swiper('.kiosk_notice_swiper_box .swiper', {
			slidesPerGroup: 3,
			slidesPerView: 3,
			spaceBetween: 60,
			breakpoints: {
				1920: {
					spaceBetween: 30,
				},
			},
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			loop: true,
			navigation: {
				nextEl: '.kiosk_notice_swiper_box .swiper-button-next',
				prevEl: '.kiosk_notice_swiper_box .swiper-button-prev',
			},
		});
	}

	KioskNoticeXSwiper();

	function facilityXSwiper() {
		const swiper = new Swiper('.kiosk_facility_swiper_wrapper .swiper', {
			loop: true,
			slidesPerView: 2,
			slidesPerColumn: 3,
			grid: {
				rows: 3,
			},
			slidesPerGroup: 2,
			spaceBetween: 40,
			breakpoints: {
				1920: {
					spaceBetween: 20,
				},
			},
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			pagination: {
				el: '.kiosk_facility_swiper_wrapper .swiper-pagination',
			},
			navigation: {
				nextEl: '.kiosk_facility_swiper_wrapper .swiper-button-next',
				prevEl: '.kiosk_facility_swiper_wrapper .swiper-button-prev',
			},
		});
	}

	facilityXSwiper();

	function facilitySwiper() {
		const swiper = new Swiper('.kiosk_facility_swiper .swiper', {
			loop: true,
			slidesPerView: 2,
			slidesPerColumn: 3,
			grid: {
				rows: 3,
			},
			breakpoints: {
				1080: {
					spaceBetween: 30,
				},
				2160: {
					spaceBetween: 140,
				},
			},
			slidesPerGroup: 2,
			spaceBetween: 60,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			navigation: {
				nextEl: '.kiosk_facility_swiper .swiper-button-next',
				prevEl: '.kiosk_facility_swiper .swiper-button-prev',
			},
		});
	}

	facilitySwiper();

	function kioskNewBookSwiper() {
		const swiper = new Swiper('.kiosk_new_book_swiper .swiper', {
			loop: true,
			slidesPerView: 3,
			slidesPerColumn: 3,
			grid: {
				rows: 3,
			},
			breakpoints: {
				2160: {
					spaceBetween: 190,
				},
				1080: {
					spaceBetween: 95,
				},
			},
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerGroup: 3,
			pagination: {
				el: '.kiosk_new_book_swiper .swiper-pagination',
			},
		});
	}

	kioskNewBookSwiper();

	function kioskNewBookXSwiper() {
		const swiper = new Swiper('.kiosk_new_book_swiper_x .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerView: 5,
			slidesPerColumn: 5,
			grid: {
				rows: 2,
			},
			breakpoints: {
				2160: {
					spaceBetween: 140,
				},
				1080: {
					spaceBetween: 70,
				},
			},
			navigation: {
				nextEl: '.kiosk_new_book_swiper_x .swiper-button-next',
				prevEl: '.kiosk_new_book_swiper_x .swiper-button-prev',
			},
		});
	}

	kioskNewBookXSwiper();

	function kioskBestBookSwiper() {
		const swiper = new Swiper('.kiosk_best_book_swiper .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerView: 1,
			slidesPerColumn: 1,
			grid: {
				rows: 5,
			},
			breakpoints: {
				3840: {
					spaceBetween: 128,
				},
				1080: {
					spaceBetween: 64,
				},
			},
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
			},
		});
	}

	kioskBestBookSwiper();

	function kioskBookInformationWSwiper() {
		const swiper = new Swiper('.kiosk_book_information_swiper .swiper', {
			loop: true,
			slidesPerView: 5,
			slidesPerGroup: 5,
			breakpoints: {
				2160: {
					spaceBetween: 100,
				},
				1080: {
					spaceBetween: 50,
				},
			},
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			navigation: {
				nextEl: '.kiosk_book_information_swiper .swiper-button-next',
				prevEl: '.kiosk_book_information_swiper .swiper-button-prev',
			},
		});
	}

	kioskBookInformationWSwiper();

	function kioskBookInformationXWSwiper() {
		const swiper = new Swiper('.kiosk_book_information_swiper_x .swiper', {
			loop: true,
			slidesPerView: 5,
			slidesPerGroup: 5,
			breakpoints: {
				2160: {
					spaceBetween: 100,
				},
				1080: {
					spaceBetween: 50,
				},
			},
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			navigation: {
				nextEl: '.kiosk_book_information_swiper_x .swiper-button-next',
				prevEl: '.kiosk_book_information_swiper_x .swiper-button-prev',
			},
		});
	}

	kioskBookInformationXWSwiper();

	function kioskCourseInformationSwiper() {
		const swiper = new Swiper('.kiosk_course_information_swiper .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			spaceBetween: 10,
			slidesPerView: 1,
			slidesPerColumn: 1,
			grid: {
				rows: 7,
			},
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
			},
		});
	}

	kioskCourseInformationSwiper();

	function kioskCourseInformationXSwiper() {
		const kioskCourseInformationXSwiper = new Swiper('.kiosk_course_information_swiper_x .swiper', {
			speed: 600,
			loop: true,
			slidesPerView: 1,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerColumn: 1,
			grid: {
				rows: 5,
			},
			breakpoints: {
				2160: {
					spaceBetween: 24,
				},
				1080: {
					spaceBetween: 12,
				},
			},
			navigation: {
				nextEl: '.kiosk_course_information_swiper_x .swiper-button-next',
				prevEl: '.kiosk_course_information_swiper_x .swiper-button-prev',
			},
		});
	}

	kioskCourseInformationXSwiper();
});

$(document).ready(function () {
	function setupPopup(triggerClass, popupClass, closeClass) {
		$(`.${triggerClass}`).click(function () {
			$(`.${popupClass}`).fadeIn();
		});

		$(`.${closeClass}`).click(function () {
			$(`.${popupClass}`).fadeOut();
		});

		$(`.${popupClass}`).click(function (e) {
			if ($(e.target).hasClass(popupClass)) {
				$(this).fadeOut();
			}
		});
	}

	setupPopup('kiosk_book_information_popup_trigger', 'kiosk_book_information_popup', 'kiosk_book_information_popup_close');
	setupPopup('kiosk_book_information_popup_trigger_x', 'kiosk_book_information_popup_x', 'kiosk_book_information_popup_close_x');
});

$(document).ready(function () {
	$('.kiosk_course_registration_gender_btn').on('click', function () {
		$('.kiosk_course_registration_gender_btn').removeClass('active');
		$(this).addClass('active');
	});
});

$(document).ready(function () {
	const currentYear = new Date().getFullYear();
	const $yearSelect = $('.birth_year');
	for (let year = 1900; year <= currentYear; year++) {
		$yearSelect.append(new Option(year, year));
	}

	const $monthSelect = $('.birth_month');
	for (let month = 1; month <= 12; month++) {
		const monthValue = month < 10 ? '0' + month : month;
		$monthSelect.append(new Option(monthValue, monthValue));
	}

	const $daySelect = $('.birth_day');
	for (let day = 1; day <= 31; day++) {
		const dayValue = day < 10 ? '0' + day : day;
		$daySelect.append(new Option(dayValue, dayValue));
	}
});

$(document).ready(function () {
	$('#sms-agree').click(function () {
		$('#sms-agree .kiosk_course_registration_check_radio').removeClass('unchecked').addClass('checked');
		$('#sms-disagree .kiosk_course_registration_check_radio').removeClass('checked').addClass('unchecked');
	});

	$('#sms-disagree').click(function () {
		$('#sms-disagree .kiosk_course_registration_check_radio').removeClass('unchecked').addClass('checked');
		$('#sms-agree .kiosk_course_registration_check_radio').removeClass('checked').addClass('unchecked');
	});

	$('#photo-agree').click(function () {
		$('#photo-agree .kiosk_course_registration_check_radio').removeClass('unchecked').addClass('checked');
		$('#photo-disagree .kiosk_course_registration_check_radio').removeClass('checked').addClass('unchecked');
	});

	$('#photo-disagree').click(function () {
		$('#photo-disagree .kiosk_course_registration_check_radio').removeClass('unchecked').addClass('checked');
		$('#photo-agree .kiosk_course_registration_check_radio').removeClass('checked').addClass('unchecked');
	});
});

$(document).ready(function () {
	$('#sms-agree').click(function () {
		$('#sms-agree .kiosk_course_registration_check_radio_x').removeClass('unchecked').addClass('checked');
		$('#sms-disagree .kiosk_course_registration_check_radio_x').removeClass('checked').addClass('unchecked');
	});

	$('#sms-disagree').click(function () {
		$('#sms-disagree .kiosk_course_registration_check_radio_x').removeClass('unchecked').addClass('checked');
		$('#sms-agree .kiosk_course_registration_check_radio_x').removeClass('checked').addClass('unchecked');
	});

	$('#photo-agree').click(function () {
		$('#photo-agree .kiosk_course_registration_check_radio_x').removeClass('unchecked').addClass('checked');
		$('#photo-disagree .kiosk_course_registration_check_radio_x').removeClass('checked').addClass('unchecked');
	});

	$('#photo-disagree').click(function () {
		$('#photo-disagree .kiosk_course_registration_check_radio_x').removeClass('unchecked').addClass('checked');
		$('#photo-agree .kiosk_course_registration_check_radio_x').removeClass('checked').addClass('unchecked');
	});
});
