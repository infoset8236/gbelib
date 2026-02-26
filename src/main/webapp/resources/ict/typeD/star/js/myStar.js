$(document).ready(function() {
    $('.submit').on('click', function() {
        const month = +$('#month').val();
        const day   = +$('#day').val();

        const zodiacList = [
            {id:1,  s:[2,19], e:[3,20]},
            {id:2,  s:[3,21], e:[4,19]},
            {id:3,  s:[4,20], e:[5,20]},
            {id:4,  s:[5,21], e:[6,21]},
            {id:5,  s:[6,22], e:[7,22]},
            {id:6,  s:[7,23], e:[8,22]},
            {id:7,  s:[8,23], e:[9,22]},
            {id:8,  s:[9,23], e:[10,22]},
            {id:9,  s:[10,23],e:[11,22]},
            {id:10, s:[11,23],e:[12,21]},
            {id:11, s:[12,22],e:[1,19]},
            {id:12, s:[1,20], e:[2,18]}
        ];

        const zodiac = zodiacList.find(z => {
            const sm = z.s[0], sd = z.s[1], em = z.e[0], ed = z.e[1];
            return sm === em
                ? month === sm && day >= sd && day <= ed
                : (month === sm && day >= sd) || (month === em && day <= ed);
        });

        if (zodiac) {
            location.href = '/yy/ict/star/result.do?id=' + zodiac.id + '&month=' + month + '&day=' + day;
        } else {
            alert('선택한 생년월일에 해당하는 별자리를 찾을 수 없습니다.');
        }
    });
});