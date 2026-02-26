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
	<div class="kiosk_information_container">
		<div class="kiosk_common_header_wrapper">
			<div class="kiosk_common_header_kr">이용안내</div>
			<div class="kiosk_common_header_en">LIBRARY INFORMATION</div>
		</div>
		<div class="kiosk_information_content">
			<div class="kiosk_information_content_scroll">
				<div>
					<div class="kiosk_information_index_wrapper">
						<div class="kiosk_information_index">
							<div class="kiosk_information_index_icon"></div>
							<div class="kiosk_information_index_text">01</div>
						</div>
						<div class="kiosk_information_index_title">이용시간</div>
					</div>
					<div class="kiosk_information_content_wrapper">
						<div class="kiosk_information_title">각 실별 이용시간</div>
						<table class="kiosk_information_first_table">
							<thead>
							<tr>
								<th>구분</th>
								<th>평일(월~금)</th>
								<th>주말(토/일)</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td class="bold">어린이자료실(1층)</td>
								<td>09:00 - 18:00</td>
								<td rowspan="2">09:00 - 17:00</td>
							</tr>
							<tr>
								<td class="bold">종합자료실(3층)</td>
								<td>09:00 - 19:00</td>
							</tr>
							<tr>
								<td class="bold" rowspan="2">열람실(2층)</td>
								<td colspan="2">08:00 - 22:00(동절기 21:00)</td>
							</tr>
							</tbody>
						</table>
						<div class="kiosk_information_title">휴관일</div>
						<div class="kiosk_information_list">
							<div class="kiosk_information_list_item">
								<div class="kiosk_information_list_item_icon"></div>
								<div class="kiosk_information_list_item_text">정기휴관일 : 매월 둘째 및 넷째 월요일</div>
							</div>
							<div class="kiosk_information_list_item">
								<div class="kiosk_information_list_item_icon"></div>
								<div class="kiosk_information_list_item_text">일요일을 제외한 공휴일(단, 일요일과 관공서의 공휴일이 겹치는 경우 휴관)</div>
							</div>
							<div class="kiosk_information_list_item">
								<div class="kiosk_information_list_item_icon"></div>
								<div class="kiosk_information_list_item_text">국가의 임시공휴일 또는 특별한 사유로 관장이 지정하여 공고하는 날</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="kiosk_information_index_wrapper">
						<div class="kiosk_information_index">
							<div class="kiosk_information_index_icon"></div>
							<div class="kiosk_information_index_text">02</div>
						</div>
						<div class="kiosk_information_index_title">자료이용</div>
					</div>
					<div class="kiosk_information_content_wrapper">
						<div class="kiosk_information_title">대출</div>
						<div class="kiosk_information_list">
							<div class="kiosk_information_list_item">
								<div class="kiosk_information_list_item_icon"></div>
								<div class="kiosk_information_list_item_text">
									대출권수 : 1인 10권 이내 <br />
									• 가족회원제 : 2인 이상이 우리 센터 관외대출회원으로 가입된 경우 가족임을 확인할 수 있는 서류 (주민등록등본 또는 가족관계증명서) 제시 후 가족회원으로 등록 후 가족 구성원 1명(중학생
									이상)이 자료 일괄 대출 가능
								</div>
							</div>
							<div class="kiosk_information_list_item">
								<div class="kiosk_information_list_item_icon"></div>
								<div class="kiosk_information_list_item_text">스마트무인도서관 : 1인 2권 이내(24시간 운영), 회원증(모바일회원증) 스캔 후 이용</div>
							</div>
						</div>
						<table class="kiosk_information_second_table">
							<thead>
							<tr>
								<th>구분</th>
								<th>내용</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td class="bold">대출기한</td>
								<td>14일간(연장불가)</td>
							</tr>
							<tr>
								<td class="bold">반납연체</td>
								<td>반납예정일을 넘길 경우 연체일 만큼 대출정지</td>
							</tr>
							<tr>
								<td class="bold">대출도서 분실</td>
								<td>동일 자료로 변상</td>
							</tr>
							<tr>
								<td class="bold">휴관일</td>
								<td>관내 대출불가, 스마트무인도서관 이용가능</td>
							</tr>
							</tbody>
						</table>
						<div class="kiosk_information_title">예약/취소</div>
						<div class="kiosk_information_list">
							<div class="kiosk_information_list_item">
								<div class="kiosk_information_list_item_icon"></div>
								<div class="kiosk_information_list_item_text">
									예약도서 신청 <br />
									• 대출 중인 도서에 한하여 1인 3권, 1책당 5명 예약 가능
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/userNav.jsp"/>
	</div>
	</body>
</html>