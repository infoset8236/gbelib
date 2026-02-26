<%@ page language="java" pageEncoding="utf-8" %>

<h2>이용시간</h2>
<table class="center" summary="구분, 요일, 이용시간에 나눈 도서관 이용시간 안내 표입니다.">
	<caption>이용시간</caption>
	<colgroup>
		<col width="30%" />
		<col width="" />
        <col width="" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">실별</th>
			<th scope="col">평일(화~금)</th>
			<th scope="col">주말(토,일요일)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="item fb">종합자료실</td>
			<td rowspan="3">09:00 ~ 18:00</td>
			<td rowspan="3">09:00 ~ 17:00</td>
		</tr>
		<tr>
			<td class="item fb">디지털자료실</td>
		</tr>
		<tr>
			<td class="item fb">연속간행물실<br>참고자료실</td>
		</tr>
		<tr>
			<td class="item fb">열람실</td>
			<td colspan="2">09:00 ~ 21:00</td>
		</tr>
	
	</tbody>
</table>
<br/>
<h2>휴관일</h2>
<ul class="con lpad02">
	<li>매주 월요일</li>
	<li>일요일을 제외한 관공서의 공휴일 <br />(단, 일요일과 기타 공휴일이 겹치는 경우에는 휴관)</li>
	<li>특별한 사유로 도서관장이 지정한 날</li>
	<li><b>임시휴관일</b> : 특별한 사유로 도서관장이 지정하는 날</li>
</ul>