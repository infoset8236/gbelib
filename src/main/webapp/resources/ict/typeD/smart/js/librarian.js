$(document).ready(function () {
    $('.bookList').each(function () {
        const $slider = $(this);
        const $items = $slider.children();
        const groupedItems = [];

        for (let i = 0; i < $items.length; i += 9) {
            const $group = $('<div class="wrapper"></div>');
            $items.slice(i, i + 9).appendTo($group);
            groupedItems.push($group);
        }

        $slider.empty().append(groupedItems);

        if (typeof keyPadController !== "undefined" && keyPadController) {
            bodyOpen();
        }

        $slider.slick({
            slidesToShow: 1,
            arrows: false,
            autoplay: true,
            autoplaySpeed: 8000,
            dots: groupedItems.length > 1,
            accessibility: sessionStorage.getItem("g_earphone") !== 'Y' ,
            infinite: sessionStorage.getItem("g_earphone") !== 'Y'
        });
    });
});