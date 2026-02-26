<%@ page language="java" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/loanReturn.css?v=2">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/media/js/loanReturn.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="rtnContainer">
    <div class="btchHeader">
        <div class="btchHeaderL">대출반납일</div>
        <div class="btchHeaderR">book return date</div>
    </div>
    <div class="rtnContent">
        <div class="rtnSchedule">
            <div class="rtnScheduleTitle"></div>
            <div class="rtnClock">
                <canvas id="gc"></canvas>
            </div>
            <div class="rtnDateTxt">2025년 11월 05일(수)</div>
            <div class="rtnTime">11:08</div>
        </div>

        <div class="rtnToday">
            <div class="rtnTodayTitle">오늘 빌린 책은 언제 반납하나요?</div>
            <div class="rtnTodayContent">
                <!-- 공통 클래스: rtnItem / 구분 클래스: rtnLend -->
                <div class="rtnItem rtnLend">
                    <div class="rtnLabel rtnLabelLend">
                        <div class="labelKo">책 빌려간 날</div>
                        <div class="labelEn">Loan Date</div>
                    </div>
                    <div class="rtnDate rtnDateLend">
                        <div class="dateMon">
                            <div class="dateNum">${month}</div>
                            <div class="dateTxt">월</div>
                        </div>
                        <div class="dateD">
                            <div class="dateNum">${day}</div>
                            <div class="dateTxt">일</div>
                        </div>
                    </div>
                </div>

                <!-- 공통 클래스: rtnItem / 구분 클래스: rtnReturn -->
                <div class="rtnItem rtnReturn">
                    <div class="rtnLabel rtnLabelReturn">
                        <div class="labelKo">책 반납하는 날</div>
                        <div class="labelEn">Return Date</div>
                    </div>
                    <div class="rtnDate rtnDateReturn">
                        <div class="dateMon">
                            <div class="dateNum">${returnMonth}</div>
                            <div class="dateTxt">월</div>
                        </div>
                        <div class="dateD">
                            <div class="dateNum">${returnDay}</div>
                            <div class="dateTxt">일</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
