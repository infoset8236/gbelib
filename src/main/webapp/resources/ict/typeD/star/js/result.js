$(document).ready(function() {
    function getParameterByName(name) {
        const url = new URL(window.location.href);
        return url.searchParams.get(name);
    }

    const month = getParameterByName('month');
    const day = getParameterByName('day');

    if (!month || !day) {
        return;
    }

    const birthDateStr = month + "월 " + day + "일";

    $.getJSON("/resources/ict/typeD/star/data/zodiacSigns.json", function(zodiacData) {
        let foundSign = null;

        for (let i = 0; i < zodiacData.zodiac_signs.length; i++) {
            const sign = zodiacData.zodiac_signs[i];

            const startParts = sign.start_date.replace("월 ", "/").replace("일", "").split("/");
            const endParts = sign.end_date.replace("월 ", "/").replace("일", "").split("/");

            const startMonth = parseInt(startParts[0], 10);
            const startDay = parseInt(startParts[1], 10);
            const endMonth = parseInt(endParts[0], 10);
            const endDay = parseInt(endParts[1], 10);

            const inputMonth = parseInt(month, 10);
            const inputDay = parseInt(day, 10);

            let isInRange = false;

            if (startMonth === endMonth) {
                if (inputMonth === startMonth && inputDay >= startDay && inputDay <= endDay) {
                    isInRange = true;
                }
            } else {
                if (
                    (inputMonth === startMonth && inputDay >= startDay) ||
                    (inputMonth === endMonth && inputDay <= endDay)
                ) {
                    isInRange = true;
                }
            }

            if (isInRange) {
                foundSign = sign;
                break;
            }
        }

        if (foundSign) {
            $('.en').text(foundSign.sign.en);
            $('.ko').text(foundSign.sign.kr);
            $('.myBirth span').text(birthDateStr);
            $('.description').text(foundSign.description);
            $('.zodiacSign')
                .attr('id', foundSign.sign.en.toLowerCase())
                .css({
                    backgroundImage: `url(${foundSign.img})`,
                    backgroundRepeat: 'no-repeat',
                    backgroundPosition: 'center',
                    backgroundSize: 'contain'
                })
                .attr('aria-label', foundSign.sign.kr);
        } else {
            console.log("해당 날짜에 맞는 별자리를 찾을 수 없습니다.");
        }
    }).fail(function() {
        alert("별자리 데이터를 불러오는 데 실패했습니다.");
    });
});
