//시설안내
$(document).ready(function () {
  $(".faci_tab a").click(function () {
    var tab_id = $(this).attr("data-tab");

    $(".faci_tab a").removeClass("active");
    $(".tab_content").removeClass("active");

    $(this).addClass("active");
    $("#" + tab_id).addClass("active");
  });
});

$(function () {
  $(".floor_slide_01").bxSlider({
    infiniteLoop: false,
    controls: false,
    pager: true,
    slideMargin: 40,
  });
});

$(function () {
  $(".floor_slide_02").bxSlider({
    infiniteLoop: false,
    controls: false,
    pager: true,
    slideMargin: 40,
  });
});

$(function () {
  $(".floor_slide_03").bxSlider({
    infiniteLoop: false,
    controls: false,
    pager: true,
    slideMargin: 40,
  });
});
