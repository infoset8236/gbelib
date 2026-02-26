$(function () {
    $('.book_slide').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        autoplay: true,
        autoplaySpeed: 8000,
        fade: true, 
        cssEase: 'linear',
        infinite: true,
    });

    $('.book_list_slide').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        autoplay: true,
        autoplaySpeed: 8000,
        variableWidth: true,
        infinite: true,
    });
});