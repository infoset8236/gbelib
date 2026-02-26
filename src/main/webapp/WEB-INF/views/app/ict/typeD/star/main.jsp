<%@ page language="java" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/navigation.css?v=1.3">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/star/css/main.css?v=1.3">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="headerKoEnVert">
                <div>Constellation Library</div>
                <div tabindex="0">별빛서재</div>
            </div>
            <div class="content">
                <div class="shootingStar">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="title">
                    <div>별을 읽고, 책을 만나다</div>
                    <div>영양 밤하늘이 들려주는 12별자리 이야기와<br>당신을 위한 맞춤형 도서 큐레이션</div>
                </div>
                <div class="col">
                    <a class="btn" href="/${homepage.context_path}/ict/star/search.do">
                        <div>별자리를 담은 도서 큐레이션 보기</div>
                        <div>별자리와 관련된 도서 목록</div>
                    </a>
                    <div class="row">
                        <a class="btn" href="/${homepage.context_path}/ict/star/guide.do">
                            <div>12별자리 이야기<br>알아보기</div>
                            <div>수만 년의 신화와<br>별자리에 담긴 성격<br>키워드 탐험</div>
                        </a>
                        <a class="btn" href="/${homepage.context_path}/ict/star/myStar.do">
                            <div>나의 별자리<br>찾아보기</div>
                            <div>나의 생일을 입력하고<br>밤하늘이 들려주는<br>나의 별 찾기</div>
                        </a>
                    </div>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/star/nav.jsp"/>
        </div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>

