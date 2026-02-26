<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
    <title>Document</title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/typeE/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/ulStyle.css?v=20251210" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/loanReturn.css?v=20251210" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/slick-theme.css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/typeD/mediawall/plugin/slick.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/info/js/loanReturn.js" type="text/javascript"></script>
</head>
<body>

<div class="libReturnContainer">
    <div class="libHeader">
        <div class="libHeaderEn">BOOK RETURN DATE</div>
        <div class="libHeaderKo">대출반납일</div>
    </div>
    <div class="libReturnInner">
        <div class="libReturnContent">
            <div class="libReturnLabel">
                <div class="libReturnLabelKo">대출일</div>
                <div class="libReturnLabelEn">loan date</div>
            </div>
            <div class="libReturnNumberArea">
                <div class="libReturnNumberWrapper">
                    <div class="libReturnNumber">${fn:substring(month, 0, 1)}</div>
                    <div class="libReturnNumber">${fn:substring(month, 1, 2)}</div>
                </div>
                <div class="libReturnNumberWrapper">
                    <div class="libReturnNumber">${fn:substring(day, 0, 1)}</div>
                    <div class="libReturnNumber">${fn:substring(day, 1, 2)}</div>
                </div>
            </div>
        </div>
        <div class="libReturnContent">
            <div class="libReturnLabel">
                <div class="libReturnLabelKo">반납일</div>
                <div class="libReturnLabelEn">Return date</div>
            </div>
            <div class="libReturnNumberArea">
                <div class="libReturnNumberWrapper">
                    <div class="libReturnNumber">${fn:substring(returnMonth, 0, 1)}</div>
                    <div class="libReturnNumber">${fn:substring(returnMonth, 1, 2)}</div>
                </div>
                <div class="libReturnNumberWrapper">
                    <div class="libReturnNumber">${fn:substring(returnDay, 0, 1)}</div>
                    <div class="libReturnNumber">${fn:substring(returnDay, 1, 2)}</div>
                </div>
            </div>
        </div>
    </div>
    <div class="libCopyright">Yecheon Public Library</div>
</div>


</body>
</html>