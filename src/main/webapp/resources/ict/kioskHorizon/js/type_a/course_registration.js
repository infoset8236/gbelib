$(document).ready(function () {
	// 현재 날짜 가져오기
	var today = new Date();
	var currentYear = today.getFullYear();
	var currentMonth = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
	var currentDate = today.getDate();

	// 연도 옵션 생성
	for (var year = currentYear; year >= 1900; year--) {
		$('#year').append($('<option></option>').val(year).text(year));
	}
	$('#year').val(currentYear); // 기본값 설정

	// 월 옵션 생성
	for (var month = 1; month <= 12; month++) {
		$('#month').append(
			$('<option></option>')
				.val(month)
				.text(month + '월')
		);
	}
	$('#month').val(currentMonth); // 기본값 설정

	// 일 옵션 생성
	function updateDays() {
		var selectedYear = $('#year').val();
		var selectedMonth = $('#month').val();
		$('#day').empty(); // 기존 옵션 제거

		if (selectedYear && selectedMonth) {
			var daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate(); // 해당 월의 일 수
			for (var day = 1; day <= daysInMonth; day++) {
				$('#day').append(
					$('<option></option>')
						.val(day)
						.text(day + '일')
				);
			}
		}
	}

	// 연도 또는 월이 변경될 때 일 옵션 업데이트
	$('#year, #month').change(updateDays);

	// 초기 일 옵션 업데이트
	updateDays();

	// 기본값 설정에 따라 오늘 날짜의 일도 선택
	$('#day').val(currentDate); // 기본값 설정
});

$(document).ready(function () {
	$('#photo_agree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/checked.svg');
	$('#sms_agree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/checked.svg');

	$('#photo_agree').on('click', function () {
		$('#photo_agree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/checked.svg');
		$('#photo_disagree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/unchecked.svg');
	});

	$('#photo_disagree').on('click', function () {
		$('#photo_agree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/unchecked.svg');
		$('#photo_disagree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/checked.svg');
	});

	$('#sms_agree').on('click', function () {
		$('#sms_agree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/checked.svg');
		$('#sms_disagree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/unchecked.svg');
	});

	$('#sms_disagree').on('click', function () {
		$('#sms_agree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/unchecked.svg');
		$('#sms_disagree img').attr('src', '../../../../../resources/ict/img/type_a/course_registration/checked.svg');
	});
});

$(document).ready(function () {
	$('.gender').removeClass('gender_active');
	$('.gender').first().addClass('gender_active');

	$('.gender').click(function () {
		$('.gender').removeClass('gender_active');

		$(this).addClass('gender_active');
	});
});
