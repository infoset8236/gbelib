function setDate() {
	const date = new Date(); // 현재 날짜와 시간
	const months = date.getMonth() + 1; // 월(0부터 시작하므로 +1)
	const days = date.getDate(); // 일
	const dayOfWeek = date.getDay(); // 요일 (숫자 형태)

	// 숫자 요일을 한글 요일로 변환
	const dayNames = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	const dayName = dayNames[dayOfWeek];

	// HTML에 날짜 정보 삽입 ('월', '일' 글자 포함)
	document.getElementById('months').textContent = `${months}`;
	document.getElementById('days').textContent = `${days}`;
	document.getElementById('dayofweeks').textContent = dayName;
}

// 페이지 로딩 시 날짜 설정
window.onload = setDate;
