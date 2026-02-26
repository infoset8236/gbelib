<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/resources/ict/typeD/guestbook/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
	<link rel="stylesheet" type="text/css" href="/resources/ict/typeD/guestbook/css/createGuestbook.css">
	<script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
	<script src="/resources/ict/typeD/guestbook/js/gusetbook.js"></script>
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>
	<form class="container">
		<div class="guide">
			<div>${homepage.homepage_name} 전자방명록</div>
			<div>잠깐, 이것만 확인해 주세요!</div>
			<div>
				개인 정보는 올리시면 안 돼요.<br>
				도서관 운영 규정에 맞지 않는 게시글은<br>
				삭제될 수 있어요.
			</div>
		</div>
		<label for="user_name">
			<input id="user_name" type="text" placeholder="닉네임을 입력해주세요">
		</label>
		<label for="content" class="guestbookContentWrapper">
			<textarea id="content" placeholder="방명록을 입력해주세요" maxlength="50"></textarea>
			<span class="count"><em>0</em> / 50</span>
		</label>
		<button>등록할래요</button>
	</form>

<script>
    function hasBadWord(str) {
        const bad = ["씨발","시발","개새","개새끼","병신","븅신","좆","존나","ㅅㅂ","ㅂㅅ","ㅈㄴ","ㅄ","ㅈ밥"];
        return bad.some(word => str.includes(word));
    }

    $(function () {
        const $nick = $('#user_name');
        const $content = $('#content');
        const $count = $('.count em');

        $content.on('input', function () {
            const len = $(this).val().length;
            $count.text(len);
            $count.toggleClass('active', len > 0);
        });

        $('button').on('click', function (e) {
            e.preventDefault();

            const nickname = $nick.val().trim();
            const content = $content.val().trim();

            if (!nickname || !content) {
                alert('닉네임과 방명록을 모두 입력해주세요.');
                return;
            }

            if (hasBadWord(nickname) || hasBadWord(content)) {
                alert("부적절한 표현이 포함되어 있습니다.\n다시 입력해주세요.");
                return;
            }

            $.ajax({
                url: "guestbookSave.do",
                type: "POST",
                dataType: "json",
                data: {
                    user_name: nickname,
                    content: content
                },
                success: function (res) {
                    if (res.valid) {
                        alert(res.message);
                        location.reload();
                    } else {
                        alert(res.message);
                        location.reload();
                    }
                },
                error: function (xhr, status, error) {
                    console.error(error);
                    alert("서버 통신 중 오류가 발생했습니다.");
                    location.reload();
                }
            });
        });
    });
</script>

</body>
</html>
