$(document).ready(function() {

    const $eventSlide = $('.eventSlide');

    $eventSlide.slick({
        slidesToScroll: 1,
        arrows: false,
        speed: 500,
        infinite: true,
        autoplay: true,
        dots: true,
        variableWidth: true,
        autoplaySpeed: 8000
    });
});