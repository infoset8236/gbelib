<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
    <title>환영합니다</title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/typeE/kiosk/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/kiosk/css/main.css?v=2" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/common/css/common.css" rel="stylesheet" type="text/css " />
    <script src="/resources/ict/typeE/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script defer src="/resources/ict/kioskVertical/js/type_b/info/common/navigation.js" type="text/javascript"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.3"></script>
</head>
<body>
<div class="dim">
    <div id="container">
        <div class="lib_main_container">
            <div class="lib_main_top">
                <div class="lib_main_time"></div>
                <div class="lib_main_date"></div>
            </div>
            <div class="lib_main_bottom" style="padding-top: 4.47rem;">
                <div class="lib_main_title">예천도서관에<br />
                    오신 것을 환영합니다.
                </div>
                <div class="lib_main_caption">Welcome to ${homepage.homepage_eng_name} Public Library</div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
<jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp"/>
</body>
</html>