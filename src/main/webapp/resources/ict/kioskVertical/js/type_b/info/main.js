$(function () {
  var now = new Date();

  let y = now.getFullYear();
  let mo = now.getMonth() + 1;
  let d = now.getDate();
  let dow = now.getDay();
  var week = new Array(
    "일요일",
    "월요일",
    "화요일",
    "수요일",
    "목요일",
    "금요일",
    "토요일"
  );
  var today = new Date().getDay();
  var todayLabel = week[today];

  $("#years").text(y);
  $("#months").text(mo);
  $("#days").text(d);
  $("#dayofweeks").text(todayLabel);
});
