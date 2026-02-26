$(document).ready(function () {
    const $mainSlide = $('.newBookSection .mainSlide');
    const $subSlide  = $('.newBookSection .subSlide');
    const $section   = $('.newBookSection');

    $mainSlide.slick({
        infinite: true,
        autoplay: true,
        autoplaySpeed: 5000,
        fade: true,
        arrows: false,
        asNavFor: $subSlide
    });

    $subSlide.slick({
        slidesToShow: 6,
        infinite: true,
        slidesToScroll: 1,
        vertical: true,
        focusOnSelect: true,
        autoplay: true,
        autoplaySpeed: 5000,
        arrows: false,
        adaptiveHeight: false,
        variableWidth: false,
        asNavFor: $mainSlide
    });

    // 첫 배경 초기화
    function setBg(idx) {
        const $img = $mainSlide.find('.slideItem').eq(idx).find('img');
        const itemImg = $img.attr('src');

        $section.css(
            'background',
            `url("${itemImg}") center top -40rem / cover no-repeat`
        );
    }

    setBg(0);

    $mainSlide.on('afterChange', function (event, slick, currentSlide) {
        setBg(currentSlide);
    });
});
