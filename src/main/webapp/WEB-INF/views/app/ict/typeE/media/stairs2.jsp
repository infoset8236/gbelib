<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/dglib/media/css/stairs2.css">
    <script src="/resources/ict/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/common/plugin/slick.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div id="container" style="">
    <c:forEach items="${domesticFiles}" var="file">
        <div style="background-image: url('/resources/ict/dglib/media/img/stairs/gallery/${file}')"></div>
    </c:forEach>
</div>

<script>
    $(document).ready(function () {
        function scheduleCheck() {
            const params = new URLSearchParams(window.location.search);
            if (!params.get("before_url")) return;

            const now = new Date();
            const minute = now.getMinutes();
            const second = now.getSeconds();

            // 현재 시각이 5분 단위일 때만 실행 (0,5,10,15,...,55)
            if (minute % 5 === 0 && second === 0) {
                let beforeApiUrl = params.get("before_api_url");
                $.ajax({
                    url: beforeApiUrl,
                    type: "GET",
                    dataType: "json",
                    success: function (res) {
                        if (params.get("before_url") === 'stairs6.do') {
                            if (res.RESULT_INFO === "SUCCESS" && res.LIST_DATA[0].SEARCH_COUNT !== 0) {
                                location.href = params.get("before_url");
                                return;
                            }
                            return;
                        }
                        if (res.result !== 'FAIL') {
                            location.href = params.get("before_url");
                            return;
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        }
        setInterval(scheduleCheck, 1000);

        $('#container').slick({
            infinite: true,
            speed: 1000,
            fade: true,
            cssEase: 'linear',
            autoplay: true,
            autoplaySpeed: 10000,
            dots: false,
            arrows: false
        });
    });
</script>
</body>
</html>
