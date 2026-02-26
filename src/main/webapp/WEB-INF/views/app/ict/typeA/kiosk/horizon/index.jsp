<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>${homepage.homepage_name} ICT 도서관</title>
		<link href="/resources/ict/kioskHorizon/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskHorizon/css/type_a/welcome_message.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/welcome_message.js" type="text/javascript"></script>
	</head>
	<body>
	<div class="container">
		<div class="wrapper">
			<div class="time">09:57</div>
			<div class="date">5월 27일 월요일</div>
		</div>
		<div class="wrapper">
			<div class="title">welcome</div>
			<div class="caption">${homepage.homepage_eng_name} LIBRARY</div>
		</div>
		<div class="arrow" onclick="location.href='/${homepage.context_path}/ict/kiosk/horizon/notice.do'"></div>
	</div>
	</body>
</html>