

$(document).ready(function () {
    const $bookSlide = $('.bookSlide');

    const $items = $bookSlide.find('.bookItem');

    for (let i = 0; i < $items.length; i += 5) {
        const $group = $('<div class="bookGroup"></div>');
        $items.slice(i, i + 5).appendTo($group);
        $bookSlide.append($group);
    }

    $bookSlide.slick({
        infinite: true,
        autoplay: true,
        arrows: false,
        dots: true,
        variableWidth: true,
        autoplaySpeed: 8000
    });

});

