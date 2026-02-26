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
		<link href="/resources/ict/mediawall/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_b/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_b/house_of_operation.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<title>운영시간</title>
	</head>
	<body>
	<div class="div_wrap info-wrap" id="fade-effect">
		<div class="bg_oper_01"></div>
		<img class="bg_oper_02" src="/resources/ict/mediawall/img/type_b/house_of_operation/bg_hour.png" />
		<div class="header_wrap">
			<div class="header_frame">
				<div class="header_group">
					<div class="ict_tit_01">이용안내</div>
					<div class="ict_tit">HOURS OF OPERATION</div>
				</div>
			</div>
		</div>
		<div class="notice_oper">
			<div class="oper_tit">실별 이용시간</div>
			<table class="table">
				<thead>
				<tr>
					<th class="left-top">구분</th>
					<th class="middle">평일(월 ~ 금)</th>
					<th class="right-top">주말(토 ~ 일)</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>어린이자료실(1층)</td>
					<td>09:00 - 18:00</td>
					<td rowspan="2">09:00 - 17:00</td>
				</tr>
				<tr>
					<td>종합자료실(3층)</td>
					<td>09:00 - 19:00</td>
				</tr>
				<tr>
					<td>독도교육체험관(2층)</td>
					<td colspan="2">화 ~ 토 09:00 - 18:00</td>
				</tr>
				<tr>
					<td class="first under">열람실(2층)</td>
					<td class="last under_02" colspan="2">08:00 - 22:00(동절기는 21:00)</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	</body>
</html>