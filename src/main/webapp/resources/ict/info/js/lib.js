$(document).ready(function () {
	const groupSize = 9;

	$('.l_books_swiper').each(function () {
		const $tab = $(this);
		const $lists = $tab.find('.slide-item');
		const $swiperWrapper = $tab.find('.swiper-wrapper');

		$lists.hide();

		for (let i = 0; i < $lists.length; i += groupSize) {
			const $swiperSlide = $('<div class="swiper-slide"></div>');

			$lists.slice(i, i + groupSize).each(function () {
				$swiperSlide.append($(this).show());
			});

			$swiperWrapper.append($swiperSlide);
		}

		new Swiper($tab.find('.swiper')[0], {
			slidesPerView: 1,
			spaceBetween: 20,
			pagination: {
				el: $tab.find('.swiper-pagination')[0],
				clickable: true,
			},
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
		});
	});
});


$(document).ready(function () {
	function updateDateTime() {
		const now = new Date();
		const formattedTime = now.toTimeString().slice(0, 5);
		const formattedDate = `${now.getFullYear()}. ${(now.getMonth() + 1).toString().padStart(2, '0')}. ${now.getDate().toString().padStart(2, '0')}. ${'일월화수목금토'[now.getDay()]}요일`;

		$('.lib_main_time').text(formattedTime);
		$('.lib_main_date').text(formattedDate);
		$('.lib_living_date').text(formattedDate);
	}

	updateDateTime();
	setInterval(updateDateTime, 60000);


	function LibNoticeSelectedItemSwiper() {
		const swiper = new Swiper('.lib_notice_selected_item_swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			effect: 'fade',
			fadeEffect: {
				crossFade: true,
			},
			breakpoints: {
				2160: {
					spaceBetween: 124,
				},
				1080: {
					spaceBetween: 62,
				},
			},
		});
	}

	LibNoticeSelectedItemSwiper();

	function LibNoticeSwiper() {
		const swiper = new Swiper('.lib_notice_swiper .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerView: 5,
			breakpoints: {
				2160: {
					spaceBetween: 70,
				},
				1080: {
					spaceBetween: 35,
				},
			},
			pagination: {
				el: '.lib_notice_swiper .swiper-pagination',
				type: 'bullets',
			},
		});
	}

	LibNoticeSwiper();

	function LibNewSelectedItemSwiper() {
		const swiper = new Swiper('.lib_new_selected_item_swiper', {
			loop: true,
			autoplay: {
				delay: 9900,
				disableOnInteraction: false,
			},
			effect: 'fade',
			fadeEffect: {
				crossFade: true,
			},
			pagination: {
				el: '.lib_new_content .swiper-pagination',
				type: 'bullets',
			},
		});
	}

	LibNewSelectedItemSwiper();

	function LibNewSwiper() {
		const swiper = new Swiper('.lib_new_swiper', {
			loop: true,
			direction: 'vertical',
			slidesPerView: 6,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			breakpoints: {
				2160: {
					spaceBetween: 100,
				},
				1080: {
					spaceBetween: 50,
				},
			},
		});
	}

	LibNewSwiper();

	function LibEventSwiper() {
		const swiper = new Swiper('.lib_event_swiper .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			effect: 'fade',
			fadeEffect: {
				crossFade: true,
			},
			pagination: {
				el: '.lib_event_swiper .swiper-pagination',
				type: 'bullets',
			},
		});
	}

	LibEventSwiper();

	function LibLibrarianSwiper() {
		const swiper = new Swiper('.lib_librarian_swiper .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerView: 3,
			slidesPerColumn: 3,
			grid: {
				rows: 3,
			},
			slidesPerGroup: 3,
			pagination: {
				el: '.lib_librarian_swiper .swiper-pagination',
				type: 'bullets',
			},
			breakpoints: {
				2160: {
					spaceBetween: 120,
				},
				1080: {
					spaceBetween: 60,
				},
			},
		});
	}

	LibLibrarianSwiper();

	function LibBestSwiper() {
		const swiper = new Swiper('.lib_best_container .swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			pagination: {
				el: '.lib_best_container .swiper-pagination',
				type: 'bullets',
			},
		});
	}

	LibBestSwiper();
	
		function LibNewsSwiper() {
		const swiper = new Swiper('.lib_living_news_list_swiper', {
			loop: true,
			autoplay: {
				delay: 10000,
				disableOnInteraction: false,
			},
			slidesPerView: 3,
			direction: 'vertical',
		});
	}

	LibNewsSwiper();
});

