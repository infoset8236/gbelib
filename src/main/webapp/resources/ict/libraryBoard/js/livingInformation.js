$(function () {
	$('.slide').slick({
		vertical: true,
		slidesToShow: 2,
		autoplay: true,
		autoplaySpeed: 3000,
		arrows: false,
		infinite: true,
	});

	let today = new Date();
	let year = today.getFullYear();
	let month = String(today.getMonth() + 1).padStart(2, '0');
	let day = String(today.getDate()).padStart(2, '0');
	let days = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	let dayName = days[today.getDay()];

	let formattedDate = `${year}.${month}.${day} ${dayName}`;

	$('.today').contents().first().replaceWith(formattedDate);
});