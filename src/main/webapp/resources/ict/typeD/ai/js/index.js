$(document).ready(function() {
    $('.example li').on('click', function(e) {
        if ($(e.target).is('button')) return;

        var questionText = $(this).find('div').text();
        $('.form input').val(questionText).focus();
    });

    $('.example li button').on('click', function() {
        var questionText = $(this).siblings('div').text();
        $('.form input').val(questionText).focus();
    });

    $(".form button").on("click", function () {
        const question = $("#search").val().trim();
        if (!question) {
            customPopup("질문 내용을 작성해 주세요.");
            return;
        }
        sendQuestion(question, "input");
    });

    $("#search").on("keydown", function(e) {
        if (e.key === "Enter") {
            e.preventDefault();
            const question = $(this).val().trim();
            if (!question) {
                customPopup("질문 내용을 작성해 주세요.");
                return;
            }
            sendQuestion(question, "input");
        }
    });

    $(".example li button").on("click", function () {
        const question = $(this).siblings("div").text().trim();
        $("#search").val(question); // 선택한 질문을 입력창에 표시
        sendQuestion(question, "example");
    });

    function sendQuestion(question, type) {
        const form = $('<form>', {
            method: 'POST',
            action: 'aiResult.do'
        }).append(
            $('<input>', { type: 'hidden', name: 'question', value: question }),
            $('<input>', { type: 'hidden', name: 'sourceType', value: type })
        );

        $('body').append(form);
        form.submit();
    }

    function showAnswer(data) {
        console.log("AI 응답:", data);
    }
});
