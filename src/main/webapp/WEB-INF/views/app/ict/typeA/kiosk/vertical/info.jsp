<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
		<title>이용안내</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/information.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css " />
	</head>
	<body>
	<div class="info-wrap info">
		<div class="header">
			<p>library information</p>
			<h1>이용안내</h1>
		</div>
		<div class="contents">
			<div class="culture-inner-box">
				<!-- 이용시간 -->
				<div class="txt-box">
					<div class="title-box">
						<h4>이용시간</h4>
					</div>
					<div class="cont-box">
						<table class="">
							<thead>
							<tr>
								<th class="left-top">구분</th>
								<th>평일</th>
								<th class="right-top">토ㆍ일요일</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>유아ㆍ어린이자료실</td>
								<td>09:00 ~ 18:00</td>
								<td>09:00 ~ 17:00</td>
							</tr>
							<tr>
								<td>종합자료실</td>
								<td>09:00 ~ 20:00</td>
								<td>09:00 ~ 17:00</td>
							</tr>
							<tr>
								<td class="first">인문자료실</td>
								<td>09:00 ~ 22:00</td>
								<td class="last">09:00 ~ 17:00</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- //이용시간// -->
				<!-- 휴관일 -->
				<div class="txt-box">
					<div class="title-box">
						<h4>휴관일</h4>
					</div>
					<div class="cont-box">
						<ul>
							<li>정기휴관일 : 매주 월요일(자율학습실 사용가능)</li>
							<li>일요일을 제외한 법정공휴일<br />(단, 일요일이 국경일이나 공휴일과 겹치는 경우 휴관)</li>
							<li>임시휴관일 : 기타 관장이 공고한 날</li>
						</ul>
					</div>
				</div>
				<!-- //휴관일// -->
				<!-- 도서대출반납 -->
				<div class="txt-box">
					<div class="title-box">
						<h4>자료<br />대출ㆍ반납</h4>
					</div>

					<div class="cont-box">
						<ul>
							<li>이용대상 : 도서관 자관 회원 및 책이음 서비스 회원</li>
							<li>대출권수 : 1인 10권<br />ㆍ자료 대출권수 및 기간</li>
						</ul>
						<table class="under_table">
							<thead>
							<tr>
								<th class="left-top">자료실</th>
								<th class="right-top">대출권수 및 기간</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td class="first">종합자료실,<br />어린이자료실</td>
								<td class="last" style="text-align: left">
									도서 : 1인 10권 14일<br />- 1회 1주간 연기 가능, 단 예약자료는 제외<br />연속간행물 : 1인 2권 14일<br />※ 과월호에 한해 대출, 연기 불가
								</td>
							</tr>
							</tbody>
						</table>

						<ul>
							<li>대출 기간 : 14일 (DVD는 7일)<br />※ 예약자가 없는 경우 1인 1회에 한해 7일 연기 가능</li>
							<li>연체 반납 : 연체 반납 일수만큼 대출정지</li>
							<li>
								도서 반납<br />- 자료실 운영시간 내 : 해당 자료실에 반납<br />- 자료실 운영시간 외 : 도서관 입구 반납함 이용가능<br />
								※ 스마트도서관 도서는 스마트도서관에 직접 반납
							</li>
						</ul>
					</div>
				</div>
				<!-- //도서대출반납// -->
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/nav.jsp"/>

	</body>
</html>