$(document).ready(function () {
	const floorData = [
		{
			floor: 'B1',
			image: '/resources/ict/kioskVertical/img/type_b/info/facility/mapB01_v.png',
			duration: 30000,
			slides: [
				{
					index: '01',
					title: {
						kr: '보존서고 1',
						en: 'FACILITY 1',
					},
					image: '/resources/ict/info/img/dummy.svg',
					list: ['보존서고 1'],
				},
				{
					index: '02',
					title: {
						kr: '시청각실',
						en: 'FACILITY 2',
					},
					image: '/resources/ict/info/img/dummy.svg',
					list: ['시청각실'],
				},
				{
					index: '03',
					title: {
						kr: '보존서고 2',
						en: 'FACILITY 3',
					},
					image: '/resources/ict/info/img/dummy.svg',
					list: ['보존서고 2'],
				},
			],
		},
		{
			floor: '1F',
			image: '/resources/ict/kioskVertical/img/type_b/info/facility/map01_v.png',
			duration: 20000,
			slides: [
				{
					index: '01',
					title: {
						kr: '컴퓨터교육실',
						en: 'FACILITY 1',
					},
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/computer.jpg',
					list: ['이용대상 : 정보화 연수 및 컴퓨터 교육 대상자', '수용인원 : 30석', '빔프로젝터, 전자교탁, 마이크, 프린터(3대), 컴퓨터(31대)'],
				},
				{
					index: '02',
					title: {
						kr: '어린이자료실',
						en: 'FACILITY 2',
					},
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/computer.jpg',
					list: ['유아, 영어동화코더, 학년별 교과연계자료 등 비치', '이야기방, 그림책방 포함'],
				},
			],
		},
		{
			floor: '2F',
			image: '/resources/ict/kioskVertical/img/type_b/info/facility/map02_v.svg',
			duration: 90000,
			slides: [
				{
					index: '01',
					title: { kr: '독도교육체험관', en: 'FACILITY 1' },
					image: '/resources/ict/kioskVertical/img/type_a/info/facility/dok.jpg',
					list: ['이용시간 : 둘째, 넷째 월요일 및 공휴일 휴관일', '관람 시간 : 주말은 자원봉사자로 운영됨으로 관람시간 변동 가능', '오전(09:00~12:00) : 화, 수, 목, 금, 토, 오후(13:00~18:00) : 화, 수, 목, 금 토(17:00)'],
				},
				{
					index: '02',
					title: { kr: '열람실', en: 'FACILITY 2' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/y01.jpg',
					list: ['일반 열람석과 노트북석 구분 운영', '사물함 (92개)'],
				},
				{
					index: '03',
					title: { kr: '평생학습실(배움1실)', en: 'FACILITY 3' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/b01.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
				{
					index: '04',
					title: { kr: '평생학습실(배움2실)', en: 'FACILITY 4' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/b02.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
				{
					index: '05',
					title: { kr: '평생학습실(나눔1실)', en: 'FACILITY 5' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/n01.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
				{
					index: '06',
					title: { kr: '평생학습실(나눔2실)', en: 'FACILITY 6' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/n02.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
				{
					index: '07',
					title: { kr: '평생학습실(나눔3실)', en: 'FACILITY 7' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/n03.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
				{
					index: '08',
					title: { kr: '평생학습실(채움1실)', en: 'FACILITY 8' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/c01.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
				{
					index: '09',
					title: { kr: '평생학습실(채움2실)', en: 'FACILITY 9' },
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/c02.jpg',
					list: ['8개 강의실 보유', '최첨단 교육장비를 구비한 스마트한 학습실'],
				},
			],
		},
		{
			floor: '3F',
			image: '/resources/ict/kioskVertical/img/type_b/info/facility/map03_v.svg',
			duration: 20000,
			slides: [
				{
					index: '01',
					title: {
						kr: '정보시스템실',
						en: 'FACILITY 1',
					},
					image: '/resources/ict/info/img/dummy.svg',
					list: ['정보시스템실'],
				},
				{
					index: '02',
					title: {
						kr: '종합자료실',
						en: 'FACILITY 3',
					},
					image: '/resources/ict/kioskVertical/img/type_b/info/facility/total_data.jpg',
					list: ['기존 자료대출, 반납만을 위한 공간에서 탈피', '지역주민들의 편안한 독서 및 휴식공간 제공', '사람중심의 도서관으로 지식, 꿈, 경험을 전달하는 소통의 공간으로 운영'],
				},
			],
		},
	];

	let currentIndex = 0;

	function updateFloor() {
		const currentFloor = floorData[currentIndex];
		const nextIndex = (currentIndex + 1) % floorData.length;

		$('.lib_facility_map img').attr('src', currentFloor.image);
		$('.lib_facility_map div').text(currentFloor.floor);

		$('.lib_facility_switch').removeClass('active');
		$('.lib_facility_switch').eq(currentIndex).addClass('active');

		const $swiperWrapper = $('.lib_facility_swiper .swiper-wrapper');
		$swiperWrapper.empty();

		currentFloor.slides.forEach(slide => {
			const slideHtml = `
        <div class="swiper-slide">
          <div class="lib_facility_header">
            <div class="lib_facility_header_index">${slide.index}</div>
            <div class="lib_facility_title">
            	<div class="lib_facility_title_en">${slide.title.en}</div>
              <div class="lib_facility_title_kr">${slide.title.kr}</div>
            </div>
          </div>
          <img alt="" class="lib_facility_img" src="${slide.image}" />
          <div class="lib_facility_list">
            ${slide.list
							?.map(
								item => `
              <div class="lib_facility_list_item">
                <img alt="" src="/resources/ict/kioskVertical/img/common/check_02.svg" />
                <div>${item}</div>
              </div>
            `
							)
							.join('')}
          </div>
        </div>
      `;
			$swiperWrapper.append(slideHtml);
		});

		new Swiper('.lib_facility_swiper .swiper', {
			autoplay: {
				delay: 9790,
				disableOnInteraction: false,
			},
			effect: 'fade',
			fadeEffect: {
				crossFade: true,
			},
			pagination: {
				el: '.lib_facility_swiper .swiper-pagination',
				type: 'bullets',
			},
		});

		setTimeout(() => {
			currentIndex = nextIndex;
			updateFloor();
		}, currentFloor.duration);
	}

	updateFloor();
});
