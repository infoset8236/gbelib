$(function () {
    const now = new Date();
    const pad = n => n.toString().padStart(2, '0');
    const weekdays = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];

    $('.time').text(`${pad(now.getHours())}:${pad(now.getMinutes())}`);
    $('.date').text(`${now.getMonth() + 1}월 ${now.getDate()}일 ${weekdays[now.getDay()]}`);
});