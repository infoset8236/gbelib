$(document).ready(function() {
    let isListening = false;

    $('.mic').on('click', function() {
        isListening = !isListening;

        if(isListening){
            $('.caption').text('듣고 있어요').css('color', '#20B625');

            $('.mic span').css({
                'background': 'radial-gradient(50% 50% at 50% 50%,rgba(32, 182, 37, 0.00) 0%,rgba(32, 182, 37, 0.5) 100%'
            });
        } else {
            $('.caption').text('마이크 터치 후 말씀해주세요').css('color', '#EFF1F3');
            $('.mic span').css({
                'background': 'radial-gradient(50% 50% at 50% 50%, rgba(255,255,255,0) 0%, rgba(255,255,255,0.2) 100%)'
            });
        }
    });

    $('.caption').css('transition', 'color 0.5s ease');
    $('.mic span').css('transition', 'background 0.5s ease');
});
