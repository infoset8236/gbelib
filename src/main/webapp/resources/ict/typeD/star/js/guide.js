function formatDate(dateStr) {
    if (!dateStr) return '';
    const [month, day] = dateStr.split(' ');
    return `${month.replace('월','').padStart(2,'0')}/${day.replace('일','').padStart(2,'0')}`;
}

async function initZodiacSlider(startIndex = 0) {
    const $container = $('#zodiacContainer');
    if (!$container.length) return;

    try {
        const res = await fetch("/resources/ict/typeD/star/data/zodiacSigns.json");
        if (!res.ok) throw new Error("zodiacSigns.json 로드 실패");

        const { zodiac_signs: signs } = await res.json();
        if (!Array.isArray(signs) || !signs.length) throw new Error("데이터 없음");

        signs.forEach(sign => {
            const $slider = $(`#${sign.sign.en}`);
            if (!$slider.length) return;

            const imgSrc = sign.img || '/resources/ict/typeD/star/img/default.png';

            $slider.html(`
        <div>
          <div class="constel">
            <img src="${imgSrc}" alt="${sign.sign.kr}" class="${sign.sign.kr}" id="constellationImg">
          </div>
          <div class="starInfo">
            <div class="starBasic">
              <div class="starNames">
                <div class="starNameEn">${sign.sign.en}</div>
                <div class="starNameKr">${sign.sign.kr}</div>
              </div>
              <div class="starPeriod">
                ${formatDate(sign.start_date)} ~ ${formatDate(sign.end_date)}
              </div>
            </div>
            <div class="starDesc">
              <div class="starHeadline">별의 기원,<br>신화로 읽는 밤하늘</div>
              <div class="starStory">${sign.description}</div>
            </div>
          </div>
        </div>
      `);
        });

        if (!$container.hasClass('slick-initialized')) {
            $container.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: true,
                dots: false,
                infinite: true,
                centerMode: true,
                adaptiveHeight: true,
                autoplay: true,
                autoplaySpeed: 8000,
                initialSlide: startIndex,
                variableWidth: true,
                prevArrow: $('.cntArrows .slick-prev'),
                nextArrow: $('.cntArrows .slick-next')
            }).on('afterChange', (e, slick, currentSlide) => {
                $('.pgCurrent').text(currentSlide + 1);
            });
        }

        $('.pgCurrent').text(startIndex + 1);

    } catch (err) {
        $container.html(`
      <div style="padding:60px;text-align:center;color:#fff;">
        별자리 정보를 불러오지 못했습니다.<br>
        <small>${err.message}</small>
      </div>
    `);
    }
}

$(() => initZodiacSlider(0));