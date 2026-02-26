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
		<title>이용안내</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/information.css" />
		<link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script>
	</head>
	<body>
	<div class="info-wrap info detail_wrap info">
		<div class="header">
			<p>information</p>
			<h1>이용안내</h1>
		</div>
		<div class="content">
			<div class="scroll">
				<div class="wrapper">
					<div class="label">
						<div>이용시간</div>
					</div>
					<table class="time_table mb120">
						<thead>
						<tr>
							<th>구분</th>
							<th>평일(월~금)</th>
							<th>주말(토~일)</th>
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
							<td colspan="2">화~토 09:00 - 18:00</td>
						  </tr>
						  <tr>
							<td class="left_td">열람실(2층)</td>
							<td class="bold right_td" colspan="2">08:00 - 22:00(동절기는 21:00)</td>
						  </tr>
						</tbody>
					</table>
					<div class="label">
						<div>휴관일</div>
					</div>
					<div class="text_wrapper mb">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>정기휴관일 : 매주 월요일(자율학습실 사용가능)</div>
					</div>
					<div class="text_wrapper mb">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>
							일요일을 제외한 법정공휴일<br />
							(단, 일요일이 국경일이나 공휴일과 겹치는 경우 휴관)
						</div>
					</div>
					<div class="text_wrapper">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png           " />
						<div>임시휴관일 : 기타 관장이 공고한 날</div>
					</div>
				</div>
				<div class="wrapper">
					<div class="label">
						<div>자료 대출ㆍ반납</div>
					</div>
					<div class="text_wrapper mb">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>이용대상 : 도서관 자관 회원 및 책이음 서비스 회원</div>
					</div>
					<div class="text_wrapper">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>
							대출권수 : 1인 10권<br />
							• 자료 대출 권수 및 기간
						</div>
					</div>
					<table class="time_table mb120 margin">
						<thead>
						<tr>
							<th>자료실</th>
							<th>대출 권수 및 기간</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="left_td">종합자료실,<br />어린이자료실</td>
							<td class="left right_td">
								도서 : 1인 10원 14일<br />
								- 1회 주간 연기 가능, 단 예약자료는 제외<br />
								연속간행물 : 1인 2권 14일<br />
								* 과월호에 한해 대출, 연기 불가
							</td>
						</tr>
						</tbody>
					</table>
					<div class="text_wrapper mb">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>대출 기간 : 14일 (DVD는 7일)<br />* 예약자가 없는 경우 1인 1회에 한해 7일 연기 가능</div>
					</div>
					<div class="text_wrapper mb">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>연체 반납 : 연체 반납 일수만큼 대출정지</div>
					</div>
					<div class="text_wrapper">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_b/common/check_02.png" />
						<div>도서 반납<br />- 자료실 운영시간 내 : 해당 자료실에 반납<br />- 자료실 운영시간 외 : 도서관 입구 반납함 이용가능<br />* 스마트도서관 도서는 스마트도서관에 직접 반납</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp"/>

	</body>

</html>