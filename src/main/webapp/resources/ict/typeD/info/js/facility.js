$(document).ready(function() {
    const facilityTabs = [
        {
            id: 'tab1',
            floor: '1F',
            image: '/resources/ict/typeD/info/img/facility/facility1f.png',
            slides: [
                {
                    subTitle: '1. 스마트도서관',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                },
                {
                    subTitle: '2. 어린이 자료실',
                    checkList: [
                        '이용대상 : 어린이 이용자 및 보호자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                },
                {
                    subTitle: '3. 유아 자료실',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                },
                {
                    subTitle: '4. 학습실',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~일 08:00 ~ 22:00',
                    ],
                    textBox: ''
                }
            ]
        },
        {
            id: 'tab2',
            floor: '2F',
            image: '/resources/ict/typeD/info/img/facility/facility2f.png',
            slides: [
                {
                    subTitle: '1. 종합자료실',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                },
                {
                    subTitle: '2. 디지털자료실',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                },
                {
                    subTitle: '3. 강의실',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                }
            ]
        },
        {
            id: 'tab3',
            floor: '3F',
            image: '/resources/ict/typeD/info/img/facility/facility3f.png',
            slides: [
                {
                    subTitle: '1. 다목적 강당',
                    checkList: [
                        '이용대상 : 전체 이용자',
                        '운영시간 : 화~금 09:00 ~ 18:00 토~일 09:00 ~ 17:00',
                    ],
                    textBox: ''
                }
            ]
        }
    ];


    const $tabWrapper = $('.facilityTab');
    const $tabMenu = $('.tabMenu');
    let $currentSlider = null;

    $tabMenu.empty();
    $tabWrapper.empty();

    const createMenu = (tab, i) =>
        $(`<div class="tabMenuItem${i === 0 ? ' active' : ''}">
      <a href="#${tab.id}">${tab.floor}</a>
    </div>`);

    const createSlides = tab =>
        tab.slides.map(item => `
    <div class="slideItem">
      ${item.subTitle ? `<div class="subTitle">${item.subTitle}</div>` : ''}
      ${item.checkList ? `<div class="checkList">${item.checkList.map(t => `<div class="checkItem">${t}</div>`).join('')}</div>` : ''}
     
    </div>
  `).join('');

    facilityTabs.forEach((tab, i) => {
        $tabMenu.append(createMenu(tab, i));

        const $content = $(`
    <div class="facilityTab ${tab.id}" ${i ? 'style="display:none"' : ''}>
      <div class="tabContent">
        <div class="tabImage"><img src="${tab.image}" alt="${tab.floor}"></div>
        <div class="tabTitle">${tab.floor}</div>
        <div class="facilitySlide">${createSlides(tab)}</div>
      </div>
    </div>
  `);

        $tabWrapper.append($content);

        const $slider = $content.find('.facilitySlide').slick({
            infinite: true,
            autoplay: false,
            autoplaySpeed: 8000,
            speed: 500,
            arrows: false,
            dots: true,
            fade: false,
            variableWidth: true,
            pauseOnHover: false,
            pauseOnFocus: false
        });

        $slider.on('afterChange', (e, slick, current) => {
            if (current !== slick.slideCount - 1) return;
            $slider.slick('slickPause');
            setTimeout(() => {
                const $next = $tabMenu.find('.tabMenuItem.active').next('.tabMenuItem');
                ($next.length ? $next : $tabMenu.find('.tabMenuItem').first())
                    .find('a').click();
            }, 3000);
        });

        $content.data('slider', $slider);
    });

    $tabMenu.on('click', '.tabMenuItem a', function (e) {
        e.preventDefault();
        const id = $(this).attr('href').slice(1);
        const $tab = $tabWrapper.find(`.${id}`);
        const $slider = $tab.data('slider');

        if ($currentSlider && $currentSlider !== $slider) {
            $currentSlider.slick('slickPause');
        }

        $tabWrapper.children().hide();
        $tab.fadeIn();
        $tabMenu.find('.tabMenuItem').removeClass('active');
        $(this).parent().addClass('active');

        $slider.slick('slickGoTo', 0, false).slick('slickPlay');
        $currentSlider = $slider;
    });

    if (facilityTabs.length) {
        $currentSlider = $tabWrapper.find('.facilityTab').first().data('slider');
        $currentSlider.slick('slickPlay');
    }
});