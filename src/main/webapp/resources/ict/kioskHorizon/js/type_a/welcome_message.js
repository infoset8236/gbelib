$(document).ready(function () {
	function updateTimeAndDate() {
		var now = new Date();

		var hours = now.getHours().toString().padStart(2, '0');
		var minutes = now.getMinutes().toString().padStart(2, '0');
		$('.time').text(hours + ':' + minutes);

		var daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
		var months = now.getMonth() + 1;
		var day = now.getDate();
		var dayOfWeek = daysOfWeek[now.getDay()];
		$('.date').text(months + '월 ' + day + '일 ' + dayOfWeek + '요일 ');
	}

	updateTimeAndDate();
	setInterval(updateTimeAndDate, 1000);
});
