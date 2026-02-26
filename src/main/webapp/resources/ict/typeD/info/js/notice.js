$(document).ready(function() {


    const $mainSlider = $('.noticeMainSlider');
    const $subSlider = $('.noticeSubSlider');


    $mainSlider.slick({
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        speed: 500,
        infinite: true,
        asNavFor: '.noticeSubSlider',
        autoplay: true,
        autoplaySpeed: 8000
    });

    $subSlider.slick({
        slidesToScroll: 1,
        asNavFor: '.noticeMainSlider',
        speed: 500,
        arrows: false,
        focusOnSelect: true,
        variableWidth: true,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 8000
    });

});