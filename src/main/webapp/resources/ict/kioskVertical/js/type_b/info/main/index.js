function updateDateTime() {
	const now = new Date();

	document.getElementById('hours').textContent = String(now.getHours()).padStart(2, '0');
	document.getElementById('minutes').textContent = String(now.getMinutes()).padStart(2, '0');

	const week = ['일', '월', '화', '수', '목', '금', '토'];
	document.getElementById('months').textContent = `${String(now.getMonth() + 1).padStart(2, '0')}. ${String(now.getDate()).padStart(2, '0')}. ${week[now.getDay()]}요일`;
}

$(document).ready(function () {
	updateDateTime();
	setInterval(updateDateTime, 1000);
});
