<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
		  name="viewport" />
	<meta content="ie=edge" http-equiv="X-UA-Compatible" />
	<title>Document</title>
	<link href="/resources/ict/libraryBoard/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/libraryBoard/css/font.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/libraryBoard/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/libraryBoard/css/slick.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/libraryBoard/css/slick-theme.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ict/libraryBoard/plugin/jquery-3.7.1.min.js"></script>
	<script src="/resources/ict/libraryBoard/plugin/slick.min.js"></script>
	<script src="/resources/ict/libraryBoard/js/common.js" type="text/javascript"></script>
</head>

<body>
<link href="/resources/ict/libraryBoard/css/information.css" rel="stylesheet" type="text/css" />

<div class="container">
	<div class="header">
		<div class="gray">INFORMATION</div>
		<div class="black">이용안내</div>
	</div>
	<div class="content">

	<c:choose>
	<c:when test="${context_path eq 'geic'}">
		<div class="wrapper">
			<div class="title">이용시간</div>
			<table>
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="33%">
				</colgroup>
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
					<td rowspan="2">09:00 - 18:00</td>
					<td rowspan="2">09:00 - 17:00</td>
				</tr>
				<tr>
					<td>종합자료실(3층)</td>
				</tr>
				<tr>
					<td>독도교육체험관(2층)</td>
					<td colspan="2">화~토 09:00 - 18:00</td>
				</tr>
				<tr>
					<td>열람실(2층)</td>
					<td colspan="2">08:00 - 22:00(동절기는 21:00)</td>
				</tr>
				</tbody>
			</table>
			<p style="font-size: 20px; margin: -50px 0 35px 0;">※ 동절기(11월 ~ 2월)</p>
			<div class="title">휴관일</div>
			<div class="list">
				<div class="list_item">정기휴관일: 매월 둘째 및 넷째 월요일</div>
				<div class="list_item">
					일요일을 제외한 법정공휴일<br>
					(단, 일요일이 국경일이나 공휴일과 겹치는 경우 휴관)
				</div>
				<div class="list_item">임시휴관일 : 기타 관장이 공고한 날</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="title">자료 대출ㆍ반납</div>
			<div class="list">
				<div class="list_item">이용대상 : 도서관 자관 회원 및 책이음 서비스 회원</div>
				<div class="list_item">
					대출권수 : 1인 10권<br>
					&ensp;•&ensp;자료 대출 권수 및 기간
				</div>
			</div>
			<table>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<thead>
				<tr>
					<th>자료실</th>
					<th>대출 권수 및 기간</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>종합자료실,<br>어린이자료실</td>
					<td class="left">
						도서: 1인 10권 14일<br>
						연속간행물 : 1인 2권 14일<br>
						* 과월호에 한해 대출, 연기 불가
					</td>
				</tr>
				</tbody>
			</table>
			<div class="list">
				<div class="list_item">
					대출기간: 14일(연기 불가)  
				</div>
				<div class="list_item">연체 반납 : 연체 반납 일수만큼 대출정지</div>
				<div class="list_item">
					도서 반납<br>
					- 자료실 운영시간 내 : 해당 자료실에 반납
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${context_path eq 'od'}">
		<div class="wrapper">
			<div class="title">이용시간</div>
			<table>
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="33%">
				</colgroup>
				<thead>
				<tr>
					<th>구분</th>
					<th colspan="2">이용시간</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td rowspan="2">종합자료실<br/>어린이자료실<br/>디지털자료실</td>
					<td>화 ~ 금</td>
					<td>09:00 - 18:00</td>
				</tr>
				<tr>
					<td>주말(토,일)</td>
					<td>09:00 - 17:00</td>
				</tr>
				<tr>
					<td>자유열람실</td>
					<td>1월~12월(화~일)</td>
					<td>09:00 ~ 22:00</td>
				</tr>
				</tbody>
			</table>
			<div class="title">휴관일</div>
			<div class="list">
				<div class="list_item">정기휴관일 : 매주 월요일</div>
				<div class="list_item">
					일요일을 제외한 관공서의 공휴일<br>
					(다만, 일요일과 관공서의 기타공휴일이 겹치는 경우 휴관)
				</div>
				<div class="list_item">특별한 사유로 관장이 지정한 날</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="title">자료 대출ㆍ반납</div>
			<div class="list">
				<div class="list_item">이용대상 : 경상북도민. 경주시 소재 학교 및 직장의 재학 또는 재직 중인 자</div>
				<div class="list_item">
					자료 대출 권수 및 기간
				</div>
			</div>
			<table>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<thead>
				<tr>
					<th>자료실</th>
					<th>대출 권수 및 기간</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>종합자료실(1층)<br/>어린이자료실(2층)</td>
					<td class="left">
						도서 : 1인 10원 14일(추가 연장불가)<br>
						연속간행물 : 1인 1권 7일(과월호에 한해 대출, 연기 불가)<br/>
						DVD : 1인 2점 7일(추가 연장불가)
					</td>
				</tr>
				</tbody>
			</table>
			<div class="list">
				<div class="list_item">대출 정지 : 반납예정일이 지난 경우 연체된 일수만큼 대출정지</div>
				<div class="list_item">자료 예약 : <br/>
				- 다른 회원이 대출중인 자료에 한해 자료예약 가능<br/>
				- 홈페이지, 방문 등의 방법으로 자료예약 신청</div>
				<div class="list_item">
					도서 반납<br>
					- 자료실 운영시간 내 : 해당 자료실에 반납<br/>
					- 무인 반납함 : 도서관 1층 현관 앞
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		준비중
	</c:otherwise>
	</c:choose>
	
	</div>
	<div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>