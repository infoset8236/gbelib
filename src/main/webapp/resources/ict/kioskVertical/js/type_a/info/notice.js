//공지사항
$(function () {
  var swiper = new Swiper(".notice-slide-thumbs", {
    loop: true,
    spaceBetween: 0,
    slidesPerView: 5,
    freeMode: true,
    watchSlidesProgress: true,
    /*
		scrollbar: {
			el: ".swiper-scrollbar",
		},
		*/
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });
  var swiper2 = new Swiper(".notice-slide", {
    loop: true,
    spaceBetween: 10,
    effect: "fade",
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    thumbs: {
      swiper: swiper,
    },
  });
});
