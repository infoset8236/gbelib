$(document).ready(function () {
    $('.tabMenu div:first').addClass('active');
    $('.tabContent').hide().first().show();

    $('.tabMenu div').on('click', function () {
        const index = $(this).index();
        $('.tabMenu div').removeClass('active');
        $(this).addClass('active');
        $('.tabContent').hide().eq(index).show();
    });

    const $searchInput = $('#search');
    const $cancelButton = $('.cancel');
    $cancelButton.hide();

    $searchInput.on('input', function () {
        if ($(this).val().length > 0) $cancelButton.show();
        else $cancelButton.hide();
    });

    $cancelButton.on('click', function () {
        $searchInput.val('').trigger('input');
    });

    $('.location').on('click', function () {
        $('#popup').css('display', 'block');
    });

    $('#popup .close, #popup').on('click', function (e) {
        if (e.target === this || $(e.target).hasClass('close')) {
            $('#popup').css('display', 'none');
        }
    });
});
