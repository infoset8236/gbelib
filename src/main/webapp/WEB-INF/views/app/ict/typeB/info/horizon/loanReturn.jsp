<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
          name="viewport" />
    <meta content="ie=edge" http-equiv="X-UA-Compatible" />
    <title>Document</title>
    <link href="/resources/ict/libraryBoard/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/slick.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/libraryBoard/css/slick-theme.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/libraryBoard/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/libraryBoard/plugin/slick.min.js"></script>
    <script src="/resources/ict/libraryBoard/js/common.js" type="text/javascript"></script>
</head>

<body>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
        href="https://fonts.googleapis.com/css2?family=Fjalla+One&family=Galada&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Roboto+Flex:opsz,wght@8..144,100..1000&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
<link href="/resources/ict/libraryBoard/css/loanReturn.css" rel="stylesheet" type="text/css" />

<div class="container">
    <div class="header">
        <div class="gray">BOOK RETURN DATE</div>
        <div class="black">대출반납일</div>
    </div>
    <div class="content">
        <div class="wrapper">
            <div class="num_wrapper">
                <div>${fn:substring(month, 0, 1)}</div>
                <div>${fn:substring(month, 1, 2)}</div>
            </div>
            <div class="num_wrapper">
                <div>${fn:substring(day, 0, 1)}</div>
                <div>${fn:substring(day, 1, 2)}</div>
            </div>
            <div class="text_wrapper">${loanDate}</div>
        </div>
        <div class="wrapper">
            <div class="num_wrapper">
                <div>${fn:substring(returnMonth, 0, 1)}</div>
                <div>${fn:substring(returnMonth, 1, 2)}</div>
            </div>
            <div class="num_wrapper">
                <div>${fn:substring(returnDay, 0, 1)}</div>
                <div>${fn:substring(returnDay, 1, 2)}</div>
            </div>
            <div class="text_wrapper">${returnDate}</div>
        </div>
    </div>
    <div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>