$(document).ready(function () {
    $('.bookSlide').each(function () {
        const $slider = $(this);
        const $items = $slider.children();
        const groupedItems = [];

        for (let i = 0; i < $items.length; i += 12) {
            const $group = $('<div class="wrapper"></div>');
            $items.slice(i, i + 12).appendTo($group);
            groupedItems.push($group);
        }

        $slider.empty().append(groupedItems);

        $slider.slick({
            slidesToShow: 1,
            arrows: false,
            autoplay: true,
            autoplaySpeed: 8000,
            dots: groupedItems.length > 1,
            infinite: sessionStorage.getItem("g_earphone") !== 'Y',
            accessibility: sessionStorage.getItem("g_earphone") !== 'Y' ,
        });
        if (typeof keyPadController !== "undefined" && keyPadController) {
            bodyOpen();
        }
    });

    if ($('.bookSlide').length === 0) {
        if (typeof keyPadController !== "undefined" && keyPadController) {
            bodyOpen();
        }
    }
});
