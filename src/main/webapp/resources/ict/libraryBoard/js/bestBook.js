$(function () {
    $('.slide').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        dots: true,
        autoplay: true,  
        autoplaySpeed: 5000, 
        variableWidth: true,
        arrows: false,  
        infinite: true,   
    });
});