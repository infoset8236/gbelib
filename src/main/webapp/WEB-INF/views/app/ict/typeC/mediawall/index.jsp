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
		<link href="/resources/ict/mediawall/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/js/type_c/script.js" type="text/javascript"></script>
		<title>환영메시지</title>
	</head>
	<body>
	<div class="media_main_container">
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr">환영메세지</div>
				<div class="media_common_header_en">WELCOME</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time"></div>
				<div class="media_common_header_date"></div>
			</div>
		</div>
		<div class="media_main_message"><span>${homepage.homepage_name}</span><br />방문을 환영합니다</div>
		<div class="media_main_caption">welcome to ${homepage.homepage_eng_name} LIBRARY</div>
		<%--<div class="media_main_ticker">
			<div class="media_main_ticker_message">
				도서관초대석 &lt;불편한편의점&gt; 일정이 김호연 작가의 개인사정으로 인해 변경되었습니다. 이용에 참고하여 주시기 바랍니다. 여기는 텍스트 흘러가는 티커영역 입니다. 긴급 공지용으로
				사용해주세요!
			</div>
		</div>--%>
	</div>
	</body>
</html>