<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/common/css/font.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/resources/ict/typeE/guestbook/css/gusetbook.css">
	<script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
	<script src="/resources/ict/typeE/guestbook/js/gusetbook.js"></script>
    <script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>
    <script>
        $(document).ready(function () {
            const $qrWrap = $('.qr_code');

            const qrSize = 13 * 16;

            const qr = new QRCodeStyling({
                width: qrSize,
                height: qrSize,
                data: "http://localhost/${homepage.context_path}/ict/mediawall/createGuestbook.do",
                dotsOptions: { color: "#000000", type: "square" },
                backgroundOptions: { color: "#FFF" }
            });

            $qrWrap.empty();
            qr.append($qrWrap[0]);
        });
    </script>
	<div class="container">
		<div class="guide">
			<div>전자방명록</div>
			<div>
				휴대폰으로 하단 <span>QR 코드</span>를<br> 스캔하면 방명록을<br> 작성할 수 있어요.
			</div>
			<div class="qr_code">

            </div>
			<div>
				잠깐, 이것만 확인해 주세요
			</div>
			<div>
				개인 정보는 올리시면 안 돼요.<br>도서관 운영 규정에 맞지 않는<br> 게시글은 삭제될 수 있어요.
			</div>
		</div>
        <c:choose>
            <c:when test="${fn:length(guestbookList) > 0}">
                <div class="bubbles">
                    <c:forEach items="${guestbookList}" var="i">
                        <div class="bubble">
                            <div>${i.user_name}</div>
                            <div>${i.content}</div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="exception">등록된 방명록이 없습니다.</div>
            </c:otherwise>
        </c:choose>
	</div>
</body>
</html>
