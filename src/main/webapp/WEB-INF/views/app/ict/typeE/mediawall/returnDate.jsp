<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
    <meta content="ie=edge" http-equiv="X-UA-Compatible" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/book_loan_return_date.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <title>대출반납일</title>
    <style>
        * {
            cursor: none !important;
        }
    </style>
</head>
<body>
<div class="loanReturn_wrap">
    <div class="header_wrap">
        <div class="ict_tit_01">대출반납일</div>
        <div class="ict_tit">BOOK RETURN DATE</div>
    </div>
    <div class="loanReturn_area">
        <div class="daily_tit_wrap">
            <div class="large_tit">대출반납일</div>
        </div>
        <div class="loanReturn_container">
            <div class="loan_wrap">
                <div class="loan_book_">
                    <div class="lr_text">책 빌려간 날</div>
                </div>
                <div class="daily_num">
                    <div class="month_wrap">
                        <div class="month_num">${month}</div>
                        <div class="month_kor">월</div>
                    </div>
                    <div class="day_wrap">
                        <div class="day_num">${day}</div>
                        <div class="day_kor">일</div>
                    </div>
                </div>
            </div>
            <div class="return_wrap">
                <div class="return_book_">
                    <div class="lr_text">책 반납하는 날</div>
                </div>
                <div class="redaily_num">
                    <div class="month_wrap">
                        <div class="month_num">${returnMonth}</div>
                        <div class="month_kor">월</div>
                    </div>
                    <div class="day_wrap">
                        <div class="day_num">${returnDay}</div>
                        <div class="day_kor">일</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>