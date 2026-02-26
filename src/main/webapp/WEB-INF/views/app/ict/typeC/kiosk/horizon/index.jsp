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
	<link href="/resources/ict/kioskVertical/css/type_c/font.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskVertical/css/type_c/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskVertical/css/type_c/styles.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskVertical/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
	<script src="/resources/ict/kioskVertical/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
	<script src="/resources/ict/kioskVertical/js/type_c/script.js" type="text/javascript"></script>
	<title>Document</title>
</head>
<body>
<div class="kiosk_main_container_x">
	<div class="kiosk_main_time_x">09:52</div>
	<div class="kiosk_main_date_x">2024. 09. 10. 화요일</div>
	<div class="kiosk_main_message_x"><span>${homepage.homepage_name}</span><br />방문을 환영합니다</div>
	<div class="kiosk_main_caption_x">welcome to ${homepage.homepage_eng_name} library</div>
	<!--	 네비게이션 버튼		-->
	<div class="kiosk_main_arrow_x" onclick="location.href='/${homepage.context_path}/ict/kiosk/horizon/notice.do'"></div>
</div>
</body>
</html>