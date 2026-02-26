$(function () {
    $('.slide').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        dots: true,
        autoplay: true,  
        autoplaySpeed: 5000, 
        arrows: false, 
        infinite: true,
        variableWidth: true
    });
});