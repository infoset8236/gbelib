<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/loanReturn.css?v=20251125">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>대출반납일</title>
</head>
<body>
<div class="bookReturnContainer">
    <div class="bookReturnHeader">
        <div class="headerEn">BOOK RETURN DATE</div>
        <div class="headerKo">대출반납일</div>
    </div>

    <div class="bookReturnContent">
        <div class="bookReturnNotice">
            오늘 빌린 책은<br>
            언제 반납하나요?
        </div>

        <div class="bookReturnInfo">
            <div class="dateItem">
                <div class="dateTitle">
                    <div class="dateLabelKo">
                        책 빌려간 날
                    </div>
                    <div class="dateLabelEn">
                        Lending Day
                    </div>
                </div>
                <div class="dateValue">
                    <div>${fn:substring(month, 0, 1)}${fn:substring(month, 1, 2)}</div>
                    <div>월</div>
                    <div>${fn:substring(day, 0, 1)}${fn:substring(day, 1, 2)}</div>
                    <div>일</div>
                </div>
            </div>

            <div class="dateItem">
                <div class="dateTitle">
                    <div class="dateLabelKo">
                        책 반납하는 날
                    </div>
                    <div class="dateLabelEn">
                        Return Day
                    </div>
                </div>
                <div class="dateValue">
                    <div>${fn:substring(returnMonth, 0, 1)}${fn:substring(returnMonth, 1, 2)}</div>
                    <div>월</div>
                    <div>${fn:substring(returnDay, 0, 1)}${fn:substring(returnDay, 1, 2)}</div>
                    <div>일</div>
                </div>
            </div>
        </div>
    </div>
    <div class="bookReturnCopyright">YEONGYANG Public Library</div>
</div>
</body>
</html>
