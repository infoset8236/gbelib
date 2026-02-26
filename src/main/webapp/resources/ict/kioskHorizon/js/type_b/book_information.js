$(document).ready(function () {
    // 슬라이드 복제 함수
    function ensureSlides(swiperContainer, minSlides) {
        var slides = $(swiperContainer).find('.swiper-slide');
        var slideCount = slides.length;

        if (slideCount < minSlides) {
            var cloneCount = minSlides - slideCount;
            for (var i = 0; i < cloneCount; i++) {
                $(swiperContainer).find('.swiper-wrapper').append(slides.eq(i % slideCount).clone());
            }
        }
    }

    // 썸네일 슬라이더
    var thumbnailSwiper = new Swiper('.bookinfo_thumbnails', {
        direction: 'vertical', // 세로 슬라이드
        slidesPerView: 4,      // 썸네일 간 간격
        loop: true,            // 무한 반복
        watchSlidesProgress: true, // 썸네일 상태 유지
        breakpoints: {
            1920: {
                spaceBetween: 25
            },
            3840: {
                spaceBetween: 50
            }
        }
    });

    // 슬라이드 수 보장 (최소 5개)
    ensureSlides('.bookinfo_main', 5);
    ensureSlides('.bookinfo_thumbnails', 5);

    // 메인 슬라이더
    var mainSwiper = new Swiper('.bookinfo_main', {
        slidesPerView: 1,      // 한 번에 하나의 슬라이드
        spaceBetween: 10,      // 메인 슬라이더 간 간격
        loop: true,            // 무한 반복
        thumbs: {
            swiper: thumbnailSwiper // 썸네일 슬라이더와 연동
        }
    });
});
