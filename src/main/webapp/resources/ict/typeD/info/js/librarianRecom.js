
$(document).ready(function () {

    const $recBookSlide = $(".recBookSlide");
    

    const $items = $recBookSlide.find(".recBookSlideItem");

    for (let i = 0; i < $items.length; i += 4) {
        const $group = $('<div class="recBookGroup"></div>');
        $items.slice(i, i + 4).appendTo($group);
        $recBookSlide.append($group);
    }

    $recBookSlide.slick({
        infinite: true,
        autoplay: true,
        dots: true,
        arrows: false,
        variableWidth: true,
        autoplaySpeed: 8000
    });

});
