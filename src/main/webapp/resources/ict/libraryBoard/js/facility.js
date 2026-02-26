$(function () {
    const data = [
    {
        floor: 'B1',
        duration: 30000,
        image: '/resources/ict/libraryBoard/img/facility/map0.png',
        slides: [
        { title: '1. 보존서고1', list: ['보존서고1 입니다.'] },
        { title: '2. 시청각실', list: ['시청각실 입니다.'] },
        { title: '3. 보존서고2', list: ['보존서고2 입니다.'] },
        ],
    },
    {
        floor: '1F',
        duration: 20000,
        image: '/resources/ict/libraryBoard/img/facility/map1.png',
        slides: [
        {
            title: '1. 컴퓨터교육실',
            list: [
            '이용대상 : 정보화 연수 및 컴퓨터 교육 대상자',
            '수용인원 : 30석',
            '빔프로젝터, 전자교탁, 마이크, 프린터(3대), 컴퓨터 31대',
            ],
        },
        {
            title: '2. 어린이자료실',
            list: [
            '유아, 영어동화코너, 학년별 교육연계자료 등을 비치',
            '이야기방 및 어린이용 멀티미디어 코너 4석이 포함된 그림책방이 있습니다',
            ],
        },
        ],
    },
    {
        floor: '2F',
        duration: 90000,
        image: '/resources/ict/libraryBoard/img/facility/map2.png',
        slides: [
        {
            title: '1. 독도교육체험관',
            list: [
            '2010년 9월 11일 개관, 2017년 11월 14일 확장 및 리모델링',
            '둘째, 넷째 월요일 및 공휴일 휴관',
            '오전(09:00~12:00) : 화, 수, 목, 금, 토',
            '오후(13:00~18:00) : 화, 수, 목, 금, 토(17:00)',
            '독도학습자료 제공',
            '정보센터 1층 로비 독도모형 제공',
            '독도 포토존 키오스크 제공',
            '사이버 독도 아카이브 키오스크 비치',
            '독도 VR & 동영상 시청 가능',
            '독도 관련 도서 전시',
            ],
        },
        {
            title: '2. 열람실',
            list: [
            '독서 및 개인 학습 공간',
            '일반 열람석과 노트북석 구분 운영',
            '사물함(92개) 운영',
            ],
        },
        ...['배움1실', '배움2실', '나눔1실', '나눔2실', '나눔3실', '채움1실', '채움실'].map((name, idx) => ({
            title: `${idx + 3}. 평생학습실(${name})`,
            list: [
            '평생교육프로그램 운영을 위해 8개 강의실로 구성',
            '최첨단 교육장비를 구비한 스마트 평생학습실',
            ],
        })),
        ],
    },
    {
        floor: '3F',
        duration: 20000,
        image: '/resources/ict/libraryBoard/img/facility/map3.png',
        slides: [
        { title: '1. 정보시스템실', list: [] },
        {
            title: '2. 종합자료실',
            list: ['독서 및 휴식공간 제공', '지식, 꿈, 경험을 전달하는 소통의 공간으로 운영'],
        },
        ],
    },
    ];

    let currentIndex = 0;

    function renderSlides(slides) {
    const $slideWrapper = $('.slide');
    $slideWrapper.empty();

    slides.forEach(({ title, list }) => {
        const itemsHtml = list.map(item => 
        `<div class="list_item">${item}</div>`).join('');
            $slideWrapper.append(`
            <div class="slide_item">
                <div class="title">${title}</div>
                <div class="list">${itemsHtml}</div>
            </div>
        `);
    });

    if ($slideWrapper.hasClass('slick-initialized')) {
        $slideWrapper.slick('unslick');
    }

    $slideWrapper.slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        autoplay: true,
        autoplaySpeed: 10000,
        infinite: true,
    });
    }

    function updateFloor() {
        const currentFloor = data[currentIndex];
        const nextIndex = (currentIndex + 1) % data.length;

        $('.map').attr('src', currentFloor.image);
        $('.current_floor').text(currentFloor.floor);
        $('.tab').removeClass('active').eq(currentIndex).addClass('active');

        renderSlides(currentFloor.slides);

        setTimeout(() => {
        currentIndex = nextIndex;
        updateFloor();
        }, currentFloor.duration);
    }

    updateFloor();
});