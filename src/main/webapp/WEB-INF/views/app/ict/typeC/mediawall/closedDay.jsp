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
		<title>운영시간</title>
	</head>
	<body>
	<div class="media_information_container">
		<!--	 공통 헤더 / 배경 색상마다 폰트 컬러가 달라 media_common_black 클래스 추가됨	 	-->
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr media_common_black">이용안내</div>
				<div class="media_common_header_en">HOURS OF OPERATION</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time media_common_black"></div>
				<div class="media_common_header_date media_common_black"></div>
			</div>
		</div>
		<!--	운영시간 안내 테이블		-->
		<div class="media_information_table_title">자료실 운영시간 안내</div>
		<div class="media_information_table_header">
			<div class="media_information_table_header_cell">자료실명</div>
			<div class="media_information_table_header_cell">평 일</div>
			<div class="media_information_table_header_cell">토ㆍ일요일</div>
		</div>
		<div class="media_information_table_row media_information_border">
			<div class="media_information_table_row_cell">유아ㆍ어린이자료실</div>
			<div class="media_information_table_row_cell">09:00 ~ 18:00</div>
			<div class="media_information_table_row_cell">09:00 ~ 18:00</div>
		</div>
		<div class="media_information_table_row media_information_border">
			<div class="media_information_table_row_cell">유아ㆍ어린이자료실</div>
			<div class="media_information_table_row_cell">09:00 ~ 18:00</div>
			<div class="media_information_table_row_cell">09:00 ~ 18:00</div>
		</div>
		<div class="media_information_table_row media_information_border_radius">
			<div class="media_information_table_row_cell">유아ㆍ어린이자료실</div>
			<div class="media_information_table_row_cell">09:00 ~ 18:00</div>
			<div class="media_information_table_row_cell">09:00 ~ 18:00</div>
		</div>
		<div class="media_information_boat"></div>
	</div>
	</body>
</html>