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
<link href="/resources/ict/libraryBoard/css/main.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/js/main.js"></script>

<div class="container">

    <div class="time"></div>
    <div class="date"></div>

    <div class="title">${homepage.homepage_name}에 오신 것을 환영합니다.</div>
    <div class="caption">Welcome to Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>